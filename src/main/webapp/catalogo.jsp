<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.vinheria.service.VinhoService" %>
<%@ page import="com.vinheria.beans.Vinho" %>
<%
    // Configurar título da página
    request.setAttribute("pageTitle", "Catálogo de Vinhos - Vinheria Agnello");

    // Instanciar VinhoService
    VinhoService vinhoService = new VinhoService();

    // Obter parâmetros da request
    String busca = request.getParameter("busca");
    String[] tipos = request.getParameterValues("tipos");
    String[] precos = request.getParameterValues("precos");
    String regiao = request.getParameter("regiao");
    String uva = request.getParameter("uva");
    String[] ocasioes = request.getParameterValues("ocasioes");
    String[] perfis = request.getParameterValues("perfis");
    String[] caracteristicas = request.getParameterValues("caracteristicas");
    String[] corpos = request.getParameterValues("corpos");
    String[] docuras = request.getParameterValues("docuras");
    String ordenacao = request.getParameter("ordenacao");

    // Paginação
    String pageParam = request.getParameter("page");
    int paginaAtual = 1;
    if (pageParam != null && !pageParam.trim().isEmpty()) {
        try {
            paginaAtual = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            paginaAtual = 1;
        }
    }
    int itensPorPagina = 9;

    // Aplicar filtros
    List<Vinho> vinhosFiltrados = vinhoService.filtrarVinhos(busca, tipos, precos, regiao, uva,
                                                            ocasioes, perfis, caracteristicas, corpos, docuras);

    // Aplicar ordenação
    if (ordenacao == null || ordenacao.trim().isEmpty()) {
        ordenacao = "relevancia";
    }
    vinhosFiltrados = vinhoService.ordenarVinhos(vinhosFiltrados, ordenacao);

    // Calcular paginação
    int totalVinhos = vinhosFiltrados.size();
    int totalPaginas = vinhoService.calcularTotalPaginas(totalVinhos, itensPorPagina);
    List<Vinho> vinhosPaginados = vinhoService.paginarVinhos(vinhosFiltrados, paginaAtual, itensPorPagina);

    // Calcular range de exibição
    int inicioRange = (paginaAtual - 1) * itensPorPagina + 1;
    int fimRange = Math.min(paginaAtual * itensPorPagina, totalVinhos);
%>

