<%-- 
    Document   : saida.jsp
    Created on : 26 de mai. de 2025, 18:19:26
    Author     : Isabela
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Recebe os parâmetros do formulário (POST)
    String produto = request.getParameter("produto");
    String quantidadeStr = request.getParameter("quantidade");

    // Pega ou cria a lista de saídas na sessão
    java.util.List saidas = (java.util.List) session.getAttribute("saidas");
    if (saidas == null) {
        saidas = new java.util.ArrayList();
        session.setAttribute("saidas", saidas);
    }

    String msg = "";
    if (produto != null && quantidadeStr != null) {
        try {
            int quantidade = Integer.parseInt(quantidadeStr);

            // Adiciona saída: produto e quantidade
            saidas.add(new Object[]{produto, quantidade});
            msg = "Saída registrada com sucesso!";
        } catch (Exception e) {
            msg = "Erro nos dados enviados.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Saída - Estoque CMP</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/validation.js"></script>
</head>
<body>
    <h2>Registrar Saída de Produto</h2>

    <p><%= msg %></p>

    <form method="post" action="saida.jsp">
        <label for="produto">Produto:</label>
        <input type="text" id="produto" name="produto" required /><br><br>

        <label for="quantidade">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" min="1" required /><br><br>

        <input type="submit" value="Registrar Saída" />
    </form>

    <br>

    <a href="relatorio.jsp">
        <button type="button">Ir para Relatório</button>
    </a>
</body>
</html>
