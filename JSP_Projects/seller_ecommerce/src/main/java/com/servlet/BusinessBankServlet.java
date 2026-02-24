
package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.BusinessBankDAO;
import com.model.BusinessBankModel;

@WebServlet("/BusinessBankServlet")
public class BusinessBankServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("sellerId") == null) {
            response.sendRedirect("register.jsp");
            return;
        }

        int sellerId = (int) session.getAttribute("sellerId");

        String accountType = request.getParameter("account_type");
        String holderName = request.getParameter("account_holder_name");
        String bankName = request.getParameter("bank_name");
        String branchName = request.getParameter("branch_name");
        String ifscCode = request.getParameter("ifsc").toUpperCase();
        String accountNumber = request.getParameter("account_number");
        String confirmAccountNumber = request.getParameter("confirm_account_number");

        // 1️ Account number format validation (9–18 digits)
        if (!accountNumber.matches("^[0-9]{9,18}$")) {
            response.sendRedirect("businessdetails.jsp?error=acc_invalid");
            return;
        }

        // 2️ Account number match validation
        if (!accountNumber.equals(confirmAccountNumber)) {
            response.sendRedirect("businessdetails.jsp?error=acc_mismatch");
            return;
        }

        // 3️ IFSC validation
        if (!ifscCode.matches("^[A-Z]{4}0[A-Z0-9]{6}$")) {
            response.sendRedirect("businessdetails.jsp?error=ifsc");
            return;
        }

        BusinessBankModel model = new BusinessBankModel();
        model.setSellerId(sellerId);
        model.setAccountType(accountType);
        model.setAccountHolderName(holderName);
        model.setBankName(bankName);
        model.setBranchName(branchName);
        model.setIfscCode(ifscCode);
        model.setAccountNumber(accountNumber);

        BusinessBankDAO dao = new BusinessBankDAO();

        if (dao.saveBankDetails(model)) {
            session.invalidate(); // onboarding complete
            response.sendRedirect("login.jsp?success=onboarded");
        } else {
            response.sendRedirect("businessdetails.jsp?error=failed");
        }
    }
}
