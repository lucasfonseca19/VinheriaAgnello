<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    // Configurar título da página
    request.setAttribute("pageTitle", "Tradição e Sofisticação");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Hero Section -->
  <section class="agnello-hero">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="hero-content">
            <p class="hero-subtitle">TRADIÇÃO E SOFISTICAÇÃO</p>
            <h1 class="hero-title">Se surpreenda<br>com o inesperado</h1>
            <p class="lead mb-4">
              Apresentando a verdadeira essência de um sommelier de vinhos para você, onde estiver.
            </p>
            <button class="btn btn-agnello">ENTRE NESSA JORNADA</button>
          </div>
        </div>
        <div class="col-lg-6 text-center">
          <img src="${pageContext.request.contextPath}/imagens/garrafa.png" alt="Vinho Pinot Noir" class="img-fluid" style="max-height: 500px;">
        </div>
      </div>
    </div>
  </section>

  <!-- Steps Section -->
  <section class="agnello-steps bg-white">
    <div class="container">
      <div class="row">
        <div class="col-md-4 text-center mb-4">
          <div class="step">
            <span class="step-number">01.</span>
            <h4 class="mt-3 mb-2 font-playfair">Descubra seu vinho</h4>
            <p class="step-subtitle">Perfil, paladar e ocasião</p>
          </div>
        </div>
        <div class="col-md-4 text-center mb-4">
          <div class="step">
            <span class="step-number">02.</span>
            <h4 class="mt-3 mb-2 font-playfair">Jornada de compra</h4>
            <p class="step-subtitle">Conheça a história</p>
          </div>
        </div>
        <div class="col-md-4 text-center mb-4">
          <div class="step">
            <span class="step-number">03.</span>
            <h4 class="mt-3 mb-2 font-playfair">Colecione momentos</h4>
            <p class="step-subtitle">Onde tradição e sofisticação se encontram</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- About Section -->
  <section class="agnello-about bg-bege">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="about-content">
            <p class="about-subtitle">LAÇOS DE UNIÃO</p>
            <h2 class="about-title">Casa Agnello</h2>
            <p class="mb-4">
              Há mais de 15 anos em São Paulo, trazendo a essência e sofisticação da enologia.
              Sugerimos vinhos de acordo com o perfil de cada usuário, promovendo um momento
              único para a escolha perfeita.
            </p>
            <button class="btn btn-agnello">CONHEÇA</button>
          </div>
        </div>
        <div class="col-lg-6 text-center">
          <img src="${pageContext.request.contextPath}/imagens/familia.png" alt="Família Agnello" class="img-fluid rounded" style="max-width: 450px;">
        </div>
      </div>
    </div>
  </section>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>