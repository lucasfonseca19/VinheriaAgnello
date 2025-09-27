<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.service.VinhoService" %>
<%@ page import="com.vinheria.beans.Vinho" %>
<%@ page import="com.vinheria.beans.CarrinhoItem" %>
<%
    // Processar adição ao carrinho (POST)
    String successMessage = null;
    if ("POST".equals(request.getMethod())) {
        try {
            int vinhoId = Integer.parseInt(request.getParameter("vinhoId"));
            int quantidade = Integer.parseInt(request.getParameter("quantity"));

            VinhoService vinhoService = new VinhoService();
            Vinho vinhoParaCarrinho = vinhoService.buscarPorId(vinhoId);

            if (vinhoParaCarrinho != null && quantidade > 0) {
                // Obter ou criar carrinho na sessão
                @SuppressWarnings("unchecked")
                List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
                if (carrinho == null) {
                    carrinho = new ArrayList<>();
                }

                // Verificar se o vinho já está no carrinho
                boolean encontrado = false;
                for (CarrinhoItem item : carrinho) {
                    if (item.getVinhoId() == vinhoId) {
                        item.setQuantidade(item.getQuantidade() + quantidade);
                        encontrado = true;
                        break;
                    }
                }

                // Se não encontrou, adicionar novo item
                if (!encontrado) {
                    CarrinhoItem novoItem = new CarrinhoItem(
                        vinhoId,
                        vinhoParaCarrinho.getNome(),
                        vinhoParaCarrinho.getPreco(),
                        vinhoParaCarrinho.getImagem(),
                        quantidade
                    );
                    carrinho.add(novoItem);
                }

                // Salvar carrinho na sessão
                session.setAttribute("carrinho", carrinho);
                successMessage = quantidade + " garrafa" + (quantidade > 1 ? "s" : "") + " de \"" + vinhoParaCarrinho.getNome() + "\" adicionada" + (quantidade > 1 ? "s" : "") + " ao carrinho!";
            }
        } catch (Exception e) {
            // Ignorar erros para manter simplicidade
        }
    }

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

      <!-- Mensagem de Sucesso -->
      <% if (successMessage != null) { %>
        <div class="row mb-4">
          <div class="col-12">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              <i class="bi bi-check-circle me-2"></i>
              <%= successMessage %>
              <a href="carrinho.jsp" class="alert-link ms-2">Ver Carrinho</a>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          </div>
        </div>
      <% } %>

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
                <form method="post" action="">
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
                      <button type="submit" class="btn btn-dourado w-100 py-3">
                        <i class="bi bi-cart me-2"></i>
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
              <i class="bi bi-arrow-left me-2"></i>
              Voltar ao Catálogo
            </a>
          </div>
        </div>

      <% } %>

    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>