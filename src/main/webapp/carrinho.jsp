<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.beans.CarrinhoItem" %>
<%
    // Processar remoção de itens (POST)
    if ("POST".equals(request.getMethod()) && "remover".equals(request.getParameter("acao"))) {
        try {
            int vinhoId = Integer.parseInt(request.getParameter("vinhoId"));

            @SuppressWarnings("unchecked")
            List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
            if (carrinho != null) {
                carrinho.removeIf(item -> item.getVinhoId() == vinhoId);
                session.setAttribute("carrinho", carrinho);
            }
        } catch (Exception e) {
            // Ignorar erros
        }
    }

    // Obter carrinho da sessão
    @SuppressWarnings("unchecked")
    List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
    boolean carrinhoVazio = carrinho == null || carrinho.isEmpty();

    // Calcular totais
    double total = 0.0;
    int totalItens = 0;
    if (!carrinhoVazio) {
        for (CarrinhoItem item : carrinho) {
            total += item.getSubtotal();
            totalItens += item.getQuantidade();
        }
    }

    request.setAttribute("pageTitle", "Carrinho de Compras - Vinheria Agnello");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Carrinho Main Section -->
  <main class="py-5 bg-bege">
    <div class="container">

      <!-- Breadcrumb -->
      <div class="row mb-4">
        <div class="col-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp" class="text-dourado">Home</a></li>
              <li class="breadcrumb-item active text-marrom" aria-current="page">Carrinho</li>
            </ol>
          </nav>
        </div>
      </div>

      <!-- Título da Página -->
      <div class="row mb-5">
        <div class="col-12 text-center">
          <h1 class="hero-title">Seu Carrinho de Compras</h1>
          <p class="text-marrom">Revise seus vinhos selecionados antes de finalizar a compra</p>
        </div>
      </div>

      <% if (carrinhoVazio) { %>
        <!-- Carrinho Vazio -->
        <div class="row">
          <div class="col-12">
            <div class="text-center py-5">
              <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="text-cinza mb-4" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg>
              <h3 class="text-marrom mb-3">Seu carrinho está vazio</h3>
              <p class="text-cinza mb-4">Explore nosso catálogo e descubra vinhos incríveis para adicionar ao seu carrinho.</p>
              <a href="catalogo.jsp" class="btn btn-dourado btn-lg">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9.5v-4z"/>
                  <path d="M6.5 2A2.5 2.5 0 0 0 4 4.5V14a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V4.5A2.5 2.5 0 0 0 9.5 2h-3zM8 1a3.5 3.5 0 0 1 3.5 3.5v9.664a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V4.5A3.5 3.5 0 0 1 6.5 1h1z"/>
                </svg>
                Explorar Catálogo
              </a>
            </div>
          </div>
        </div>
      <% } else { %>

        <!-- Itens do Carrinho -->
        <div class="row mb-5">
          <div class="col-12">
            <div class="bg-white rounded shadow-sm p-4">

              <!-- Tabela de Itens -->
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead class="table-light">
                    <tr>
                      <th scope="col" class="border-0">Produto</th>
                      <th scope="col" class="border-0 text-center">Quantidade</th>
                      <th scope="col" class="border-0 text-center">Preço Unitário</th>
                      <th scope="col" class="border-0 text-center">Subtotal</th>
                      <th scope="col" class="border-0 text-center">Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% for (CarrinhoItem item : carrinho) { %>
                      <tr>
                        <td class="border-0">
                          <div class="d-flex align-items-center">
                            <img src="<%= item.getVinhoImagem() %>" alt="<%= item.getVinhoNome() %>"
                                 class="rounded me-3" style="width: 60px; height: 80px; object-fit: cover;">
                            <div>
                              <h6 class="mb-0 text-marrom"><%= item.getVinhoNome() %></h6>
                              <small class="text-cinza">ID: <%= item.getVinhoId() %></small>
                            </div>
                          </div>
                        </td>
                        <td class="border-0 text-center align-middle">
                          <span class="badge bg-dourado text-dark fs-6"><%= item.getQuantidade() %></span>
                        </td>
                        <td class="border-0 text-center align-middle text-marrom fw-bold">
                          R$ <%= String.format("%.2f", item.getVinhoPreco()).replace(".", ",") %>
                        </td>
                        <td class="border-0 text-center align-middle text-dourado fw-bold">
                          <%= item.getSubtotalFormatado() %>
                        </td>
                        <td class="border-0 text-center align-middle">
                          <form method="post" action="" class="d-inline">
                            <input type="hidden" name="acao" value="remover">
                            <input type="hidden" name="vinhoId" value="<%= item.getVinhoId() %>">
                            <button type="submit" class="btn btn-outline-danger btn-sm"
                                    onclick="return confirm('Remover <%= item.getVinhoNome() %> do carrinho?')">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                                <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1V1zM3 1v1h10V1a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h1zm0 2H2v10h12V3H3zm2 2a.5.5 0 0 0-.5.5v5a.5.5 0 0 0 1 0v-5A.5.5 0 0 0 5 5zm4 0a.5.5 0 0 0-.5.5v5a.5.5 0 0 0 1 0v-5A.5.5 0 0 0 9 5zm4 0a.5.5 0 0 0-.5.5v5a.5.5 0 0 0 1 0v-5a.5.5 0 0 0-.5-.5z"/>
                              </svg>
                            </button>
                          </form>
                        </td>
                      </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>

              <!-- Resumo do Pedido -->
              <div class="row mt-4 pt-4 border-top">
                <div class="col-md-6">
                  <div class="d-flex align-items-center mb-3">
                    <span class="badge bg-dourado text-dark me-2 fs-6"><%= totalItens %></span>
                    <span class="text-marrom">item<%= totalItens > 1 ? "s" : "" %> no carrinho</span>
                  </div>
                </div>
                <div class="col-md-6 text-end">
                  <div class="border-start ps-4">
                    <h4 class="text-marrom mb-1">Total: <span class="text-dourado">R$ <%= String.format("%.2f", total).replace(".", ",") %></span></h4>
                    <small class="text-cinza">Preços incluem impostos</small>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>

        <!-- Ações do Carrinho -->
        <div class="row">
          <div class="col-12">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">

              <!-- Continuar Comprando -->
              <a href="catalogo.jsp" class="btn btn-outline-dourado">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
                </svg>
                Continuar Comprando
              </a>

              <!-- Finalizar Compra -->
              <a href="checkout.jsp" class="btn btn-dourado btn-lg px-5">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0V4zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7H0zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1z"/>
                </svg>
                Finalizar Compra
              </a>

            </div>
          </div>
        </div>

      <% } %>

    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>