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

        /* ================= INVOICE DATE VALIDATION ================= */
        if (!isInvoiceDateBeforeToday(invoiceDate)) {
            response.getWriter().write(
                "ERROR: Invoice date must be before today (up to yesterday only)"
            );
            return;
        }

        /* ================= INVOICE TOTAL ================= */
        double invoiceTotal = 0.0;
        String invoiceTotalStr = request.getParameter("invoiceTotal");
        if (invoiceTotalStr != null && !invoiceTotalStr.trim().isEmpty()) {
            invoiceTotal = Double.parseDouble(invoiceTotalStr);
        }

        /* ================= SUB TOTAL ================= */
        double subTotal = 0.0;
        String subTotalStr = request.getParameter("subTotal");
        if (subTotalStr != null && !subTotalStr.trim().isEmpty()) {
            subTotal = Double.parseDouble(subTotalStr);
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
            response.getWriter().write("ERROR: No items received from UI");
            return;
        }

        InvoiceDao dao = new InvoiceDao();
        int savedCount = 0;

        /* ================= SAVE ONE ROW PER ITEM ================= */
        for (int i = 0; i < itemNos.length; i++) {

            if (itemNos[i] == null || itemNos[i].trim().isEmpty()) {
                continue;
            }

            int quantity = (qtys != null && qtys[i] != null && !qtys[i].trim().isEmpty())
                    ? Integer.parseInt(qtys[i]) : 0;

            double price = (prices != null && prices[i] != null && !prices[i].trim().isEmpty())
                    ? Double.parseDouble(prices[i]) : 0.0;

            double cgst = (cgsts != null && cgsts[i] != null && !cgsts[i].trim().isEmpty())
                    ? Double.parseDouble(cgsts[i]) : 0.0;

            double sgst = (sgsts != null && sgsts[i] != null && !sgsts[i].trim().isEmpty())
                    ? Double.parseDouble(sgsts[i]) : 0.0;

            double itemTotal = (totals != null && totals[i] != null && !totals[i].trim().isEmpty())
                    ? Double.parseDouble(totals[i]) : 0.0;

            InvoiceModel model = new InvoiceModel();

            /* USER */
            model.setUsername(username);
            model.setUserRole(role);

            /* IMAGE */
            model.setImageId(1);
            model.setImagePath("images/sample-invoice.png");

            /* INVOICE HEADER */
            model.setVendorName(vendorName);
            model.setInvoiceNumber(invoiceNumber);
            model.setInvoiceDate(invoiceDate);
            model.setPoNumber(poNumber);
            model.setInvoiceTotal(invoiceTotal);
            model.setSubTotal(subTotal);

            /* ITEM */
            model.setItemNo(itemNos[i]);
            model.setItemName(itemNames[i]);
            model.setQuantity(quantity);
            model.setPrice(price);
            model.setCgst(cgst);
            model.setSgst(sgst);
            model.setItemTotal(itemTotal);

            /* STATUS */
            model.setImageNotClear(imageNotClear);
            model.setActionStatus(actionStatus);
            model.setHoldReason(null);

            /* TIME */
            model.setStartTime(startTime);
            model.setEndTime(endTime);
            model.setProcessedDate(processedDate);

            if (dao.saveInvoiceProcessing(model)) {
                savedCount++;
            }
        }

        response.getWriter().write(
            "SUCCESS: " + savedCount + " item(s) saved with status " + actionStatus
        );
    }

    /* ================= DATE VALIDATION METHOD ================= */
    private boolean isInvoiceDateBeforeToday(String inputDate) {

        if (inputDate == null || inputDate.trim().isEmpty()) {
            return false;
        }

        String date = inputDate.toLowerCase();
        LocalDate today = LocalDate.now();

        String[] parts = date.split("[^0-9]");

        int day = -1;
        int month = -1;
        int year = -1;

        /* ===== YEAR (4-digit first) ===== */
        for (String p : parts) {
            if (p.length() == 4) {
                year = Integer.parseInt(p);
                break;
            }
        }

        /* ===== YEAR (2-digit fallback) ===== */
        if (year == -1) {
            for (String p : parts) {
                if (p.length() == 2) {
                    int y = Integer.parseInt(p);
                    year = (y <= 49) ? 2000 + y : 1900 + y;
                    break;
                }
            }
        }

        if (year == -1) return false;

        /* ===== MONTH NAME FIRST ===== */
        if (date.contains("jan")) month = 1;
        else if (date.contains("feb")) month = 2;
        else if (date.contains("mar")) month = 3;   // mar / march
        else if (date.contains("apr")) month = 4;
        else if (date.contains("may")) month = 5;
        else if (date.contains("jun")) month = 6;
        else if (date.contains("jul")) month = 7;
        else if (date.contains("aug")) month = 8;
        else if (date.contains("sep")) month = 9;
        else if (date.contains("oct")) month = 10;
        else if (date.contains("nov")) month = 11;
        else if (date.contains("dec")) month = 12;

        /* ===== MONTH NUMERIC FALLBACK ===== */
        if (month == -1) {
            for (String p : parts) {
                if (!p.isEmpty()) {
                    int m = Integer.parseInt(p);
                    if (m >= 1 && m <= 12) {
                        month = m;
                        break;
                    }
                }
            }
        }

        if (month == -1) return false;

        /* ===== DAY ===== */
        for (String p : parts) {
            if (!p.isEmpty()) {
                int d = Integer.parseInt(p);
                if (d >= 1 && d <= 31 && d != month) {
                    day = d;
                    break;
                }
            }
        }

        if (day == -1) day = 1;

        /* ===== BUILD DATE ===== */
        LocalDate enteredDate;
        try {
            enteredDate = LocalDate.of(year, month, day);
        } catch (Exception e) {
            return false;
        }

        /* ===== FINAL CHECK ===== */
        return enteredDate.isBefore(today);
    }
}
