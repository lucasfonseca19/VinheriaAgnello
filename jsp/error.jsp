<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String pageTitle = "Erro - Vinheria Agnello";
%>

<%@ include file="includes/quiz-header.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-6 text-center">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-5">
                    <div class="mb-4">
                        <span class="display-1 text-agnello-gold">😔</span>
                    </div>

                    <h2 class="text-agnello-brown mb-3">Ops! Algo deu errado</h2>
                    <p class="text-muted mb-4">
                        Parece que encontramos um pequeno problema.
                        Não se preocupe, nossa equipe já foi notificada.
                    </p>

                    <div class="d-grid gap-3">
                        <a href="${pageContext.request.contextPath}/html/home.html" class="btn btn-agnello-primary">
                            Voltar ao Início
                        </a>

                        <a href="${pageContext.request.contextPath}/descubra-inicio.jsp" class="btn btn-outline-agnello">
                            Tentar o Quiz Novamente
                        </a>

                        <a href="${pageContext.request.contextPath}/html/catalogo.html" class="btn btn-link text-muted">
                            Ver Catálogo de Vinhos
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/quiz-footer.jsp" %>