package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.QcInvoiceWorkflow;
import com.dao.QcInvoiceDetailsDAO;
import com.model.InvoiceImageModel;
import com.model.InvoiceDetailsModel;

@WebServlet("/qc")   // ✅ clean URL
public class QCLoaderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String qcUser = (session != null) ? (String) session.getAttribute("username") : null;

        if (qcUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        QcInvoiceWorkflow workflow = new QcInvoiceWorkflow();
        InvoiceImageModel img = workflow.getRandomInvoiceForQc(qcUser);

        if (img == null) {
            request.setAttribute("noQcData", true);
            request.getRequestDispatcher("qc_invoice_ui.jsp").forward(request, response);
            return;
        }

        QcInvoiceDetailsDAO detailsDao = new QcInvoiceDetailsDAO();
        InvoiceDetailsModel inv = detailsDao.getInvoiceDetailsForQc(img.getImageId());

        if (inv == null) {
            System.out.println(
                "QC ERROR: invoice_details missing for image_id = " + img.getImageId()
            );
            request.setAttribute("noQcData", true);
            request.getRequestDispatcher("qc_invoice_ui.jsp").forward(request, response);
            return;
        }

        request.setAttribute("image", img);
        request.setAttribute("invoice", inv);

        request.getRequestDispatcher("qc_invoice_ui.jsp")
               .forward(request, response);
    }
}