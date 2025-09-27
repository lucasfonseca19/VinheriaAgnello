<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    String pageTitle = "Vinheria Agnello - Bem-vindo";
    Date currentDate = new Date();
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= pageTitle %></title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body class="bg-agnello-bege">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-agnello-marrom fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-agnello-dourado" href="index.jsp">
                Vinheria Agnello
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="../html/catalogo.html">Catálogo</a></li>
                    <li class="nav-item"><a class="nav-link" href="quiz/descubra-inicio.jsp">Quiz</a></li>
                    <li class="nav-item"><a class="nav-link" href="../html/login.html">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center text-white d-flex align-items-center" style="background: linear-gradient(rgba(101, 67, 33, 0.8), rgba(101, 67, 33, 0.8)), url('assets/hero-wine.jpg') center/cover; min-height: 100vh;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <h1 class="display-4 fw-bold mb-4 text-agnello-dourado">
                        Bem-vindo à Vinheria Agnello
                    </h1>
                    <p class="lead mb-4">
                        Tradição familiar desde 1987. Vinhos selecionados com paixão e conhecimento.
                    </p>
                    <p class="small text-light">
                        <%= "Acesso em: " + currentDate %>
                    </p>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                        <a href="../html/catalogo.html" class="btn btn-agnello-dourado btn-lg me-2">
                            Explorar Vinhos
                        </a>
                        <a href="quiz/descubra-inicio.jsp" class="btn btn-outline-light btn-lg">
                            Descubra seu Vinho
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Info Section -->
    <section class="py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-agnello-marrom">Curadoria Especial</h5>
                            <p class="card-text">Vinhos selecionados por Giulio e Bianca Agnello</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-agnello-marrom">Tradição Familiar</h5>
                            <p class="card-text">Mais de 35 anos de experiência no mundo dos vinhos</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-agnello-marrom">Atendimento Personalizado</h5>
                            <p class="card-text">Consultoria especializada para cada momento</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>