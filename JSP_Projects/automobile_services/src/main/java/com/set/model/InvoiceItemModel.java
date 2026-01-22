package com.set.model;

public class InvoiceItemModel {

    private String itemNo;
    private String itemName;
    private double price;
    private double cgst;
    private double sgst;
    private double total;

    public String getItemNo() { return itemNo; }
    public void setItemNo(String itemNo) { this.itemNo = itemNo; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getCgst() { return cgst; }
    public void setCgst(double cgst) { this.cgst = cgst; }

    public double getSgst() { return sgst; }
    public void setSgst(double sgst) { this.sgst = sgst; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}
