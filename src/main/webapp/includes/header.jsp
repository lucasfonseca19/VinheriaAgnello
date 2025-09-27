<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.beans.CarrinhoItem" %>
<%
    // Garantir UTF-8 na resposta
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    // Calcular contador de itens no carrinho
    int contadorCarrinho = 0;
    @SuppressWarnings("unchecked")
    List<CarrinhoItem> carrinhoHeader = (List<CarrinhoItem>) session.getAttribute("carrinho");
    if (carrinhoHeader != null) {
        for (CarrinhoItem item : carrinhoHeader) {
            contadorCarrinho += item.getQuantidade();
        }
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${pageTitle} - Vinheria Agnello</title>

  <!-- Bootstrap CSS -->
  <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <!-- Estilos personalizados -->
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
</head>

<body>

  <!-- Header -->
  <header class="agnello-header">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-4">
          <a href="${pageContext.request.contextPath}/home.jsp" class="agnello-logo text-decoration-none">
            <img src="${pageContext.request.contextPath}/assets/logo.png" alt="Vinheria Agnello">
            <span>VINHERIA<br>AGNELLO</span>
          </a>
        </div>

        <div class="col-md-4">
          <nav class="agnello-nav text-center">
            <a href="${pageContext.request.contextPath}/catalogo.jsp">Catálogo</a>
            <a href="${pageContext.request.contextPath}/quiz/descubra-inicio.jsp">Descubra seu vinho</a>
          </nav>
        </div>

        <div class="col-md-4">
          <div class="agnello-icons text-end">
            <a href="${pageContext.request.contextPath}/login.jsp" title="Login">
              <img src="https://cdn-icons-png.flaticon.com/128/2321/2321232.png" alt="Login">
            </a>
            <a href="${pageContext.request.contextPath}/carrinho.jsp" title="Carrinho" class="position-relative">
              <img src="https://cdn-icons-png.flaticon.com/128/1170/1170678.png" alt="Carrinho">
              <% if (contadorCarrinho > 0) { %>
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dourado text-dark">
                  <%= contadorCarrinho %>
                  <span class="visually-hidden">itens no carrinho</span>
                </span>
              <% } %>
            </a>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Content starts here -->
  <main>