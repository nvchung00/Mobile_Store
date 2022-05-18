package com.laptrinhweb.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import java.sql.PreparedStatement;

import com.laptrinhweb.model.Product;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public void addProduct(Product p) {
		
		String query = "INSERT INTO Product(ProductName, ProductPrice";
        query += ", NumOfProductInStock, ProductDescription, ProductManufacturer";
        query += ", ProductCategory, ProductCondition, ProductImage)";
        query += " VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement ps;
		try {
			Connection con = DBConnect.getConn();
			ps = (PreparedStatement) con.prepareStatement(query);
			ps.setString(1, p.getProductName());
			ps.setDouble(2, p.getProductPrice());
			ps.setInt(3, p.getNumOfProductInStock());
			ps.setString(4, p.getProductDescription());
			ps.setString(5, p.getProductManufacturer());
			ps.setInt(6, p.getProductCategory());
			ps.setInt(7, p.getProductCondition());
			ps.setString(8, p.getProductImage());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Product> getList() {
		
		String query = "SELECT * FROM Product;";
		List<Product> list = new ArrayList<Product>();
		try {
			Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int ProductId = rs.getInt("ProductId");
				int ProductCategory = rs.getInt("ProductCategory");
				String ProductName = rs.getString("ProductName");
				String ProductImage = rs.getString("ProductImage");
				Double ProductPrice = rs.getDouble("ProductPrice");
				String ProductManufacturer = rs.getString("ProductManufacturer");
				String ProductDescription = rs.getString("ProductDescription");
				int NumOfProductInStock = rs.getInt("NumOfProductInStock");
				int ProductCondition = rs.getInt("ProductCondition");

				list.add(new Product(ProductId, ProductCategory, ProductName, ProductImage, ProductPrice, ProductManufacturer, ProductDescription, NumOfProductInStock,ProductCondition));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		ProductDAOImpl productDAO = new ProductDAOImpl();
		Product p = new Product(1,2,"iphone12","images/iphone8.jpg",1200.9,"Foxcom","dep",100,1);
		productDAO.addProduct(p);
		String query = "SELECT * FROM Product;";
		try {
			Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				int ProductId = rs.getInt("ProductId");
				String ProductName = rs.getString("ProductName");
				System.out.println(ProductId);
				System.out.println(ProductName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Product getProduct(int id) {
		String query = "SELECT * FROM Product where ProductId='" + id + "'";
		Product p = new Product();
		try {
			Connection con = DBConnect.getConn();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				int ProductId = rs.getInt("ProductId");
				String ProductName = rs.getString("ProductName");
				int ProductCategory = rs.getInt("ProductCategory");
				Double ProductPrice = rs.getDouble("ProductPrice");
				int NumOfProductInStock = rs.getInt("NumOfProductInStock");
				String ProductDescription = rs.getString("ProductDescription");
				String ProductManufacturer = rs.getString("ProductManufacturer");
				int ProductCondition = rs.getInt("ProductCondition");
				String ProductImage = rs.getString("ProductImage");
				p = new Product(ProductId, ProductCategory, ProductName, ProductImage, ProductPrice, ProductManufacturer, ProductDescription, NumOfProductInStock,ProductCondition);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

}
