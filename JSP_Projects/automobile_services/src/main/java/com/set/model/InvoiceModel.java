package com.set.model;

import java.util.List;

public class InvoiceModel {

    private int invoiceId;
    private String username;
    private String vendorName;
    private String invoiceNumber;
    private String invoiceDate;   // DD-MM-YYYY
    private String poNumber;
    private double invoiceTotal;
    private boolean imageNotClear;
    private String actionStatus;

    private List<InvoiceItemModel> items;

    public int getInvoiceId() { return invoiceId; }
    public void setInvoiceId(int invoiceId) { this.invoiceId = invoiceId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getVendorName() { return vendorName; }
    public void setVendorName(String vendorName) { this.vendorName = vendorName; }

    public String getInvoiceNumber() { return invoiceNumber; }
    public void setInvoiceNumber(String invoiceNumber) { this.invoiceNumber = invoiceNumber; }

    public String getInvoiceDate() { return invoiceDate; }
    public void setInvoiceDate(String invoiceDate) { this.invoiceDate = invoiceDate; }

    public String getPoNumber() { return poNumber; }
    public void setPoNumber(String poNumber) { this.poNumber = poNumber; }

    public double getInvoiceTotal() { return invoiceTotal; }
    public void setInvoiceTotal(double invoiceTotal) { this.invoiceTotal = invoiceTotal; }

    public boolean isImageNotClear() { return imageNotClear; }
    public void setImageNotClear(boolean imageNotClear) { this.imageNotClear = imageNotClear; }

    public String getActionStatus() { return actionStatus; }
    public void setActionStatus(String actionStatus) { this.actionStatus = actionStatus; }

    public List<InvoiceItemModel> getItems() { return items; }
    public void setItems(List<InvoiceItemModel> items) { this.items = items; }
}
