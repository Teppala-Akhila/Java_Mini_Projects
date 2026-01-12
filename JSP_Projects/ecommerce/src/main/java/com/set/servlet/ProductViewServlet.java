package com.set.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.set.dao.ProductDao;
import com.set.model.ProductModel;

@WebServlet("/ProductViewServlet")
public class ProductViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao dao = new ProductDao();
        List<ProductModel> productList = dao.getAllProducts();

        request.setAttribute("products", productList);

        request.getRequestDispatcher("productview.jsp")
               .forward(request, response);
    }
}
