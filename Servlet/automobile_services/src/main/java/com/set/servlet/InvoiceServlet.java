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
        if (role == null) role = "Verifier";

        /* ================= HEADER FIELDS ================= */
        String vendorName = request.getParameter("vendorName");
        String invoiceNumber = request.getParameter("invoiceNumber");
        String invoiceDate = request.getParameter("invoiceDate");
        String poNumber = request.getParameter("poNumber");

        /* ================= TOTALS ================= */
        double invoiceTotal = parseDouble(request.getParameter("invoiceTotal"));
        double subTotal = parseDouble(request.getParameter("subTotal"));

        boolean imageNotClear = request.getParameter("imageNotClear") != null;
        String actionStatus = request.getParameter("actionStatus");

        /* ================= TIME ================= */
        String startTime = LocalTime.now().toString();
        String endTime = LocalTime.now().toString();
        String processedDate = LocalDate.now().toString();

        /* ================= ITEM ARRAYS ================= */
        String[] itemNos = request.getParameterValues("itemNo");
        String[] itemNames = request.getParameterValues("itemName");
        String[] qtys = request.getParameterValues("quantity");
        String[] prices = request.getParameterValues("price");
        String[] cgsts = request.getParameterValues("cgst");
        String[] sgsts = request.getParameterValues("sgst");
        String[] totals = request.getParameterValues("total");

        if (itemNos == null || itemNos.length == 0) {
            response.getWriter().write("ERROR: No items received");
            return;
        }

        /* ================= BUILD COMMA-SEPARATED VALUES (SAFE) ================= */
        StringBuilder itemNoSb = new StringBuilder();
        StringBuilder itemNameSb = new StringBuilder();
        StringBuilder qtySb = new StringBuilder();
        StringBuilder priceSb = new StringBuilder();
        StringBuilder cgstSb = new StringBuilder();
        StringBuilder sgstSb = new StringBuilder();
        StringBuilder totalSb = new StringBuilder();

        for (int i = 0; i < itemNos.length; i++) {

            // ✅ Skip completely empty rows
            boolean isItemNoEmpty = itemNos[i] == null || itemNos[i].trim().isEmpty();
            boolean isItemNameEmpty = itemNames[i] == null || itemNames[i].trim().isEmpty();

            if (isItemNoEmpty && isItemNameEmpty) {
                continue;
            }

            append(itemNoSb, itemNos[i]);
            append(itemNameSb, itemNames[i]);
            append(qtySb, qtys[i]);
            append(priceSb, prices[i]);
            append(cgstSb, cgsts[i]);
            append(sgstSb, sgsts[i]);
            append(totalSb, totals[i]);
        }

        // ✅ If ALL rows were empty
        if (itemNoSb.length() == 0) {
            response.getWriter().write("ERROR: No valid item rows entered");
            return;
        }

        /* ================= MODEL ================= */
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
        model.setSubTotal(subTotal);

        model.setItemNo(itemNoSb.toString());
        model.setItemName(itemNameSb.toString());
        model.setQuantity(qtySb.toString());
        model.setPrice(priceSb.toString());
        model.setCgst(cgstSb.toString());
        model.setSgst(sgstSb.toString());
        model.setItemTotal(totalSb.toString());

        model.setImageNotClear(imageNotClear);
        model.setActionStatus(actionStatus);
        model.setHoldReason(null);

        model.setStartTime(startTime);
        model.setEndTime(endTime);
        model.setProcessedDate(processedDate);

        /* ================= SAVE ================= */
        InvoiceDao dao = new InvoiceDao();
        boolean saved = dao.saveInvoiceProcessing(model);

        if (saved) {
            response.getWriter().write(
                "SUCCESS: Invoice saved successfully with status " + actionStatus
            );
        } else {
            response.getWriter().write("ERROR: Failed to save invoice");
        }
    }

    /* ================= APPEND HELPER ================= */
    private void append(StringBuilder sb, String value) {
        if (sb.length() > 0) sb.append(",");
        sb.append(value == null ? "" : value.trim());
    }

    /* ================= SAFE DOUBLE PARSE ================= */
    private double parseDouble(String val) {
        try {
            return (val == null || val.trim().isEmpty())
                    ? 0.0
                    : Double.parseDouble(val);
        } catch (Exception e) {
            return 0.0;
        }
    }
}
