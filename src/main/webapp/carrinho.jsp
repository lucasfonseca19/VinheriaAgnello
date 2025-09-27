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
              <i class="bi bi-cart text-cinza mb-4" style="font-size: 5rem;"></i>
              <h3 class="text-marrom mb-3">Seu carrinho está vazio</h3>
              <p class="text-cinza mb-4">Explore nosso catálogo e descubra vinhos incríveis para adicionar ao seu carrinho.</p>
              <a href="catalogo.jsp" class="btn btn-dourado btn-lg">
                <i class="bi bi-clock me-2"></i>
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
                              <i class="bi bi-trash"></i>
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
                <i class="bi bi-arrow-left me-2"></i>
                Continuar Comprando
              </a>

              <!-- Finalizar Compra -->
              <a href="checkout.jsp" class="btn btn-dourado btn-lg px-5">
                <i class="bi bi-credit-card me-2"></i>
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