<!-- Include header -->
<%@ include file="includes/header.jsp" %>

  <!-- Catálogo Main Section -->
  <main class="py-5 bg-bege">
    <div class="container">

      <!-- Título e Breadcrumb -->
      <div class="row mb-4">
        <div class="col-12">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp" class="text-dourado">Home</a></li>
              <li class="breadcrumb-item active text-marrom" aria-current="page">Catálogo</li>
            </ol>
          </nav>
          <h1 class="hero-title">Nossa Seleção</h1>
          <p class="lead text-cinza">Descubra vinhos únicos cuidadosamente selecionados pelos Agnello</p>
        </div>
      </div>

      <!-- Formulário de Filtros -->
      <form method="get" action="catalogo.jsp" id="filtrosForm">

        <!-- Barra de Busca -->
        <div class="row mb-4">
          <div class="col-12">
            <div class="search-bar bg-white p-3 rounded shadow-sm">
              <div class="input-group">
                <input type="text" name="busca" class="form-control form-control-lg"
                       placeholder="Busque por nome, região, uva ou tipo de vinho..."
                       value="<%= busca != null ? busca : "" %>" aria-label="Buscar vinhos">
                <button class="btn btn-dourado" type="submit">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="row">

          <!-- Sidebar Filtros -->
          <div class="col-lg-3 mb-4">
            <div class="filters-sidebar bg-white p-4 rounded shadow-sm">
              <h4 class="text-marrom mb-4 font-playfair">Filtros</h4>

              <!-- Filtro Tipo -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Tipo de Vinho</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="tipos" value="tinto" id="tinto"
                         <%= tipos != null && Arrays.asList(tipos).contains("tinto") ? "checked" : "" %>>
                  <label class="form-check-label" for="tinto">Tinto</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="tipos" value="branco" id="branco"
                         <%= tipos != null && Arrays.asList(tipos).contains("branco") ? "checked" : "" %>>
                  <label class="form-check-label" for="branco">Branco</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="tipos" value="rosé" id="rose"
                         <%= tipos != null && Arrays.asList(tipos).contains("rosé") ? "checked" : "" %>>
                  <label class="form-check-label" for="rose">Rosé</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="tipos" value="espumante" id="espumante"
                         <%= tipos != null && Arrays.asList(tipos).contains("espumante") ? "checked" : "" %>>
                  <label class="form-check-label" for="espumante">Espumante</label>
                </div>
              </div>

              <!-- Filtro Preço -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Faixa de Preço</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="precos" value="preco1" id="preco1"
                         <%= precos != null && Arrays.asList(precos).contains("preco1") ? "checked" : "" %>>
                  <label class="form-check-label" for="preco1">Até R$ 100</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="precos" value="preco2" id="preco2"
                         <%= precos != null && Arrays.asList(precos).contains("preco2") ? "checked" : "" %>>
                  <label class="form-check-label" for="preco2">R$ 100 - R$ 200</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="precos" value="preco3" id="preco3"
                         <%= precos != null && Arrays.asList(precos).contains("preco3") ? "checked" : "" %>>
                  <label class="form-check-label" for="preco3">R$ 200 - R$ 500</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="precos" value="preco4" id="preco4"
                         <%= precos != null && Arrays.asList(precos).contains("preco4") ? "checked" : "" %>>
                  <label class="form-check-label" for="preco4">Acima de R$ 500</label>
                </div>
              </div>

              <!-- Filtro Região -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Região</h6>
                <select class="form-select" name="regiao">
                  <option value="">Todas as regiões</option>
                  <option value="franca" <%= "franca".equals(regiao) ? "selected" : "" %>>França</option>
                  <option value="italia" <%= "italia".equals(regiao) ? "selected" : "" %>>Itália</option>
                  <option value="portugal" <%= "portugal".equals(regiao) ? "selected" : "" %>>Portugal</option>
                  <option value="argentina" <%= "argentina".equals(regiao) ? "selected" : "" %>>Argentina</option>
                  <option value="brasil" <%= "brasil".equals(regiao) ? "selected" : "" %>>Brasil</option>
                  <option value="chile" <%= "chile".equals(regiao) ? "selected" : "" %>>Chile</option>
                  <option value="espanha" <%= "espanha".equals(regiao) ? "selected" : "" %>>Espanha</option>
                  <option value="alemanha" <%= "alemanha".equals(regiao) ? "selected" : "" %>>Alemanha</option>
                  <option value="australia" <%= "australia".equals(regiao) ? "selected" : "" %>>Austrália</option>
                  <option value="eua" <%= "eua".equals(regiao) ? "selected" : "" %>>Estados Unidos</option>
                </select>
              </div>

              <!-- Filtro Uva -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Tipo de Uva</h6>
                <select class="form-select" name="uva">
                  <option value="">Todas as uvas</option>
                  <option value="cabernet" <%= "cabernet".equals(uva) ? "selected" : "" %>>Cabernet Sauvignon</option>
                  <option value="merlot" <%= "merlot".equals(uva) ? "selected" : "" %>>Merlot</option>
                  <option value="pinot" <%= "pinot".equals(uva) ? "selected" : "" %>>Pinot Noir</option>
                  <option value="chardonnay" <%= "chardonnay".equals(uva) ? "selected" : "" %>>Chardonnay</option>
                  <option value="sauvignon" <%= "sauvignon".equals(uva) ? "selected" : "" %>>Sauvignon Blanc</option>
                  <option value="malbec" <%= "malbec".equals(uva) ? "selected" : "" %>>Malbec</option>
                  <option value="tempranillo" <%= "tempranillo".equals(uva) ? "selected" : "" %>>Tempranillo</option>
                  <option value="nebbiolo" <%= "nebbiolo".equals(uva) ? "selected" : "" %>>Nebbiolo</option>
                  <option value="sangiovese" <%= "sangiovese".equals(uva) ? "selected" : "" %>>Sangiovese</option>
                  <option value="riesling" <%= "riesling".equals(uva) ? "selected" : "" %>>Riesling</option>
                </select>
              </div>

              <!-- Filtros Especiais -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Características</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="caracteristicas" value="escolhaAgnello" id="escolhaAgnello"
                         <%= caracteristicas != null && Arrays.asList(caracteristicas).contains("escolhaAgnello") ? "checked" : "" %>>
                  <label class="form-check-label" for="escolhaAgnello">Escolha dos Agnello</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="caracteristicas" value="organico" id="organico"
                         <%= caracteristicas != null && Arrays.asList(caracteristicas).contains("organico") ? "checked" : "" %>>
                  <label class="form-check-label" for="organico">Orgânico</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="caracteristicas" value="reserva" id="reserva"
                         <%= caracteristicas != null && Arrays.asList(caracteristicas).contains("reserva") ? "checked" : "" %>>
                  <label class="form-check-label" for="reserva">Reserva</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="caracteristicas" value="premium" id="premium"
                         <%= caracteristicas != null && Arrays.asList(caracteristicas).contains("premium") ? "checked" : "" %>>
                  <label class="form-check-label" for="premium">Premium</label>
                </div>
              </div>

              <!-- Filtro Ocasião -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Ocasião</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="jantar-especial" id="jantar-especial"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("jantar-especial") ? "checked" : "" %>>
                  <label class="form-check-label" for="jantar-especial">Jantar Especial</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="celebracao" id="celebracao"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("celebracao") ? "checked" : "" %>>
                  <label class="form-check-label" for="celebracao">Celebração</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="aperitivo" id="aperitivo"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("aperitivo") ? "checked" : "" %>>
                  <label class="form-check-label" for="aperitivo">Aperitivo</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="almoco" id="almoco"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("almoco") ? "checked" : "" %>>
                  <label class="form-check-label" for="almoco">Almoço</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="happy-hour" id="happy-hour"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("happy-hour") ? "checked" : "" %>>
                  <label class="form-check-label" for="happy-hour">Happy Hour</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="jantar-romantico" id="jantar-romantico"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("jantar-romantico") ? "checked" : "" %>>
                  <label class="form-check-label" for="jantar-romantico">Jantar Romântico</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="churrasco" id="churrasco"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("churrasco") ? "checked" : "" %>>
                  <label class="form-check-label" for="churrasco">Churrasco</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="ocasioes" value="sobremesa" id="sobremesa"
                         <%= ocasioes != null && Arrays.asList(ocasioes).contains("sobremesa") ? "checked" : "" %>>
                  <label class="form-check-label" for="sobremesa">Sobremesa</label>
                </div>
              </div>

              <!-- Filtro Perfil -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Perfil do Apreciador</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="sem-erro" id="sem-erro"
                         <%= perfis != null && Arrays.asList(perfis).contains("sem-erro") ? "checked" : "" %>>
                  <label class="form-check-label" for="sem-erro">Sem Erro</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="aventureiro" id="aventureiro"
                         <%= perfis != null && Arrays.asList(perfis).contains("aventureiro") ? "checked" : "" %>>
                  <label class="form-check-label" for="aventureiro">Aventureiro</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="sofisticado" id="sofisticado"
                         <%= perfis != null && Arrays.asList(perfis).contains("sofisticado") ? "checked" : "" %>>
                  <label class="form-check-label" for="sofisticado">Sofisticado</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="tradicionalista" id="tradicionalista"
                         <%= perfis != null && Arrays.asList(perfis).contains("tradicionalista") ? "checked" : "" %>>
                  <label class="form-check-label" for="tradicionalista">Tradicionalista</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="descontraido" id="descontraido"
                         <%= perfis != null && Arrays.asList(perfis).contains("descontraido") ? "checked" : "" %>>
                  <label class="form-check-label" for="descontraido">Descontraído</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="explorador" id="explorador"
                         <%= perfis != null && Arrays.asList(perfis).contains("explorador") ? "checked" : "" %>>
                  <label class="form-check-label" for="explorador">Explorador</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="colecionador" id="colecionador"
                         <%= perfis != null && Arrays.asList(perfis).contains("colecionador") ? "checked" : "" %>>
                  <label class="form-check-label" for="colecionador">Colecionador</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="perfis" value="consciente" id="consciente"
                         <%= perfis != null && Arrays.asList(perfis).contains("consciente") ? "checked" : "" %>>
                  <label class="form-check-label" for="consciente">Consciente</label>
                </div>
              </div>

              <!-- Filtro Corpo -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Corpo</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="corpos" value="leve" id="leve"
                         <%= corpos != null && Arrays.asList(corpos).contains("leve") ? "checked" : "" %>>
                  <label class="form-check-label" for="leve">Leve</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="corpos" value="medio" id="medio"
                         <%= corpos != null && Arrays.asList(corpos).contains("medio") ? "checked" : "" %>>
                  <label class="form-check-label" for="medio">Médio</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="corpos" value="encorpado" id="encorpado"
                         <%= corpos != null && Arrays.asList(corpos).contains("encorpado") ? "checked" : "" %>>
                  <label class="form-check-label" for="encorpado">Encorpado</label>
                </div>
              </div>

              <!-- Filtro Doçura -->
              <div class="filter-group mb-4">
                <h6 class="text-dourado mb-3">Doçura</h6>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="docuras" value="seco" id="seco"
                         <%= docuras != null && Arrays.asList(docuras).contains("seco") ? "checked" : "" %>>
                  <label class="form-check-label" for="seco">Seco</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="docuras" value="meio-seco" id="meio-seco"
                         <%= docuras != null && Arrays.asList(docuras).contains("meio-seco") ? "checked" : "" %>>
                  <label class="form-check-label" for="meio-seco">Meio-seco</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="docuras" value="meio-doce" id="meio-doce"
                         <%= docuras != null && Arrays.asList(docuras).contains("meio-doce") ? "checked" : "" %>>
                  <label class="form-check-label" for="meio-doce">Meio-doce</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="docuras" value="brut" id="brut"
                         <%= docuras != null && Arrays.asList(docuras).contains("brut") ? "checked" : "" %>>
                  <label class="form-check-label" for="brut">Brut</label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="docuras" value="brut-nature" id="brut-nature"
                         <%= docuras != null && Arrays.asList(docuras).contains("brut-nature") ? "checked" : "" %>>
                  <label class="form-check-label" for="brut-nature">Brut Nature</label>
                </div>
              </div>

              <!-- Botões -->
              <button type="submit" class="btn btn-dourado w-100 mb-2">Aplicar Filtros</button>
              <a href="catalogo.jsp" class="btn btn-outline-secondary w-100">Limpar Filtros</a>
            </div>
          </div>

          <!-- Grid de Produtos -->
          <div class="col-lg-9">

            <!-- Toolbar Superior -->
            <div class="d-flex justify-content-between align-items-center mb-4">
              <p class="text-cinza mb-0">
                <% if (totalVinhos > 0) { %>
                  Mostrando <%= inicioRange %>-<%= fimRange %> de <%= totalVinhos %> vinhos
                <% } else { %>
                  Nenhum vinho encontrado
                <% } %>
              </p>
              <div class="d-flex align-items-center">
                <label for="ordenacao" class="me-2 text-marrom">Ordenar por:</label>
                <select class="form-select form-select-sm" name="ordenacao" id="ordenacao"
                        style="width: auto;" onchange="document.getElementById('filtrosForm').submit();">
                  <option value="relevancia" <%= "relevancia".equals(ordenacao) ? "selected" : "" %>>Relevância</option>
                  <option value="nome" <%= "nome".equals(ordenacao) ? "selected" : "" %>>Nome (A-Z)</option>
                  <option value="preco-menor" <%= "preco-menor".equals(ordenacao) ? "selected" : "" %>>Menor Preço</option>
                  <option value="preco-maior" <%= "preco-maior".equals(ordenacao) ? "selected" : "" %>>Maior Preço</option>
                  <option value="avaliacao" <%= "avaliacao".equals(ordenacao) ? "selected" : "" %>>Melhor Avaliação</option>
                </select>
              </div>
            </div>

            <!-- Grid de Produtos -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mb-5">
              <% if (vinhosPaginados.isEmpty()) { %>
                <div class="col-12 text-center py-5">
                  <h4 class="text-cinza">Nenhum vinho encontrado</h4>
                  <p class="text-cinza">Tente ajustar os filtros para encontrar vinhos disponíveis.</p>
                </div>
              <% } else { %>
                <% for (Vinho vinho : vinhosPaginados) { %>
                  <div class="col">
                    <div class="card wine-card h-100 shadow-sm" style="cursor: pointer;"
                         onclick="window.location.href='detalhe-vinho.jsp?id=<%= vinho.getId() %>'">
                      <div class="position-relative">
                        <img src="<%= vinho.getImagem() %>" class="card-img-top" alt="<%= vinho.getNome() %>">

                        <!-- Badges -->
                        <div class="badges-container position-absolute top-0 start-0 p-2">
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
                            <span class="badge <%= badgeClass %> mt-1"><%= badge %></span>
                          <% }
                             } %>
                        </div>

                        <!-- Rating -->
                        <div class="rating-container position-absolute top-0 end-0 p-2">
                          <div class="rating text-warning">
                            <%= vinho.getEstrelas() %>
                          </div>
                        </div>
                      </div>

                      <div class="card-body d-flex flex-column">
                        <h6 class="card-title text-marrom font-playfair"><%= vinho.getNome() %></h6>
                        <p class="card-text text-cinza small mb-2">
                          <%= vinho.getRegiao() %> • <%= vinho.getUva() %> • <%= vinho.getAno() %>
                        </p>
                        <p class="card-text text-cinza small flex-grow-1"><%= vinho.getDescricaoCurta() %></p>
                        <div class="price-section mt-auto">
                          <h5 class="text-dourado mb-2"><%= vinho.getPrecoFormatado() %></h5>
                          <div class="d-grid">
                            <a href="detalhe-vinho.jsp?id=<%= vinho.getId() %>"
                               class="btn btn-dourado btn-sm text-decoration-none"
                               onclick="event.stopPropagation();">
                              Ver Detalhes
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <% } %>
              <% } %>
            </div>

            <!-- Paginação -->
            <% if (totalPaginas > 1) { %>
              <nav aria-label="Navegação do catálogo">
                <ul class="pagination justify-content-center">
                  <!-- Botão Anterior -->
                  <li class="page-item <%= paginaAtual == 1 ? "disabled" : "" %>">
                    <% if (paginaAtual > 1) { %>
                      <a class="page-link" href="catalogo.jsp?page=<%= paginaAtual - 1 %>&busca=<%= busca != null ? busca : "" %>&ordenacao=<%= ordenacao %>">Anterior</a>
                    <% } else { %>
                      <span class="page-link">Anterior</span>
                    <% } %>
                  </li>

                  <!-- Páginas numeradas -->
                  <% for (int i = 1; i <= totalPaginas; i++) {
                       if (i == paginaAtual) { %>
                    <li class="page-item active">
                      <span class="page-link"><%= i %></span>
                    </li>
                  <% } else if (i == 1 || i == totalPaginas || Math.abs(i - paginaAtual) <= 1) { %>
                    <li class="page-item">
                      <a class="page-link" href="catalogo.jsp?page=<%= i %>&busca=<%= busca != null ? busca : "" %>&ordenacao=<%= ordenacao %>"><%= i %></a>
                    </li>
                  <% } else if (i == paginaAtual - 2 || i == paginaAtual + 2) { %>
                    <li class="page-item disabled">
                      <span class="page-link">...</span>
                    </li>
                  <% }
                     } %>

                  <!-- Botão Próximo -->
                  <li class="page-item <%= paginaAtual == totalPaginas ? "disabled" : "" %>">
                    <% if (paginaAtual < totalPaginas) { %>
                      <a class="page-link" href="catalogo.jsp?page=<%= paginaAtual + 1 %>&busca=<%= busca != null ? busca : "" %>&ordenacao=<%= ordenacao %>">Próximo</a>
                    <% } else { %>
                      <span class="page-link">Próximo</span>
                    <% } %>
                  </li>
                </ul>
              </nav>
            <% } %>

          </div>
        </div>
      </form>
    </div>
  </main>

<!-- Include footer -->
<%@ include file="includes/footer.jsp" %>

<script>
// Auto-submit form quando filtros são alterados
document.querySelectorAll('input[type="checkbox"], select').forEach(function(element) {
  element.addEventListener('change', function() {
    document.getElementById('filtrosForm').submit();
  });
});
</script>