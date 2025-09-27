<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="com.vinheria.beans.QuizResposta" %>
<%@ page import="java.util.*" %>

<%
    String pageTitle = "Quiz - Descubra seu Vinho";

    // Inicializar ou recuperar quiz da sessão
    QuizResposta quiz = (QuizResposta) session.getAttribute("quiz");

    String action = request.getParameter("action");

    if (quiz == null || "iniciar".equals(action)) {
        quiz = new QuizResposta();
        session.setAttribute("quiz", quiz);
    }

    // Processar resposta se foi enviada
    String resposta = request.getParameter("resposta");
    if (resposta != null && !resposta.trim().isEmpty()) {
        switch (quiz.getPerguntaAtual()) {
            case 1:
                quiz.setOcasiao(resposta);
                break;
            case 2:
                quiz.setPerfil(resposta);
                break;
            case 3:
                quiz.setTipoPreferido(resposta);
                break;
            case 4:
                quiz.setFaixaOrcamento(resposta);
                break;
            case 5:
                quiz.setCaracteristicas(resposta);
                break;
        }
        quiz.proximaPergunta();
        session.setAttribute("quiz", quiz);
    }

    // Navegar entre perguntas
    if ("anterior".equals(action)) {
        quiz.perguntaAnterior();
        session.setAttribute("quiz", quiz);
    }

    // Redirecionar para resultado se completou
    if (quiz.isCompleto()) {
        response.sendRedirect(request.getContextPath() + "/quiz/descubra-resultado.jsp");
        return;
    }

    int perguntaAtual = quiz.getPerguntaAtual();
    double progresso = quiz.getProgresso();
%>

