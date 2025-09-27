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
              <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="text-success mb-4" viewBox="0 0 16 16">
                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 0 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 1-.708-1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
              </svg>
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
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 16 0zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0-2z"/>
              </svg>
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
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9.5v-4z"/>
                  <path d="M6.5 2A2.5 2.5 0 0 0 4 4.5V14a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V4.5A2.5 2.5 0 0 0 9.5 2h-3zM8 1a3.5 3.5 0 0 1 3.5 3.5v9.664a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3V4.5A3.5 3.5 0 0 1 6.5 1h1z"/>
                </svg>
                Continuar Explorando
              </a>
              <a href="index.jsp" class="btn btn-outline-dourado">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                </svg>
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