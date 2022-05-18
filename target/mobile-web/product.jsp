<%@page import="java.util.ArrayList" %>
<%@page import="com.laptrinhweb.model.Product" %>
<%@page import="java.util.List" %>
<%@page import="com.laptrinhweb.dao.ProductDAOImpl" %>
<%@page import="java.text.NumberFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <title>Product list</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS/product_list_style.css">
    </head>


    <body>
        <div class="well">
            <button type="button" class="btn btn-default btn-sm pull-right">
                <span class="glyphicon glyphicon-shopping-cart"></span> view cart
            </button>
            <h1> Products</h1>
            <h3>All the available products in our store</h3>
        </div>
        
	
        <div class="container">
            <div class="row " style="margin-bottom: 100px; text-align: center;">
                <%
	                ProductDAOImpl productDAO = new ProductDAOImpl();
	                NumberFormat nf = NumberFormat.getInstance();
		            nf.setMinimumFractionDigits(0);
                    for (Product p : productDAO.getList()) {
                %>
                <div class="col-md-3 " style="float: none; display: inline-block; vertical-align: top; text-align: left; margin-left: -20px;">
                    <div class="col-md-12" style="padding-bottom: 50px;">
                        <h3 class="cart-title"><%=p.getProductName()%></h3>
                        <div class="card-body">
                            <div class="card-img-actions">
                                <img src="<%=p.getProductImage()%>" class="card-img img-fluid" width="200" height="250" alt="">
                            </div>
                            <p class="card-text"><%=p.getProductDescription()%></p>
                            <p class="card-price"><%=nf.format(p.getProductPrice())%> USD</p>
                            <p class="card-stock"><%=nf.format(p.getNumOfProductInStock())%></p>
                            <div class="nut" >
                                <a href="product_detail.jsp?ma_san_pham=<%=p.getProductId()%>">
                                    <button class="btn btn-info btn-default">
                                        <span class="glyphicon glyphicon-info-sign"></span> Detail 
                                    </button>
                                </a>
                                <form action="./GioHangServlet" method="POST" style="display:inline-block;">
                                    <input type="text" name = "command" value = "addCart" style="display: none;"> 
                                    <input type="text" name="ProductId" value="<%=p.getProductId()%>" style="display: none;">
                                    <button class="btn btn-warning" type="submit">
                                        <span class="glyphicon glyphicon-shopping-cart" ></span> Shopping Cart
                                    </button>
                                </form>
                            </div>  
                        </div>
                    </div>
                </div>
                <%
		            }
                %>
            </div>
        </div>
    </body>
</html>