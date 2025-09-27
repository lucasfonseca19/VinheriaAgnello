<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String pageTitle = "Descubra seu Vinho";
%>

<%@ include file="../includes/quiz-header.jsp" %>

<div class="container py-5">
    <!-- Hero Section -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="text-center mb-5">
                <h1 class="display-4 text-agnello-brown mb-3">Descubra seu Vinho</h1>
                <p class="lead text-muted">Deixe que nossa experiência e paixão guiem você até o vinho perfeito</p>
            </div>
        </div>
    </div>

    <!-- Intro dos Agnello -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-5">
                    <div class="agnello-quote-section">
                        <div class="agnello-quote-header mb-4">
                            <h3 class="agnello-quote-title">Uma Palavra dos Agnello</h3>
                        </div>

                        <div class="agnello-quote-content">
                            <div class="quote-mark">"</div>
                            <p class="mb-4">
                                Ao longo de décadas servindo vinhos, aprendemos que cada pessoa tem sua preferência única.
                                Alguns buscam a tradição, outros a aventura. Alguns preferem momentos íntimos, outros grandes celebrações.
                            </p>
                            <p class="mb-4">
                                Nossa missão sempre foi a mesma: conectar você ao vinho que desperta suas emoções.
                                Este quiz replica nossa conversa presencial - aquela mesma orientação consultiva que oferecemos
                                na loja, agora adaptada para o mundo digital.
                            </p>
                            <p class="mb-4">
                                Em apenas 5 perguntas, vamos entender seu perfil e suas preferências para
                                recomendar exatamente 3 vinhos da nossa curadoria pessoal. São vinhos que nós,
                                Giulio e Bianca Agnello, escolheríamos especialmente para você.
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

    <!-- Como Funciona -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10">
            <h2 class="text-center text-agnello-brown mb-4">Como Funciona</h2>
            <div class="row">
                <div class="col-md-4 text-center mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                        <span class="fs-2">🍷</span>
                    </div>
                    <h5>5 Perguntas Simples</h5>
                    <p class="text-muted">Responda sobre suas preferências e ocasiões de consumo</p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                        <span class="fs-2">🎯</span>
                    </div>
                    <h5>Curadoria Personalizada</h5>
                    <p class="text-muted">Nosso algoritmo analisa suas respostas com nossa expertise</p>
                </div>
                <div class="col-md-4 text-center mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                        <span class="fs-2">⭐</span>
                    </div>
                    <h5>3 Recomendações</h5>
                    <p class="text-muted">Receba nossa seleção especial com "A Palavra dos Agnello"</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="row justify-content-center">
        <div class="col-lg-6 text-center">
            <div class="card border-0 shadow-sm bg-agnello-beige">
                <div class="card-body p-5">
                    <h3 class="text-agnello-brown mb-3">Pronto para Descobrir?</h3>
                    <p class="mb-4">O quiz leva apenas 3 minutos. Vamos começar nossa conversa!</p>

                    <!-- Formulário para iniciar o quiz -->
                    <form action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp" method="post">
                        <input type="hidden" name="action" value="iniciar">
                        <button type="submit" class="btn btn-agnello-primary btn-lg px-5 py-3">
                            Começar o Quiz
                            <i class="fas fa-arrow-right ms-2"></i>
                        </button>
                    </form>

                    <p class="small text-muted mt-3 mb-0">
                        <i class="fas fa-clock me-1"></i>
                        Aproximadamente 3 minutos
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Benefícios -->
    <div class="row justify-content-center mt-5">
        <div class="col-lg-8">
            <div class="text-center">
                <h4 class="text-agnello-brown mb-3">Por que fazer o quiz?</h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <p class="small text-muted">
                            <i class="fas fa-check text-agnello-gold me-2"></i>
                            Evita a paralisia da escolha
                        </p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p class="small text-muted">
                            <i class="fas fa-check text-agnello-gold me-2"></i>
                            Recomendações personalizadas
                        </p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p class="small text-muted">
                            <i class="fas fa-check text-agnello-gold me-2"></i>
                            Expertise dos Agnello
                        </p>
                    </div>
                    <div class="col-md-6 mb-3">
                        <p class="small text-muted">
                            <i class="fas fa-check text-agnello-gold me-2"></i>
                            Adequado ao seu orçamento
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/quiz-footer.jsp" %>