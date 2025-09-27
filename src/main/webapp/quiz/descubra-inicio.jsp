<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String pageTitle = "Descubra seu Vinho";
%>

<%@ include file="../includes/header.jsp" %>

<div class="container py-5">
    <!-- Hero Section -->
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="text-center mb-5">
                <h1 class="display-4 text-agnello-brown mb-3">Descubra seu Vinho</h1>
                <p class="lead text-muted">Deixe que nossa experiência guie você até o vinho perfeito</p>
            </div>
        </div>
    </div>

    <!-- Intro Concisa dos Agnello -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-6">
            <div class="text-center">
                <blockquote class="blockquote">
                    <p class="mb-3 fs-5 text-agnello-brown">
                        "Cada pessoa tem seu vinho ideal. Em 5 perguntas simples,
                        vamos descobrir o seu e recomendar 3 vinhos da nossa curadoria pessoal."
                    </p>
                    <footer class="blockquote-footer text-agnello-gold">
                        <cite title="Giulio e Bianca Agnello">Giulio e Bianca Agnello</cite>
                    </footer>
                </blockquote>
            </div>
        </div>
    </div>

    <!-- Como Funciona - Versão Simplificada -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8">
            <div class="row text-center">
                <div class="col-md-4 mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                        <span class="fs-1">🍷</span>
                    </div>
                    <h6 class="text-agnello-brown fw-bold">5 Perguntas</h6>
                    <p class="text-muted small">Sobre suas preferências</p>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                        <span class="fs-1">🎯</span>
                    </div>
                    <h6 class="text-agnello-brown fw-bold">Análise Personalizada</h6>
                    <p class="text-muted small">Com nossa expertise</p>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-icon bg-agnello-beige rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                        <span class="fs-1">⭐</span>
                    </div>
                    <h6 class="text-agnello-brown fw-bold">3 Recomendações</h6>
                    <p class="text-muted small">Vinhos selecionados</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Call to Action -->
    <div class="row justify-content-center">
        <div class="col-lg-5 text-center">
            <div class="card border-0 shadow-sm bg-agnello-beige">
                <div class="card-body p-4">
                    <h4 class="text-agnello-brown mb-3">Pronto para começar?</h4>
                    <p class="mb-4 text-muted">Leva apenas 3 minutos</p>

                    <!-- Formulário para iniciar o quiz -->
                    <form action="${pageContext.request.contextPath}/quiz/descubra-quiz.jsp" method="post">
                        <input type="hidden" name="action" value="iniciar">
                        <button type="submit" class="btn btn-agnello-primary btn-lg px-4 py-3">
                            Começar o Quiz
                            <i class="fas fa-arrow-right ms-2"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>