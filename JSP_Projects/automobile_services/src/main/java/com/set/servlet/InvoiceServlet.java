package com.set.servlet;

import com.set.dao.InvoiceDao;
import com.set.model.InvoiceModel;
import com.set.model.InvoiceItemModel;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        /* ===== SESSION CHECK ===== */
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session expired");
            return;
        }

        String username = (String) session.getAttribute("username");

        /* ===== READ INVOICE DATA ===== */
        InvoiceModel invoice = new InvoiceModel();
        invoice.setUsername(username);
        invoice.setVendorName(request.getParameter("vendorName"));
        invoice.setInvoiceNumber(request.getParameter("invoiceNumber"));
        invoice.setInvoiceDate(request.getParameter("invoiceDate")); // STRING
        invoice.setPoNumber(request.getParameter("poNumber"));

        String invoiceTotalStr = request.getParameter("invoiceTotal");
        double invoiceTotal = 0.0;
        if (invoiceTotalStr != null && !invoiceTotalStr.trim().isEmpty()) {
            invoiceTotal = Double.parseDouble(invoiceTotalStr);
        }
        invoice.setInvoiceTotal(invoiceTotal);

        invoice.setImageNotClear(request.getParameter("imageNotClear") != null);
        invoice.setActionStatus(request.getParameter("actionStatus"));

        /* ===== READ ITEM TABLE ===== */
        String[] itemNos = request.getParameterValues("itemNo");
        String[] itemNames = request.getParameterValues("itemName");
        String[] prices = request.getParameterValues("price");
        String[] cgsts = request.getParameterValues("cgst");
        String[] sgsts = request.getParameterValues("sgst");
        String[] totals = request.getParameterValues("total");

        List<InvoiceItemModel> items = new ArrayList<>();

        if (itemNos != null) {
            for (int i = 0; i < itemNos.length; i++) {

                // Skip empty rows
                if ((itemNos[i] == null || itemNos[i].trim().isEmpty()) &&
                    (itemNames[i] == null || itemNames[i].trim().isEmpty()) &&
                    (prices[i] == null || prices[i].trim().isEmpty())) {
                    continue;
                }

                InvoiceItemModel item = new InvoiceItemModel();
                item.setItemNo(itemNos[i]);
                item.setItemName(itemNames[i]);

                item.setPrice(prices[i] != null && !prices[i].trim().isEmpty()
                        ? Double.parseDouble(prices[i]) : 0.0);

                item.setCgst(cgsts[i] != null && !cgsts[i].trim().isEmpty()
                        ? Double.parseDouble(cgsts[i]) : 0.0);

                item.setSgst(sgsts[i] != null && !sgsts[i].trim().isEmpty()
                        ? Double.parseDouble(sgsts[i]) : 0.0);

                item.setTotal(totals[i] != null && !totals[i].trim().isEmpty()
                        ? Double.parseDouble(totals[i]) : 0.0);

                items.add(item);
            }
        }

        invoice.setItems(items);

        /* ===== DAO CALL ===== */
        InvoiceDao dao = new InvoiceDao();

        try {
            dao.saveInvoiceWithItems(invoice);
            response.getWriter().write(
                    "Invoice " + invoice.getActionStatus() + " saved successfully");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error saving invoice");
        }
    }
}
