<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Bootstrap CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="jquery-3.5.1.slim.min.js"></script>

    <!-- Bootstrap JS (requires jQuery) -->
    <script src="bootstrap.bundle.min.js"></script>

    <!-- Optionally, you can use this for custom styles -->
    <style>
        .login-container {
            max-width: 400px;
            margin-top: 50px;
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container login-container">
        <div class="error-message">
            <%
                Object o = request.getAttribute("loginError");
                String error = (o == null) ? "" : o.toString();
            %>
            <p><b><%=error%></b></p>
        </div>

        <form method="post" action="./LoginServlet">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" class="form-control" name="pass" id="pass" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <button type="reset" class="btn btn-secondary btn-block">Clear</button>
        </form>

        <p class="text-center mt-3">
            <a href="./Register.html">Register</a>
        </p>
    </div>

    <!-- Optional custom script to handle form validation or any other logic -->
    <script>
        $(document).ready(function() {
            // Example: You can add custom form validation or any event listener here if necessary.
        });
    </script>

</body>
</html>
