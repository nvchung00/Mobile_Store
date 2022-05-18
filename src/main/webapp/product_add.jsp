<%@page import="java.util.ArrayList" %>
<%@page import="com.laptrinhweb.model.Product" %>
<%@page import="java.util.List" %>
<%@page import="com.laptrinhweb.dao.ProductDAOImpl" %>
<%@page import="java.text.NumberFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>Add products</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="well">

        <a href="index.jsp" class="btn btn-danger pull-right">logout</a>
        <h1> Product roducts</h1>
        <h3>Add products</h3>
  </div>
  <div class="container">
    <form class="form-horizontal" action="./ProductAdd" method="POST">
        <fieldset>
        
        <!-- Form Name -->
        <legend>Add new product</legend>
        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="product_name">Product Name</label>  
          <div class="col-md-4">
          <input id="product_name" name="product_name" class="form-control input-md" required="" type="text">
            
          </div>
        </div>
        
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="unit_price">Unit Price</label>  
          <div class="col-md-4">
          <input id="unit_price" name="unit_price"  class="form-control input-md" required="" type="text">
            
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="unit_in_stock">Units In Stock</label>  
            <div class="col-md-4">
            <input id="unit_in_stock" name="unit_in_stock" class="form-control input-md" required="" type="text" value="0">
              
            </div>
        </div>

        <!-- Textarea -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="product_description">Product Description</label>
            <div class="col-md-4">                     
              <textarea class="form-control" id="product_description" name="product_description"></textarea>
            </div>
        </div>
        
        
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="manufacturer">Manufacturer</label>  
            <div class="col-md-4">
                <input id="manufacturer" name="manufacturer"  class="form-control input-md" required="" type="text">           
            </div>
        </div>
        
        <!-- Text input -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="category">Category</label>
            <div class="col-md-4">
                <input id="category" name="category"  class="form-control input-md" required="" type="text">
            </div>
        </div>

        <!-- checkbox-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="name">Condition</label>  
            <div class="col-md-4">
                <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1"> New
                </label>
                <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2"> Old
                </label>
                <label class="radio-inline">
                    <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="3"> Refurbished
                </label>
            </div>
        </div>
        
         <!-- File Button --> 
        <div class="form-group">
          <label class="col-md-4 control-label" for="filebutton">Product Image File</label>
          <div class="col-md-4">
            <input id="filebutton" name="filebutton" class="input-file" type="file">
          </div>
        </div>
        
        <!-- Button -->
        <div class="form-group">
          <div class="col-md-4 col-md-offset-4">
            <button id="singlebutton" type="submit" name="singlebutton" class="btn btn-primary">Add Product</button>
          </div>
          </div>
        
        </fieldset>
      </form>
  </div>
</body>

</html>