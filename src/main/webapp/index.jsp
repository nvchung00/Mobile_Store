<!DOCTYPE html>
<html lang="en">

<head>
  <title>Product Detail</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<script>
    function goLogin(){
        window.location = "login.jsp"; // Redirecting to other page.
    }
    function goProduct(){
        window.location = "product.jsp"; // Redirecting to other page.
    }
</script>

<body>
    <div class="well">
        <h1> Home Page</h1>
  </div>
  <div class="container">
        <div class="row" style="text-align: center; margin-top: 10%;">
                    <button class="btn btn-success btn-default" onclick="goLogin()">
                        <span class="glyphicon glyphicon glyphicon-log-in"></span> Admin log in
                    </button>
                    <button class="btn btn-success btn-default" onclick="goProduct()">
                        <span class="glyphicon glyphicon glyphicon-list"></span> View Products
                    </button>           
        </div>
  </div>
</body>

</html>