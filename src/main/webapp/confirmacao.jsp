<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.beans.CarrinhoItem" %>
<%
    // Verificar se é POST e há dados
    if (!"POST".equals(request.getMethod())) {
        response.sendRedirect("carrinho.jsp");
        return;
    }

    // Obter dados do formulário
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String metodoPagamento = request.getParameter("pagamento");

    // Obter carrinho antes de limpar
    @SuppressWarnings("unchecked")
    List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");

    if (carrinho == null || carrinho.isEmpty()) {
        response.sendRedirect("carrinho.jsp");
        return;
    }

    // Calcular totais
    double total = 0.0;
    int totalItens = 0;
    for (CarrinhoItem item : carrinho) {
        total += item.getSubtotal();
        totalItens += item.getQuantidade();
    }

    // Gerar número do pedido (simulado)
    String numeroPedido = "AGN" + System.currentTimeMillis();

    // Limpar carrinho da sessão (simulando conclusão da compra)
    session.removeAttribute("carrinho");

    request.setAttribute("pageTitle", "Compra Confirmada - Vinheria Agnello");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Confirmação Main Section -->
  <main class="py-5 bg-bege">
    <div class="container">

      <!-- Mensagem de Sucesso -->
      <div class="row mb-5">
        <div class="col-12">
          <div class="text-center">
            <div class="bg-white rounded shadow-sm p-5 mb-4">
              <i class="bi bi-check-circle text-success mb-4" style="font-size: 5rem;"></i>
              <h1 class="hero-title text-success mb-3">Compra Confirmada!</h1>
              <p class="text-marrom fs-5 mb-4">Obrigado por escolher a Vinheria Agnello, <%= nome %>!</p>
              <div class="alert alert-success" role="alert">
                <h5 class="alert-heading">Pedido #<%= numeroPedido %></h5>
                <p class="mb-0">Seu pedido foi processado com sucesso. Você receberá um e-mail de confirmação em <strong><%= email %></strong> em breve.</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Detalhes do Pedido -->
      <div class="row mb-5">
        <div class="col-lg-8 mx-auto">

          <!-- Resumo do Pedido -->
          <div class="bg-white rounded shadow-sm p-4 mb-4">
            <h3 class="font-playfair text-marrom mb-4">Resumo do Pedido</h3>

            <div class="row mb-3">
              <div class="col-sm-6">
                <strong class="text-marrom">Número do Pedido:</strong><br>
                <span class="text-dourado">#<%= numeroPedido %></span>
              </div>
              <div class="col-sm-6">
                <strong class="text-marrom">Forma de Pagamento:</strong><br>
                <span class="text-dourado">
                  <% if ("cartao".equals(metodoPagamento)) { %>
                    Cartão de Crédito
                  <% } else if ("boleto".equals(metodoPagamento)) { %>
                    Boleto Bancário
                  <% } else if ("pix".equals(metodoPagamento)) { %>
                    PIX
                  <% } %>
                </span>
              </div>
            </div>

            <hr>

            <!-- Itens Comprados -->
            <h5 class="text-marrom mb-3">Itens Comprados</h5>
            <div class="table-responsive">
              <table class="table table-sm">
                <thead class="table-light">
                  <tr>
                    <th scope="col">Produto</th>
                    <th scope="col" class="text-center">Qtd</th>
                    <th scope="col" class="text-center">Preço</th>
                    <th scope="col" class="text-center">Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <% for (CarrinhoItem item : carrinho) { %>
                    <tr>
                      <td>
                        <div class="d-flex align-items-center">
                          <img src="<%= item.getVinhoImagem() %>" alt="<%= item.getVinhoNome() %>"
                               class="rounded me-2" style="width: 40px; height: 50px; object-fit: cover;">
                          <span class="text-marrom"><%= item.getVinhoNome() %></span>
                        </div>
                      </td>
                      <td class="text-center"><%= item.getQuantidade() %></td>
                      <td class="text-center">R$ <%= String.format("%.2f", item.getVinhoPreco()).replace(".", ",") %></td>
                      <td class="text-center text-dourado fw-bold"><%= item.getSubtotalFormatado() %></td>
                    </tr>
                  <% } %>
                </tbody>
                <tfoot class="table-light">
                  <tr>
                    <td colspan="3" class="text-end fw-bold">Total</td>
                    <td class="text-center text-dourado fw-bold fs-5">R$ <%= String.format("%.2f", total).replace(".", ",") %></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>

          <!-- Informações de Entrega -->
          <div class="bg-white rounded shadow-sm p-4 mb-4">
            <h3 class="font-playfair text-marrom mb-4">Informações de Entrega</h3>
            <div class="alert alert-info">
              <i class="bi bi-info-circle me-2"></i>
              <strong>Protótipo Demonstrativo:</strong> Esta é uma simulação. Nenhum produto será enviado.
            </div>
            <p class="text-marrom mb-1"><strong>Cliente:</strong> <%= nome %></p>
            <p class="text-marrom mb-1"><strong>E-mail:</strong> <%= email %></p>
            <p class="text-marrom mb-0"><strong>Telefone:</strong> <%= telefone %></p>
          </div>

        </div>
      </div>

      <!-- Ações -->
      <div class="row">
        <div class="col-12 text-center">
          <div class="bg-white rounded shadow-sm p-4">
            <h4 class="font-playfair text-marrom mb-4">"A Palavra dos Agnello"</h4>
            <blockquote class="blockquote text-center mb-4">
              <p class="fs-5 text-marrom font-roboto" style="line-height: 1.8; font-style: italic;">
                "Obrigado por confiar na nossa curadoria. Cada vinho que você escolheu foi selecionado com o mesmo cuidado que Giulio dedica aos seus clientes na loja física. Esperamos que esta experiência digital tenha sido tão pessoal quanto uma visita à Vinheria Agnello."
              </p>
              <footer class="blockquote-footer text-marrom">
                <strong>Giulio e Bianca Agnello</strong>
              </footer>
            </blockquote>

            <div class="d-flex justify-content-center gap-3 flex-wrap">
              <a href="catalogo.jsp" class="btn btn-dourado">
                <i class="bi bi-clock me-2"></i>
                Continuar Explorando
              </a>
              <a href="index.jsp" class="btn btn-outline-dourado">
                <i class="bi bi-house me-2"></i>
                Voltar ao Início
              </a>
            </div>
          </div>
        </div>
      </div>

    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>