<%-- 
    Document   : login
    Created on : Dec 9, 2018, 8:45:37 PM
    Author     : VLAD
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../css/cssreset.css">        
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"> 
        <link rel="stylesheet" type="text/css" href="../css/affablebean.css">
        <link rel="shortcut icon" href="../img/favicon.png">

        <script src="../js/jquery-1.4.2.js" type="text/javascript"></script>

        <title>The Affable Bean :: Admin Console</title>
    </head>

    <body class="text-center login-page bg-dark">
        <form class="form-signin" action="j_security_check" method="post">
            <a href="<c:url value='../index.jsp'/>">
                <img src="../img/logo.png" width="72" height="72" alt="logo" class="mb-4">
            </a>

            <h1 class="h3 mb-3 font-weight-normal text-white">Please sign in</h1>
            <label for="inputEmail" class="sr-only">Username:</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Username" size="20" name="j_username" autofocus="" required>

            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" size="20" name="j_password" required>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">© 2018</p>
        </form>
    </body>
</html>