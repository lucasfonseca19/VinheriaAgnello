<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    // Configurar título da página
    request.setAttribute("pageTitle", "Login");

    // Variáveis para mensagens de erro/sucesso
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Hero Section -->
  <section class="py-5 bg-white">
    <div class="container">
      <div class="row justify-content-center text-center">
        <div class="col-md-8">
          <p class="hero-subtitle">TRADIÇÃO E SOFISTICAÇÃO</p>
          <h1 class="hero-title mb-5">Faça login em sua conta</h1>
        </div>
      </div>
    </div>
  </section>

  <!-- Login Form Section -->
  <section class="py-5 bg-white">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
          <div class="agnello-form">
            <h2>Entrar</h2>

            <% if (errorMessage != null) { %>
              <div class="alert alert-danger" role="alert">
                <%= errorMessage %>
              </div>
            <% } %>

            <% if (successMessage != null) { %>
              <div class="alert alert-success" role="alert">
                <%= successMessage %>
              </div>
            <% } %>

            <form method="post" action="${pageContext.request.contextPath}/login">
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Seu email" required>
              </div>

              <div class="mb-3">
                <label for="password" class="form-label">Senha</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Sua senha" required>
              </div>

              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                <label class="form-check-label text-cinza" for="remember">
                  Lembrar-me
                </label>
              </div>

              <button type="submit" class="btn w-100">Entrar</button>

              <div class="text-center mt-3">
                <p class="mb-2">
                  <a href="#" class="text-dourado text-decoration-none">Esqueceu sua senha?</a>
                </p>
                <p class="mb-0">
                  Não tem uma conta?
                  <a href="${pageContext.request.contextPath}/cadastro.jsp" class="text-dourado text-decoration-none">Cadastre-se</a>
                </p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Benefits Section -->
  <section class="py-5 bg-bege">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8 text-center">
          <h3 class="text-dourado mb-4">Benefícios de ter uma conta</h3>
          <div class="row">
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <h5 class="text-marrom">Recomendações Personalizadas</h5>
                <p class="text-cinza small">Vinhos selecionados especialmente para seu paladar</p>
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <h5 class="text-marrom">Histórico de Compras</h5>
                <p class="text-cinza small">Acompanhe suas escolhas e descubra novos favoritos</p>
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <h5 class="text-marrom">Ofertas Exclusivas</h5>
                <p class="text-cinza small">Descontos e lançamentos em primeira mão</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>