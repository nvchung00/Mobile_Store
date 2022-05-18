package com.laptrinhweb.dao;

import java.util.List;

import com.laptrinhweb.model.Product;

public interface ProductDAO {

	// thêm sản phẩm mới
	public void addProduct(Product p);

	// hiển thị danh sách sản phẩm
	public List<Product> getList();
	
	public Product getProduct(int ma_san_pham);

}
