<%@page import="java.util.ArrayList" %>
<%@page import="com.laptrinhweb.model.Product" %>
<%@page import="java.util.List" %>
<%@page import="com.laptrinhweb.dao.ProductDAOImpl" %>
<%@page import="java.text.NumberFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>Product Detail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./CSS/product_detail.css">
</head>

<script>
    function goBack(){
        window.location = "product_list.html"; // Redirecting to other page.
    }
</script>

<body>
    <div class="well">
        <h1> Product roducts</h1>
  </div>
    <%
    // ham nay de lay ma san pham truyen qua tren thanh dia chj
    String ma_san_pham = "";
    if (request.getParameter("ma_san_pham") != null) {
        ma_san_pham = request.getParameter("ma_san_pham");
    }

    ProductDAOImpl productDAO = new ProductDAOImpl();
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMinimumFractionDigits(0);
    %>
  <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-img-actions"> 
                            <img src="<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductImage()%>" class="card-img img-fluid" width="400" height="400" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductName()%></h3>
                    <p class="card-text"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductDescription()%></p>
                    <h5 class="item-code"><b> Item code :</b>
                        <span style="background-color: yellow;color: black;"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductId()%></span>
                    </h5>
                    <h5 class="manufacturer"><b> manufacturer :</b>
                        <span ><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductManufacturer()%></span>
                    </h5>
                    <h5 class="category"><b> category :</b>
                        <span ><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductCategory()%></span>
                    </h5>
                    <h5 class="stock"><b> Availble units in stock :</b>
                        <span ><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getNumOfProductInStock()%></span>
                    </h5>
                    <h4 class="price"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getProductPrice()%></h4>
                    <button class="btn btn-success btn-default" onclick="goBack()">
                        <span class="glyphicon glyphicon-circle-arrow-left"></span> Back
                    </button>

                    <button class="btn btn-warning">
                        <span class="glyphicon glyphicon-shopping-cart"></span> Order Now
                    </button>
                </div>
                
            </div>
        </div>
  </div>
</body>

</html>