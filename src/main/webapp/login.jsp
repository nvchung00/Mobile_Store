<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>

  <body>
    <% String err="" ; if (request.getAttribute("err") !=null) { err=(String) request.getAttribute("err"); } %>
      <div class="well">
        <h1> Mobile Store</h1>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Please sign in</h3>
              </div>
              <div class="panel-body">
                <form accept-charset="UTF-8" role="form" action="./LoginServlet" method="POST">
                  <% 
                    String mess="" ; 
                    if (request.getAttribute("mess") !=null){ 
                      mess=(String) request.getAttribute("mess");
                    }
                  %>
                      <fieldset>
                        <div class="form-group">
                          <input class="form-control" id="username" placeholder="User Name" name="username" type="text"
                            required="" autofocus="">
                        </div>
                        <div class="form-group">
                          <input class="form-control" id="password" placeholder="Password" name="password"
                            type="password" value="" required="">
                        </div>
                        <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                      </fieldset>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
  </body>

  </html>