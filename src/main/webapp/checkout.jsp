<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.beans.CarrinhoItem" %>
<%
    // Verificar se há carrinho
    @SuppressWarnings("unchecked")
    List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
    boolean carrinhoVazio = carrinho == null || carrinho.isEmpty();

    if (carrinhoVazio) {
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

    request.setAttribute("pageTitle", "Checkout - Vinheria Agnello");
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Checkout Main Section -->
  <main class="py-5 bg-bege">
    <div class="container">

      <!-- Breadcrumb -->
      <div class="row mb-4">
        <div class="col-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp" class="text-dourado">Home</a></li>
              <li class="breadcrumb-item"><a href="carrinho.jsp" class="text-dourado">Carrinho</a></li>
              <li class="breadcrumb-item active text-marrom" aria-current="page">Checkout</li>
            </ol>
          </nav>
        </div>
      </div>

      <!-- Título da Página -->
      <div class="row mb-5">
        <div class="col-12 text-center">
          <h1 class="hero-title">Finalizar Compra</h1>
          <p class="text-marrom">Complete suas informações para concluir o pedido</p>
        </div>
      </div>

      <form method="post" action="confirmacao.jsp">

        <div class="row">

          <!-- Informações do Cliente -->
          <div class="col-lg-8 mb-4">

            <!-- Dados Pessoais -->
            <div class="bg-white rounded shadow-sm p-4 mb-4">
              <h3 class="font-playfair text-marrom mb-4">Dados Pessoais</h3>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="nome" class="form-label text-marrom fw-bold">Nome Completo *</label>
                  <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="email" class="form-label text-marrom fw-bold">E-mail *</label>
                  <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="telefone" class="form-label text-marrom fw-bold">Telefone *</label>
                  <input type="tel" class="form-control" id="telefone" name="telefone" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="cpf" class="form-label text-marrom fw-bold">CPF *</label>
                  <input type="text" class="form-control" id="cpf" name="cpf" required>
                </div>
              </div>
            </div>

            <!-- Endereço de Entrega -->
            <div class="bg-white rounded shadow-sm p-4 mb-4">
              <h3 class="font-playfair text-marrom mb-4">Endereço de Entrega</h3>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cep" class="form-label text-marrom fw-bold">CEP *</label>
                  <input type="text" class="form-control" id="cep" name="cep" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="cidade" class="form-label text-marrom fw-bold">Cidade *</label>
                  <input type="text" class="form-control" id="cidade" name="cidade" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="estado" class="form-label text-marrom fw-bold">Estado *</label>
                  <select class="form-select" id="estado" name="estado" required>
                    <option value="">Selecione...</option>
                    <option value="SP">São Paulo</option>
                    <option value="RJ">Rio de Janeiro</option>
                    <option value="MG">Minas Gerais</option>
                    <option value="RS">Rio Grande do Sul</option>
                  </select>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="bairro" class="form-label text-marrom fw-bold">Bairro *</label>
                  <input type="text" class="form-control" id="bairro" name="bairro" required>
                </div>
                <div class="col-md-8 mb-3">
                  <label for="rua" class="form-label text-marrom fw-bold">Rua *</label>
                  <input type="text" class="form-control" id="rua" name="rua" required>
                </div>
                <div class="col-md-4 mb-3">
                  <label for="numero" class="form-label text-marrom fw-bold">Número *</label>
                  <input type="text" class="form-control" id="numero" name="numero" required>
                </div>
                <div class="col-12 mb-3">
                  <label for="complemento" class="form-label text-marrom fw-bold">Complemento</label>
                  <input type="text" class="form-control" id="complemento" name="complemento">
                </div>
              </div>
            </div>

            <!-- Forma de Pagamento (Mock) -->
            <div class="bg-white rounded shadow-sm p-4">
              <h3 class="font-playfair text-marrom mb-4">Forma de Pagamento</h3>
              <div class="alert alert-info">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
                </svg>
                <strong>Protótipo Demonstrativo:</strong> Esta é uma simulação de checkout. Nenhum pagamento real será processado.
              </div>
              <div class="row">
                <div class="col-12 mb-3">
                  <label class="form-label text-marrom fw-bold">Método de Pagamento *</label>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pagamento" id="cartao" value="cartao" checked>
                    <label class="form-check-label" for="cartao">
                      Cartão de Crédito (Simulado)
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pagamento" id="boleto" value="boleto">
                    <label class="form-check-label" for="boleto">
                      Boleto Bancário (Simulado)
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="pagamento" id="pix" value="pix">
                    <label class="form-check-label" for="pix">
                      PIX (Simulado)
                    </label>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <!-- Resumo do Pedido -->
          <div class="col-lg-4">
            <div class="bg-white rounded shadow-sm p-4 sticky-top" style="top: 20px;">

              <h4 class="font-playfair text-marrom mb-4">Resumo do Pedido</h4>

              <!-- Itens do Carrinho -->
              <div class="mb-4">
                <% for (CarrinhoItem item : carrinho) { %>
                  <div class="d-flex justify-content-between align-items-center mb-2 pb-2 border-bottom">
                    <div class="flex-grow-1">
                      <small class="text-marrom fw-bold"><%= item.getVinhoNome() %></small>
                      <br>
                      <small class="text-cinza">Qtd: <%= item.getQuantidade() %></small>
                    </div>
                    <small class="text-dourado fw-bold"><%= item.getSubtotalFormatado() %></small>
                  </div>
                <% } %>
              </div>

              <!-- Totais -->
              <div class="border-top pt-3">
                <div class="d-flex justify-content-between mb-2">
                  <span class="text-marrom">Subtotal (<%= totalItens %> itens)</span>
                  <span class="text-marrom fw-bold">R$ <%= String.format("%.2f", total).replace(".", ",") %></span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                  <span class="text-marrom">Frete</span>
                  <span class="text-success fw-bold">Grátis</span>
                </div>
                <hr>
                <div class="d-flex justify-content-between mb-3">
                  <span class="text-marrom fw-bold fs-5">Total</span>
                  <span class="text-dourado fw-bold fs-5">R$ <%= String.format("%.2f", total).replace(".", ",") %></span>
                </div>
              </div>

              <!-- Botão Finalizar -->
              <button type="submit" class="btn btn-dourado w-100 py-3 mb-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0V4zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7H0zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1z"/>
                </svg>
                Finalizar Compra
              </button>

              <!-- Voltar ao Carrinho -->
              <a href="carrinho.jsp" class="btn btn-outline-secondary w-100">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="me-2" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
                </svg>
                Voltar ao Carrinho
              </a>

            </div>
          </div>

        </div>

      </form>

    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>