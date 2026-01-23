package com.set.servlet;

import com.set.dao.InvoiceDao;
import com.set.model.InvoiceModel;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("text/plain");

        /* ================= SESSION CHECK ================= */
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session expired");
            return;
        }

        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if (role == null) {
            role = "Verifier"; // SAFE DEFAULT
        }

        /* ================= HEADER FIELDS ================= */
        String vendorName = request.getParameter("vendorName");
        String invoiceNumber = request.getParameter("invoiceNumber");
        String invoiceDate = request.getParameter("invoiceDate");
        String poNumber = request.getParameter("poNumber");

        double invoiceTotal = 0.0;
        String invoiceTotalStr = request.getParameter("invoiceTotal");
        if (invoiceTotalStr != null && !invoiceTotalStr.trim().isEmpty()) {
            invoiceTotal = Double.parseDouble(invoiceTotalStr);
        }

        boolean imageNotClear = request.getParameter("imageNotClear") != null;
        String actionStatus = request.getParameter("actionStatus");

        /* ================= TIME ================= */
        String startTime = LocalTime.now().toString();
        String endTime = LocalTime.now().toString();
        String processedDate = LocalDate.now().toString();

        /* ================= TABLE ARRAYS ================= */
        String[] itemNos = request.getParameterValues("itemNo");
        String[] itemNames = request.getParameterValues("itemName");
        String[] qtys = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");
        String[] cgsts = request.getParameterValues("cgst");
        String[] sgsts = request.getParameterValues("sgst");
        String[] totals = request.getParameterValues("total");

        if (itemNos == null) {
            response.getWriter().write("No items received from UI");
            return;
        }

        InvoiceDao dao = new InvoiceDao();
        int savedCount = 0;

        for (int i = 0; i < itemNos.length; i++) {

            if (itemNos[i] == null || itemNos[i].trim().isEmpty()) {
                continue;
            }

            InvoiceModel model = new InvoiceModel();

            model.setUsername(username);
            model.setUserRole(role);

            model.setImageId(1);
            model.setImagePath("images/sample-invoice.png");

            model.setVendorName(vendorName);
            model.setInvoiceNumber(invoiceNumber);
            model.setInvoiceDate(invoiceDate);
            model.setPoNumber(poNumber);
            model.setInvoiceTotal(invoiceTotal);

            model.setItemNo(itemNos[i]);
            model.setItemName(itemNames[i]);
            model.setQuantity(Integer.parseInt(qtys[i]));
            model.setPrice(Double.parseDouble(prices[i]));
            model.setCgst(Double.parseDouble(cgsts[i]));
            model.setSgst(Double.parseDouble(sgsts[i]));
            model.setItemTotal(Double.parseDouble(totals[i]));

            model.setImageNotClear(imageNotClear);
            model.setActionStatus(actionStatus);
            model.setHoldReason(null);

            model.setStartTime(startTime);
            model.setEndTime(endTime);
            model.setProcessedDate(processedDate);

            try {
                dao.saveInvoiceProcessing(model);
                savedCount++;
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("DB Error while saving data");
                return;
            }
        }

        response.getWriter().write(
            "SUCCESS: " + savedCount + " item(s) saved with status " + actionStatus
        );
    }
}
