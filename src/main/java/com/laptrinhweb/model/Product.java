package com.laptrinhweb.model;

public class Product {
    private int ProductId;
	private int Category;
	private String ProductName;
	private String ImageProduct;
	private Double UnitPrice;
	private String Manufacturer;
	private String Description;
    private int UnitsInStock;
    private int ConditionProduct;

	public Product() {
	}

	public Product(int ProductId, int Category, String ProductName,
			String ImageProduct, Double UnitPrice, String Manufacturer,
			String Description, int UnitsInStock,int ConditionProduct) {
		this.ProductId = ProductId;
		this.Category = Category;
		this.ProductName = ProductName;
		this.ImageProduct = ImageProduct;
		this.UnitPrice = UnitPrice;
		this.Manufacturer = Manufacturer;
		this.Description = Description;
        this.UnitsInStock = UnitsInStock;
        this.ConditionProduct = ConditionProduct;
	}

	public int getProductId() {
		return ProductId;
	}

	public void setProductId(int ProductId) {
		this.ProductId = ProductId;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String ProductName) {
		this.ProductName = ProductName;
	}

	public int getProductCategory() {
		return Category;
	}

	public void setProductCategory(int Category) {
		this.Category = Category;
	}

	public Double getProductPrice() {
		return UnitPrice;
	}

	public void setProductPrice(Double UnitPrice) {
		this.UnitPrice = UnitPrice;
	}

    public int getNumOfProductInStock(){
        return UnitsInStock;
    }

    public void setNumOfProductInStock(int UnitsInStock){
        this.UnitsInStock = UnitsInStock;
    }

	public String getProductDescription() {
		return Description;
	}

	public void getProductDescription(String Description) {
		this.Description = Description;
	}

	public String getProductManufacturer() {
		return Manufacturer;
	}

	public void setProductManufacturer(String Manufacturer) {
		this.Manufacturer = Manufacturer;
	}

    public int getProductCondition(){
        return ConditionProduct;
    }

    public void setProductCondition(int ConditionProduct){
        this.ConditionProduct = ConditionProduct;
    }

	public String getProductImage() {
		return ImageProduct;
	}

	public void setProductImage(String ImageProduct) {
		this.ImageProduct = ImageProduct;
	}

	

	

	


	

    
}
