<%-- 
    Document   : login.jsp
    Created on : 26 de mai. de 2025, 18:19:08
    Author     : Isabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Estoque CMP</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/validation.js"></script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form id="loginForm" onsubmit="return validateLogin()" action="entrada.jsp" method="post">
            <label for="username">Usuário:</label>
            <input type="text" id="username" name="username" />

            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" />

            <input type="submit" value="Entrar" />
        </form>
    </div>
</body>
</html>
