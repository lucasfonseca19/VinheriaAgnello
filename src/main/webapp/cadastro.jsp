<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    // Configurar título da página
    request.setAttribute("pageTitle", "Cadastro");

    // Variáveis para mensagens de erro/sucesso
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Hero Section -->
  <section class="agnello-hero">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-5">
          <div class="hero-content">
            <p class="hero-subtitle">TRADIÇÃO E SOFISTICAÇÃO</p>
            <h1 class="hero-title">Faça o seu cadastro</h1>
            <p class="lead mb-4">
              Nos acompanhe nessa jornada e participe de sorteios e descontos exclusivos
            </p>
            <button class="btn btn-agnello" data-bs-toggle="modal" data-bs-target="#benefitsModal">
              Benefícios ao se cadastrar
            </button>
          </div>
        </div>

        <div class="col-lg-7">
          <div class="agnello-form">
            <h2>Criar Conta</h2>

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

            <form method="post" action="${pageContext.request.contextPath}/cadastro">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="nome" class="form-label">Nome</label>
                  <input type="text" class="form-control" id="nome" name="nome" placeholder="Seu nome" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="sobrenome" class="form-label">Sobrenome</label>
                  <input type="text" class="form-control" id="sobrenome" name="sobrenome" placeholder="Seu sobrenome" required>
                </div>
              </div>

              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Seu email" required>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="senha" class="form-label">Senha</label>
                  <input type="password" class="form-control" id="senha" name="senha" placeholder="Digite sua senha" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="confirmar-senha" class="form-label">Confirmar Senha</label>
                  <input type="password" class="form-control" id="confirmar-senha" name="confirmarSenha" placeholder="Repita sua senha" required>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cep" class="form-label">CEP</label>
                  <input type="text" class="form-control" id="cep" name="cep" placeholder="Seu CEP" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="telefone" class="form-label">Telefone</label>
                  <input type="tel" class="form-control" id="telefone" name="telefone" placeholder="Seu telefone" required>
                </div>
              </div>

              <div class="mb-3">
                <label for="cidade" class="form-label">Cidade</label>
                <input type="text" class="form-control" id="cidade" name="cidade" placeholder="Sua cidade" required>
              </div>

              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
                <label class="form-check-label text-cinza" for="terms">
                  Aceito os <a href="#" class="text-dourado">Termos de Uso</a> e
                  <a href="#" class="text-dourado">Política de Privacidade</a>
                </label>
              </div>

              <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="newsletter" name="newsletter">
                <label class="form-check-label text-cinza" for="newsletter">
                  Quero receber novidades e ofertas exclusivas por email
                </label>
              </div>

              <button type="submit" class="btn w-100">Cadastrar</button>

              <div class="text-center mt-3">
                <p class="mb-0">
                  Já tem uma conta?
                  <a href="${pageContext.request.contextPath}/login.jsp" class="text-dourado text-decoration-none">Faça login</a>
                </p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Benefits Modal -->
  <div class="modal fade" id="benefitsModal" tabindex="-1" aria-labelledby="benefitsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-header">
          <h5 class="modal-title text-marrom font-playfair" id="benefitsModalLabel">Benefícios de se cadastrar</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6 mb-4">
              <div class="text-center p-3">
                <div class="mb-3">
                  <span class="step-number text-dourado">🍷</span>
                </div>
                <h5 class="text-marrom">Curadoria Personalizada</h5>
                <p class="text-cinza">Receba recomendações dos Agnello baseadas no seu perfil e preferências</p>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="text-center p-3">
                <div class="mb-3">
                  <span class="step-number text-dourado">💰</span>
                </div>
                <h5 class="text-marrom">Descontos Exclusivos</h5>
                <p class="text-cinza">Ofertas especiais e descontos em vinhos selecionados apenas para membros</p>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="text-center p-3">
                <div class="mb-3">
                  <span class="step-number text-dourado">🎁</span>
                </div>
                <h5 class="text-marrom">Sorteios e Brindes</h5>
                <p class="text-cinza">Participe de sorteios mensais de vinhos especiais e eventos exclusivos</p>
              </div>
            </div>
            <div class="col-md-6 mb-4">
              <div class="text-center p-3">
                <div class="mb-3">
                  <span class="step-number text-dourado">📚</span>
                </div>
                <h5 class="text-marrom">Conteúdo Educativo</h5>
                <p class="text-cinza">Acesso ao blog dos Agnello com dicas, harmonizações e histórias dos vinhos</p>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer bg-header">
          <button type="button" class="btn btn-agnello" data-bs-dismiss="modal">Fechar</button>
        </div>
      </div>
    </div>
  </div>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>