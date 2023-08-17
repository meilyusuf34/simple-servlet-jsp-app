<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="assets/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#loginForm").submit(function(event) {
                event.preventDefault();
                var username = $("#username").val();
                var password = $("#password").val();
                // validation
                if (username.trim() === "") {
                    $("#usernameError").text("Username is required");
                    return;
                } else {
                    $("#usernameError").text("");
                }

                if (password.trim() === "") {
                    $("#passwordError").text("Password is required");
                    return;
                } else {
                    $("#passwordError").text("");
                }
                $.ajax({
                    type: "POST",
                    url: "LoginServlet",
                    data: {
                        username: username,
                        password: password
                    },
                    success: function(response) {
                        if (response === "success") {
                            window.location.href = "WelcomeServlet";
                        } else {
                            $("#errorMsg").text("Username and Password did not Match.");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <h1>Welcome To Java Simple Servlet web App</h1>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">Login</div>
                    <div class="card-body">
                        <form id="loginForm">
                            <div class="form-group">
                                <label for="username">Username:</label>
                                <input type="text" id="username" name="username" class="form-control">
                                <div class="text-danger" id="usernameError"></div>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" class="form-control">
                                <div class="text-danger" id="passwordError"></div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                        <p id="errorMsg" class="mt-3 text-danger text-center"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>