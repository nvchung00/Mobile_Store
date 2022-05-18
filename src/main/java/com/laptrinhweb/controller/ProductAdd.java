package com.laptrinhweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhweb.dao.ProductDAOImpl;
import com.laptrinhweb.model.Product;


public class ProductAdd  extends HttpServlet{

    private static final long serialVersionUID = 1L;
    private ProductDAOImpl productDAO = new ProductDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ProductName = request.getParameter("product_name");
        String ProductPrice = request.getParameter("unit_price");
        String NumOfProductInStock = request.getParameter("unit_in_stock");
        String ProductDescription = request.getParameter("product_description");
        String ProductManufacturer = request.getParameter("manufacturer");
        String ProductCategory = request.getParameter("category");
        String ProductCondition = request.getParameter("inlineRadioOptions");
        String ProductImage = request.getParameter("filebutton");
        Product u= new Product(1, Integer.parseInt(ProductCategory),ProductName, "images/" + ProductImage, Double.parseDouble(ProductPrice),ProductManufacturer, ProductDescription, Integer.parseInt(NumOfProductInStock), Integer.parseInt(ProductCondition));
        productDAO.addProduct(u);
        String url = "/index.jsp";
		try {	
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("product_add.jsp");
		}
    }
}
