<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.vinheria.beans.QuizResposta" %>
<%@ page import="com.vinheria.beans.Vinho" %>
<%@ page import="com.vinheria.service.VinhoService" %>
<%@ page import="java.util.List" %>

<%
    String pageTitle = "Sua Seleção - Descubra seu Vinho";

    // Recuperar quiz da sessão
    QuizResposta quiz = (QuizResposta) session.getAttribute("quiz");

    if (quiz == null || !quiz.isCompleto()) {
        response.sendRedirect(request.getContextPath() + "/quiz/descubra-inicio.jsp");
        return;
    }

    // Gerar recomendações
    VinhoService vinhoService = new VinhoService();
    List<Vinho> recomendacoes = vinhoService.recomendarVinhos(quiz);
%>

<%@ include file="../includes/quiz-header.jsp" %>

<div class="container py-5">
    <!-- Header de Resultados -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10 text-center">
            <h1 class="display-4 text-agnello-brown mb-3">A Seleção dos Agnello para Você</h1>
            <p class="lead text-muted">
                Baseado no seu perfil e preferências, escolhemos especialmente estes vinhos para você
            </p>
        </div>
    </div>

    <!-- Resumo das Respostas -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm bg-agnello-beige">
                <div class="card-body p-4">
                    <h5 class="text-agnello-brown mb-3">Seu Perfil</h5>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <small class="text-muted">Ocasião:</small>
                            <strong class="ms-2"><%= quiz.getOcasiao() %></strong>
                        </div>
                        <div class="col-md-6 mb-2">
                            <small class="text-muted">Perfil:</small>
                            <strong class="ms-2"><%= quiz.getPerfil() %></strong>
                        </div>
                        <div class="col-md-6 mb-2">
                            <small class="text-muted">Tipo Preferido:</small>
                            <strong class="ms-2"><%= quiz.getTipoPreferido() %></strong>
                        </div>
                        <div class="col-md-6 mb-2">
                            <small class="text-muted">Orçamento:</small>
                            <strong class="ms-2"><%= quiz.getFaixaOrcamento() %></strong>
                        </div>
                        <div class="col-12 mb-2">
                            <small class="text-muted">Características:</small>
                            <strong class="ms-2"><%= quiz.getCaracteristicas() %></strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recomendações -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="row">
                <% for (int i = 0; i < recomendacoes.size(); i++) {
                    Vinho vinho = recomendacoes.get(i);
                    String posicao = (i == 0) ? "Primeira" : (i == 1) ? "Segunda" : "Terceira";
                %>
                    <div class="col-lg-4 mb-4">
                        <div class="card h-100 shadow-sm recommendation-card">
                            <!-- Badge de posição -->
                            <div class="position-absolute top-0 start-0 m-3">
                                <span class="badge bg-agnello-gold text-dark">
                                    <%= posicao %> Recomendação
                                </span>
                            </div>

                            <!-- Imagem do vinho -->
                            <div class="card-img-top-container" style="height: 300px; overflow: hidden;">
                                <img src="<%= vinho.getImagem() %>" class="card-img-top h-100 object-fit-cover" alt="<%= vinho.getNome() %>">
                            </div>

                            <div class="card-body d-flex flex-column">
                                <!-- Informações básicas -->
                                <div class="mb-3">
                                    <h5 class="card-title text-agnello-brown"><%= vinho.getNome() %></h5>
                                    <p class="text-muted small mb-2"><%= vinho.getRegiao() %> • <%= vinho.getUva() %> • <%= vinho.getAno() %></p>

                                    <!-- Avaliação -->
                                    <div class="mb-2">
                                        <span class="text-warning"><%= vinho.getEstrelas() %></span>
                                        <small class="text-muted ms-2">(<%= vinho.getAvaliacao() %>/5)</small>
                                    </div>

                                    <!-- Preço -->
                                    <div class="mb-3">
                                        <span class="h5 text-agnello-brown"><%= vinho.getPrecoFormatado() %></span>
                                        <% if (vinho.isEscolhaAgnello()) { %>
                                            <span class="badge bg-agnello-gold text-dark ms-2">Escolha Agnello</span>
                                        <% } %>
                                    </div>

                                    <!-- Características -->
                                    <div class="mb-3">
                                        <small class="text-muted">
                                            <strong>Corpo:</strong> <%= vinho.getCorpo() %> •
                                            <strong>Doçura:</strong> <%= vinho.getDocura() %>
                                        </small>
                                    </div>
                                </div>

                                <!-- A Palavra dos Agnello -->
                                <div class="agnello-quote-mini mb-3 flex-grow-1">
                                    <div class="agnello-quote-header-mini mb-2">
                                        <h6 class="agnello-quote-title-mini">A Palavra dos Agnello</h6>
                                    </div>
                                    <div class="agnello-quote-content-mini">
                                        <p class="small mb-0"><%= vinho.getDescricaoAgnello() %></p>
                                    </div>
                                </div>

                                <!-- Ações -->
                                <div class="mt-auto">
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <a href="${pageContext.request.contextPath}/html/detalhe-vinho.html?id=<%= vinho.getId() %>"
                                               class="btn btn-outline-agnello btn-sm w-100">
                                                Ver Detalhes
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-agnello-primary btn-sm w-100">
                                                Adicionar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </div>

    <!-- Mensagem dos Agnello -->
    <div class="row justify-content-center mt-5">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-5">
                    <div class="agnello-quote-section">
                        <div class="agnello-quote-header mb-4">
                            <h3 class="agnello-quote-title">Nossa Recomendação Final</h3>
                        </div>

                        <div class="agnello-quote-content">
                            <div class="quote-mark">"</div>
                            <p class="mb-4">
                                Cada um destes vinhos foi escolhido pensando especificamente no seu perfil e no momento que você descreveu.
                                Nossa experiência de décadas nos ensinou que não existe vinho perfeito - existe o vinho perfeito para cada pessoa e ocasião.
                            </p>
                            <p class="mb-4">
                                Se tiver qualquer dúvida sobre essas recomendações, não hesite em nos procurar.
                                Estamos sempre disponíveis para uma conversa sobre vinhos - é nossa paixão compartilhar essas descobertas com você.
                            </p>
                            <div class="quote-mark quote-mark-end">"</div>
                        </div>

                        <div class="agnello-signature">
                            <p class="mb-0"><strong>Giulio e Bianca Agnello</strong></p>
                            <small class="text-muted">Proprietários da Vinheria Agnello</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Ações Finais -->
    <div class="row justify-content-center mt-5">
        <div class="col-lg-6 text-center">
            <div class="d-grid gap-3">
                <a href="${pageContext.request.contextPath}/html/catalogo.html" class="btn btn-agnello-primary btn-lg">
                    Ver Todo o Catálogo
                </a>

                <form action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp" method="post" class="d-inline">
                    <input type="hidden" name="action" value="iniciar">
                    <button type="submit" class="btn btn-outline-agnello">
                        Fazer Novo Quiz
                    </button>
                </form>

                <a href="${pageContext.request.contextPath}/html/home.html" class="btn btn-link text-muted">
                    Voltar ao Início
                </a>
            </div>
        </div>
    </div>
</div>

<%
    // Limpar quiz da sessão após mostrar resultado
    session.removeAttribute("quiz");
%>

<%@ include file="../includes/quiz-footer.jsp" %>