<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.service.VinhoService" %>
<%@ page import="com.vinheria.beans.Vinho" %>
<%
    // Obter ID do vinho da URL
    String wineIdParam = request.getParameter("id");

    VinhoService vinhoService = new VinhoService();
    Vinho vinho = null;
    String errorMessage = null;

    // Validar e buscar vinho
    if (wineIdParam == null || wineIdParam.trim().isEmpty()) {
        errorMessage = "ID do vinho não fornecido";
    } else {
        try {
            int wineId = Integer.parseInt(wineIdParam);
            vinho = vinhoService.buscarPorId(wineId);
            if (vinho == null) {
                errorMessage = "Vinho não encontrado";
            }
        } catch (NumberFormatException e) {
            errorMessage = "ID do vinho inválido";
        }
    }

    // Configurar título da página
    if (vinho != null) {
        request.setAttribute("pageTitle", vinho.getNome() + " - Detalhe do Vinho");
    } else {
        request.setAttribute("pageTitle", "Vinho não encontrado");
    }
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Detalhe do Vinho Main Section -->
  <main class="py-5 bg-bege">
    <div class="container">

      <!-- Breadcrumb -->
      <div class="row mb-4">
        <div class="col-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp" class="text-dourado">Home</a></li>
              <li class="breadcrumb-item"><a href="catalogo.jsp" class="text-dourado">Catálogo</a></li>
              <li class="breadcrumb-item active text-marrom" aria-current="page">
                <%= vinho != null ? vinho.getNome() : "Vinho não encontrado" %>
              </li>
            </ol>
          </nav>
        </div>
      </div>

      <% if (errorMessage != null) { %>
        <!-- Erro: Vinho não encontrado -->
        <div class="row">
          <div class="col-12">
            <div class="alert alert-warning text-center" role="alert">
              <h4 class="alert-heading">Ops!</h4>
              <p><%= errorMessage %></p>
              <hr>
              <a href="catalogo.jsp" class="btn btn-dourado">Voltar ao Catálogo</a>
            </div>
          </div>
        </div>
      <% } else { %>

        <!-- Conteúdo Principal do Vinho -->
        <div class="row mb-5">

          <!-- Imagem do Vinho -->
          <div class="col-lg-6 mb-4">
            <div class="wine-detail-image bg-white p-4 rounded shadow-sm text-center">
              <img src="<%= vinho.getImagem() %>" alt="<%= vinho.getNome() %>"
                   class="img-fluid rounded" style="max-height: 500px; object-fit: contain;">
            </div>
          </div>

          <!-- Informações do Vinho -->
          <div class="col-lg-6">
            <div class="wine-detail-info bg-white p-4 rounded shadow-sm">

              <!-- Nome e Avaliação -->
              <div class="mb-3">
                <h1 class="hero-title mb-2"><%= vinho.getNome() %></h1>
                <div class="rating mb-2">
                  <span class="text-warning fs-5"><%= vinho.getEstrelas() %></span>
                </div>
                <div class="badges-container mb-3">
                  <% if (vinho.getBadges() != null) {
                       for (String badge : vinho.getBadges()) {
                         String badgeClass = "bg-secondary";
                         if ("Escolha Agnello".equals(badge)) badgeClass = "bg-dourado";
                         else if ("Orgânico".equals(badge)) badgeClass = "bg-success";
                         else if ("Nacional".equals(badge)) badgeClass = "bg-warning text-dark";
                         else if ("Verão".equals(badge)) badgeClass = "bg-light text-dark";
                         else if ("Baixo Álcool".equals(badge)) badgeClass = "bg-success";
                         else if ("Kabinett".equals(badge)) badgeClass = "bg-primary";
                         else if ("Brut Nature".equals(badge)) badgeClass = "bg-light text-dark";
                  %>
                    <span class="badge <%= badgeClass %> me-1 mb-1"><%= badge %></span>
                  <% }
                     } %>
                </div>
              </div>

              <!-- Preço -->
              <div class="price-section mb-4">
                <h2 class="text-dourado font-playfair"><%= vinho.getPrecoFormatado() %></h2>
              </div>

              <!-- Informações Técnicas -->
              <div class="wine-tech-info mb-4">
                <div class="row">
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Região:</strong></h6>
                    <p class="mb-0"><%= vinho.getRegiao() %></p>
                  </div>
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Uva:</strong></h6>
                    <p class="mb-0"><%= vinho.getUva() %></p>
                  </div>
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Ano:</strong></h6>
                    <p class="mb-0"><%= vinho.getAno() %></p>
                  </div>
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Teor Alcoólico:</strong></h6>
                    <p class="mb-0"><%= String.format("%.1f%%", vinho.getTeorAlcoolico()) %></p>
                  </div>
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Corpo:</strong></h6>
                    <p class="mb-0"><%= vinho.getCorpo() != null ? vinho.getCorpo() : "-" %></p>
                  </div>
                  <div class="col-sm-6 mb-3">
                    <h6 class="text-marrom mb-1"><strong>Doçura:</strong></h6>
                    <p class="mb-0"><%= vinho.getDocura() != null ? vinho.getDocura() : "-" %></p>
                  </div>
                </div>
                <div class="mb-3">
                  <h6 class="text-marrom mb-1"><strong>Harmonização:</strong></h6>
                  <p class="mb-0"><%= vinho.getHarmonizacao() != null ? vinho.getHarmonizacao() : "-" %></p>
                </div>
              </div>

              <!-- Seletor Quantidade e Carrinho -->
              <div class="purchase-section">
                <form method="post" action="#" id="addToCartForm">
                  <input type="hidden" name="vinhoId" value="<%= vinho.getId() %>">
                  <div class="row align-items-end">
                    <div class="col-sm-4 mb-3">
                      <label for="quantity" class="form-label text-marrom"><strong>Quantidade:</strong></label>
                      <select class="form-select" name="quantity" id="quantity">
                        <% for (int i = 1; i <= 10; i++) { %>
                          <option value="<%= i %>"><%= i %> garrafa<%= i > 1 ? "s" : "" %></option>
                        <% } %>
                      </select>
                    </div>
                    <div class="col-sm-8 mb-3">
                      <button type="button" class="btn btn-dourado w-100 py-3" onclick="addToCart()">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                          <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        Adicionar ao Carrinho
                      </button>
                    </div>
                  </div>
                </form>
                <div class="stock-info mt-2">
                  <small class="text-cinza">Em estoque: <strong><%= vinho.getEstoque() %></strong> garrafas disponíveis</small>
                </div>
              </div>

            </div>
          </div>
        </div>

        <!-- Seção "A Palavra dos Agnello" -->
        <div class="row">
          <div class="col-12">
            <div class="agnello-word-section bg-white rounded shadow-sm overflow-hidden">

              <!-- Header da Seção -->
              <div class="agnello-word-header bg-dourado text-white p-4">
                <h3 class="font-playfair mb-0 text-center">
                  <span style="font-size: 2rem;">"</span>
                  A Palavra dos Agnello
                  <span style="font-size: 2rem;">"</span>
                </h3>
              </div>

              <!-- Conteúdo da Descrição -->
              <div class="agnello-word-content p-5">
                <div class="row justify-content-center">
                  <div class="col-lg-10">
                    <blockquote class="blockquote text-center mb-0">
                      <p class="fs-5 text-marrom font-roboto" style="line-height: 1.8; font-style: italic;">
                        <%
                          String descricaoAgnello = vinho.getDescricaoAgnello();
                          if (descricaoAgnello != null && !descricaoAgnello.trim().isEmpty()) {
                            // Formatar nomes Agnello em negrito
                            descricaoAgnello = descricaoAgnello
                              .replace("Giulio Agnello", "<strong>Giulio Agnello</strong>")
                              .replace("Bianca Agnello", "<strong>Bianca Agnello</strong>");
                        %>
                          <%= descricaoAgnello %>
                        <% } else { %>
                          Descrição não disponível para este vinho.
                        <% } %>
                      </p>
                    </blockquote>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>

        <!-- Botão Voltar ao Catálogo -->
        <div class="row mt-5">
          <div class="col-12 text-center">
            <a href="catalogo.jsp" class="btn btn-agnello">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
              </svg>
              Voltar ao Catálogo
            </a>
          </div>
        </div>

      <% } %>

    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>

<script>
// Funcionalidade do botão adicionar ao carrinho (simulação)
function addToCart() {
  const quantity = document.getElementById('quantity').value;
  const wineName = '<%= vinho != null ? vinho.getNome().replace("'", "\\'") : "" %>';

  if (wineName) {
    alert(`${quantity} garrafa${quantity > 1 ? 's' : ''} de "${wineName}" adicionada${quantity > 1 ? 's' : ''} ao carrinho!`);

    // Aqui seria implementada a lógica real do carrinho
    // Por exemplo: enviar para um servlet ou usar AJAX
  }
}
</script>