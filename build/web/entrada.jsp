<%-- 
    Document   : entrada.jsp
    Created on : 26 de mai. de 2025, 18:19:18
    Author     : Isabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Recebe os parâmetros do formulário (via POST)
    String produto = request.getParameter("produto");
    String quantidadeStr = request.getParameter("quantidade");
    String custoStr = request.getParameter("custo");

    // Inicializa lista de entradas (produto, quantidade, custo)
    java.util.List entradas = (java.util.List) session.getAttribute("entradas");
    if (entradas == null) {
        entradas = new java.util.ArrayList();
        session.setAttribute("entradas", entradas);
    }

    String msg = "";
    if (produto != null && quantidadeStr != null && custoStr != null) {
        try {
            int quantidade = Integer.parseInt(quantidadeStr);
            double custo = Double.parseDouble(custoStr);
            // Salvar um array de 3 itens: produto, quantidade, custo
            entradas.add(new Object[]{produto, quantidade, custo});
            msg = "Entrada registrada com sucesso!";
        } catch (Exception e) {
            msg = "Erro nos dados enviados.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registrar Entrada - Estoque CMP</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script src="js/validation.js"></script>
</head>
<body>
    <h2>Registrar Entrada de Produto</h2>
    <p><%= msg %></p>
    <form method="post" action="entrada.jsp" id="entradaForm" onsubmit="return validateEntrada()">
        <label for="produto">Produto:</label>
        <input type="text" id="produto" name="produto" required /><br><br>

        <label for="quantidade">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" min="1" required /><br><br>

        <label for="custo">Custo Unitário:</label>
        <input type="number" id="custo" name="custo" step="0.01" min="0" required /><br><br>

        <input type="submit" value="Registrar Entrada" />
    </form>
    <br>
    <a href="saida.jsp">
        <button type="button">Ir para Saída</button>
    </a>
</body>
</html>
