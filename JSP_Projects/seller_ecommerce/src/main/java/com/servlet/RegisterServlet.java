package com.servlet;

import java.io.IOException;

import com.dao.RegisterDAO;
import com.model.RegisterModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    // ==================================================
    // ✅ LIVE CHECK (AJAX REQUESTS)
    // ==================================================

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String check = request.getParameter("check");

        RegisterDAO dao = new RegisterDAO();

        // ✅ EMAIL LIVE CHECK
        if("email".equals(check)){

            String email = request.getParameter("email");

            if(dao.emailExists(email)){
                response.getWriter().write("exists");
            }else{
                response.getWriter().write("ok");
            }
            return;
        }

        // ✅ GST LIVE CHECK
        if("gst".equals(check)){

            String gst = request.getParameter("gst");

            if(dao.gstExists(gst)){
                response.getWriter().write("exists");
            }else{
                response.getWriter().write("ok");
            }
            return;
        }

        // ✅ PHONE LIVE CHECK
        if("phone".equals(check)){

            String phone = request.getParameter("phone");

            if(dao.phoneExists(phone)){
                response.getWriter().write("exists");
            }else{
                response.getWriter().write("ok");
            }
            return;
        }
    }

    // ==================================================
    // ✅ REGISTER SUBMIT
    // ==================================================

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String gstnumber = request.getParameter("gstnumber");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if(username == null || gstnumber == null || email == null ||
           phoneno == null || password == null || confirmPassword == null){

            response.sendRedirect("register.jsp?error=failed");
            return;
        }

        username = username.trim();
        gstnumber = gstnumber.trim().toUpperCase();
        email = email.trim();
        phoneno = phoneno.trim();

        RegisterDAO dao = new RegisterDAO();

        // ================= DUPLICATE CHECK =================

        if(dao.emailExists(email)){
            response.sendRedirect(
            "register.jsp?error=email_exists"+
            "&username="+username+
            "&gstnumber="+gstnumber+
            "&email="+email+
            "&phoneno="+phoneno
            );
            return;
        }

        if(dao.phoneExists(phoneno)){
            response.sendRedirect(
            "register.jsp?error=phone_exists"+
            "&username="+username+
            "&gstnumber="+gstnumber+
            "&email="+email+
            "&phoneno="+phoneno
            );
            return;
        }

        if(dao.gstExists(gstnumber)){
            response.sendRedirect(
            "register.jsp?error=gst_exists"+
            "&username="+username+
            "&gstnumber="+gstnumber+
            "&email="+email+
            "&phoneno="+phoneno
            );
            return;
        }

        // ================= PHONE VALIDATION =================

        String phoneRegex = "^[6-9][0-9]{9}$";

        if(!phoneno.matches(phoneRegex)){
            response.sendRedirect("register.jsp?error=phone&username="+username+"&email="+email+"&phoneno="+phoneno+"&gstnumber="+gstnumber);
            return;
        }

        // ================= GST VALIDATION =================

        if(!gstnumber.matches("^[A-Z0-9]{15}$")){
            response.sendRedirect("register.jsp?error=gst&username="+username+"&email="+email+"&phoneno="+phoneno+"&gstnumber="+gstnumber);
            return;
        }

        // ================= PASSWORD CHECK =================

        if(!password.equals(confirmPassword)){
            response.sendRedirect("register.jsp?error=pass_mismatch&username="+username+"&email="+email+"&phoneno="+phoneno+"&gstnumber="+gstnumber);
            return;
        }

        String strongPasswordRegex =
                "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&]).{8,}$";

        if(!password.matches(strongPasswordRegex)){
            response.sendRedirect("register.jsp?error=weak_pass&username="+username+"&email="+email+"&phoneno="+phoneno+"&gstnumber="+gstnumber);
            return;
        }

        // ================= SAVE =================

        RegisterModel model = new RegisterModel();
        model.setUsername(username);
        model.setGstnumber(gstnumber);
        model.setEmail(email);
        model.setPhoneno(phoneno);
        model.setPassword(password);

        int sellerId = dao.register(model);

        if(sellerId > 0){

            HttpSession session = request.getSession();
            session.setAttribute("sellerId", sellerId);

            response.sendRedirect("businessdetails.jsp?success=registered");

        }else{

            response.sendRedirect("register.jsp?error=failed");
        }
    }
}