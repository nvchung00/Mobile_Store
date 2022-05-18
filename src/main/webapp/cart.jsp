<%@page import="com.laptrinhweb.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.laptrinhweb.dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>Product Detail</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="CSS/cart.css">
</head>

<script>
    function backHome() {
        window.location = "product.jsp"; // Redirecting to other page.
    };

    function clearCart() {
        var myTable = document.getElementById("myTable");
        var rowCount = myTable.rows.length;
        for (var x = rowCount - 1; x > 0; x--) {
            myTable.deleteRow(x);
        }
    };

    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }
</script>

<body>
    <%
		ProductDAOImpl productDAO = new ProductDAOImpl();
				
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		double total = 0;
		ArrayList<Cart> cart=null;
		if(session.getAttribute("cart")!=null){
			cart = (ArrayList<Cart>) session.getAttribute("cart");
        }
	%>
    
    <div class="well">
        <h1> Product roducts</h1>
        <h3>All the selected products in your cart</h3>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="./GioHangServlet" method="POST">
                    <input type="text" name="command" value="clearCart" style="display: none;">
                    <button class="btn btn-danger" onclick="clearCart()">
                        <span class="glyphicon glyphicon-remove-sign"></span> Clear Cart
                    </button>
                </form>  
                    
                <button class="btn btn-success pull-right">
                    <span class="glyphicon glyphicon-shopping-cart"></span> Check out
                </button>
                <div class="table-responsive">
                    <table class="table" id="myTable">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Unit price</th>
                                <th>Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <%
		                    if (cart != null) {
			                for (Cart c : cart) {
				                total = total + (c.getQuantity() * productDAO.getProduct(c.getP().getProductId()).getProductPrice());
				        %>
                        <tbody>
                            <tr>
                                <td><%=productDAO.getProduct(c.getP().getProductId())
                                    .getProductName()%></td>
                                <td><%=c.getQuantity()%></td>
                                <td><%=nf.format(productDAO.getProduct(c.getP().getProductId()).getProductPrice())%></td>
                                <td><%=nf.format(productDAO.getProduct(c.getP().getProductId()).getProductPrice() * c.getQuantity())%></td>
                                <td>
                                    <form action="./GioHangServlet" method="POST">
                                        <input type="text" name="command" value="removeCart" style="display: none;">
                                        <input type="text" name="ProductId" value="<%=productDAO.getProduct(c.getP().getProductId()).getProductId()%>" style="display: none;">
                                        <button class="btn btn-danger btn-sm" onclick="deleteRow(this)">
                                            <span class="glyphicon glyphicon-remove-sign"></span> Remove
                                        </button>
                                    </form>  
                                </td>
                            </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                        <tbody>
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Grand Total</th>
                                <th><%=nf.format(total)%></th>
                                <th></th>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-success btn-default" onclick="backHome()">
                        <span class="glyphicon glyphicon-circle-arrow-left"></span> Continue shopping
                    </button>
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>