<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <!-- Progress Bar -->
    <div class="row justify-content-center mb-4">
        <div class="col-lg-8">
            <div class="quiz-progress">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="small text-muted">Pergunta <%= perguntaAtual %> de 5</span>
                    <span class="small text-muted"><%= String.format("%.0f", progresso) %>% completo</span>
                </div>
                <div class="progress mb-3" style="height: 8px;">
                    <div class="progress-bar bg-agnello-gold" role="progressbar"
                         style="width: <%= progresso %>%"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pergunta -->
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-5">

                    <% if (perguntaAtual == 1) { %>
                        <!-- Pergunta 1: Ocasião -->
                        <div class="quiz-question">
                            <h2 class="text-agnello-brown mb-4 text-center">Para qual momento você está escolhendo o vinho?</h2>
                            <p class="text-muted text-center mb-5">Nos ajude a entender a ocasião para fazer a recomendação perfeita.</p>

                            <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="jantar_romantico"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">💕</span>
                                                <div>
                                                    <h6 class="mb-1">Jantar Romântico</h6>
                                                    <small class="text-muted">Momento íntimo a dois</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="celebracao"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🎉</span>
                                                <div>
                                                    <h6 class="mb-1">Celebração</h6>
                                                    <small class="text-muted">Aniversário, conquista especial</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="aperitivo"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🥂</span>
                                                <div>
                                                    <h6 class="mb-1">Aperitivo</h6>
                                                    <small class="text-muted">Happy hour, encontro casual</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="churrasco"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🔥</span>
                                                <div>
                                                    <h6 class="mb-1">Churrasco</h6>
                                                    <small class="text-muted">Almoço descontraído</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="almoco_familia"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">👨‍👩‍👧‍👦</span>
                                                <div>
                                                    <h6 class="mb-1">Almoço em Família</h6>
                                                    <small class="text-muted">Reunião familiar</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="happy_hour"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🍻</span>
                                                <div>
                                                    <h6 class="mb-1">Happy Hour</h6>
                                                    <small class="text-muted">Drinks com amigos</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    <% } else if (perguntaAtual == 2) { %>
                        <!-- Pergunta 2: Experiência/Perfil -->
                        <div class="quiz-question">
                            <h2 class="text-agnello-brown mb-4 text-center">Como você se definiria em relação aos vinhos?</h2>
                            <p class="text-muted text-center mb-5">Entender seu perfil nos ajuda a calibrar nossas recomendações.</p>

                            <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="iniciante"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🌱</span>
                                                <div>
                                                    <h6 class="mb-1">Iniciante</h6>
                                                    <small class="text-muted">Começando a explorar vinhos</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="aventureiro"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🗺️</span>
                                                <div>
                                                    <h6 class="mb-1">Aventureiro</h6>
                                                    <small class="text-muted">Gosto de experimentar novidades</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="tradicionalista"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🏛️</span>
                                                <div>
                                                    <h6 class="mb-1">Tradicionalista</h6>
                                                    <small class="text-muted">Prefiro clássicos reconhecidos</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="sofisticado"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🎭</span>
                                                <div>
                                                    <h6 class="mb-1">Sofisticado</h6>
                                                    <small class="text-muted">Busco vinhos únicos e refinados</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="descontraido"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">😄</span>
                                                <div>
                                                    <h6 class="mb-1">Descontraído</h6>
                                                    <small class="text-muted">Vinho é para se divertir</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    <% } else if (perguntaAtual == 3) { %>
                        <!-- Pergunta 3: Tipo Preferido -->
                        <div class="quiz-question">
                            <h2 class="text-agnello-brown mb-4 text-center">Qual estilo desperta mais seu interesse?</h2>
                            <p class="text-muted text-center mb-5">Vamos descobrir seu tipo de vinho preferido.</p>

                            <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="tinto_encorpado"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🍷</span>
                                                <div>
                                                    <h6 class="mb-1">Tinto Encorpado</h6>
                                                    <small class="text-muted">Intenso, marcante, com personalidade</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="branco_refrescante"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🥂</span>
                                                <div>
                                                    <h6 class="mb-1">Branco Refrescante</h6>
                                                    <small class="text-muted">Leve, mineral, cristalino</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="rose_leve"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🌸</span>
                                                <div>
                                                    <h6 class="mb-1">Rosé Leve</h6>
                                                    <small class="text-muted">Delicado, frutado, versátil</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="espumante_elegante"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🍾</span>
                                                <div>
                                                    <h6 class="mb-1">Espumante Elegante</h6>
                                                    <small class="text-muted">Bolhas finas, sofisticação</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    <% } else if (perguntaAtual == 4) { %>
                        <!-- Pergunta 4: Orçamento -->
                        <div class="quiz-question">
                            <h2 class="text-agnello-brown mb-4 text-center">Qual faixa de investimento considera adequada?</h2>
                            <p class="text-muted text-center mb-5">Nosso objetivo é encontrar o melhor vinho dentro do seu orçamento.</p>

                            <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="ate_100"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">💚</span>
                                                <div>
                                                    <h6 class="mb-1">Até R$ 100</h6>
                                                    <small class="text-muted">Excelente custo-benefício</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="100_200"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">💙</span>
                                                <div>
                                                    <h6 class="mb-1">R$ 100 - 200</h6>
                                                    <small class="text-muted">Equilíbrio perfeito</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="200_500"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">💜</span>
                                                <div>
                                                    <h6 class="mb-1">R$ 200 - 500</h6>
                                                    <small class="text-muted">Ocasião especial</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="acima_500"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🌟</span>
                                                <div>
                                                    <h6 class="mb-1">Acima de R$ 500</h6>
                                                    <small class="text-muted">Experiência premium</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    <% } else if (perguntaAtual == 5) { %>
                        <!-- Pergunta 5: Características -->
                        <div class="quiz-question">
                            <h2 class="text-agnello-brown mb-4 text-center">Que sensação busca no vinho?</h2>
                            <p class="text-muted text-center mb-5">Por último, vamos entender suas preferências sensoriais.</p>

                            <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="leve_facil"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🌿</span>
                                                <div>
                                                    <h6 class="mb-1">Leve e Fácil</h6>
                                                    <small class="text-muted">Suave, sem complicação</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="equilibrado"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">⚖️</span>
                                                <div>
                                                    <h6 class="mb-1">Equilibrado</h6>
                                                    <small class="text-muted">Harmonia entre elementos</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="intenso_marcante"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">💪</span>
                                                <div>
                                                    <h6 class="mb-1">Intenso e Marcante</h6>
                                                    <small class="text-muted">Concentrado, memorável</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <button type="submit" name="resposta" value="doce_suave"
                                                class="btn btn-outline-agnello w-100 text-start quiz-option">
                                            <div class="d-flex align-items-center">
                                                <span class="quiz-icon me-3">🍯</span>
                                                <div>
                                                    <h6 class="mb-1">Doce e Suave</h6>
                                                    <small class="text-muted">Acessível, reconfortante</small>
                                                </div>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    <% } %>

                    <!-- Navegação -->
                    <div class="row mt-4">
                        <div class="col-6">
                            <% if (perguntaAtual > 1) { %>
                                <form method="post" action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp" class="d-inline">
                                    <input type="hidden" name="action" value="anterior">
                                    <button type="submit" class="btn btn-outline-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Anterior
                                    </button>
                                </form>
                            <% } %>
                        </div>
                        <div class="col-6 text-end">
                            <a href="${pageContext.request.contextPath}/quiz/descubra-inicio.jsp" class="btn btn-link text-muted">
                                Recomeçar Quiz
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>