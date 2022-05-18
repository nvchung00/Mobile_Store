package com.laptrinhweb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.laptrinhweb.model.Cart;
import com.laptrinhweb.model.Product;

/**
 * Servlet implementation class GioHangServlet
 */
public class GioHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Cart> cart = new ArrayList<Cart>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GioHangServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String ProductId = request.getParameter("ProductId");
		if (command.equals("addCart")) {
			Product p = new Product(Integer.parseInt(ProductId), 0, "", "",
					0.0 , "", "",1,2);
			addToCart(p);
			// sau khi them vao gio hang ta se chuyen toi trang gio hang
			// can tao session de luu tru gia tri
			HttpSession session = request.getSession();

			// ta test xem gio hang co them duoc ko?
			System.out.println(cart.size());
			session.setAttribute("cart", cart);
			response.sendRedirect("cart.jsp");
		} else{
			if(command.equals("deleteCart")){
				Product p = new Product(Integer.parseInt(ProductId), 0, "", "",
						0.0 , "", "",1,2);
				deleteFromCart(p);
				HttpSession session = request.getSession();

				// ta test xem gio hang co them duoc ko?
				System.out.println(cart.size());
				session.setAttribute("cart", cart);
				response.sendRedirect("cart.jsp");
			} else{
				if(command.equals("removeCart")){
					Product p = new Product(Integer.parseInt(ProductId), 0, "", "",
							0.0 , "", "",1,2);
					removeFromCart(p);
					HttpSession session = request.getSession();

					//lưu vào session
					session.setAttribute("cart", cart);
					response.sendRedirect("cart.jsp");
				}
				else{
					if(command.equals("setCart")){
						Product p = new Product(Integer.parseInt(ProductId), 0, "", "",
								0.0 , "", "",1,2);
						setCart(p,Integer.parseInt((String) request.getParameter("soluong")));
						HttpSession session = request.getSession();

						session.setAttribute("cart", cart);
						response.sendRedirect("cart.jsp");
					}
					else{
						if(command.equals("clearCart")){
							clearCart();
							HttpSession session = request.getSession();

							session.setAttribute("cart", cart);
							response.sendRedirect("cart.jsp");
						}
					}
				}
			}
		}
	}

	private String removeFromCart(Product p) {
		for (Cart item : cart) {
			if (item.getP().getProductId() == p.getProductId()) {
				cart.remove(item);
				return "cart";
			}
		}
		return "cart";
	}
	
	private String setCart(Product p, int s) {
		for (Cart item : cart) {
			if (item.getP().getProductId() == p.getProductId()) {
				item.setQuantity(s);
				return "cart";
			}
		}
		Cart c = new Cart();
		c.setP(p);
		c.setQuantity(s);
		cart.add(c);
		return "cart";
	}

	// phuongw thuc them san pham moi vao trong gio hang
	public String addToCart(Product p) {
		for (Cart item : cart) {
			if (item.getP().getProductId() == p.getProductId()) {
				item.setQuantity(item.getQuantity() + 1);
				return "cart";
			}
		}
		Cart c = new Cart();
		c.setP(p);
		c.setQuantity(1);
		cart.add(c);
		return "cart";
	}
	
	// phuongw thuc giam bot 1 san pham khoi trong gio hang
		public String deleteFromCart(Product p) {
			for (Cart item : cart) {
				if (item.getP().getProductId() == p.getProductId() && item.getQuantity()>1) {
					item.setQuantity(item.getQuantity() - 1);
					return "cart";
				}
			}
			return "cart";
		}

		public void clearCart(){
			cart.clear();
		}

}
