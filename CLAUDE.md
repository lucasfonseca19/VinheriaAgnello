# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an academic e-commerce project for **Vinheria Agnello**, a fictional wine shop transitioning from physical to digital presence. The focus is on maintaining personalized, consultative service in a digital environment.

## Technology Stack

- **Frontend**: JSP + CSS + Bootstrap
- **Constraints**: No React or modern frameworks allowed
- **Architecture**: Simple, academic-focused implementation
- **Data**: All mocked data for this MVP

## Project Structure

```
.
├── scripts/                # Scripts de desenvolvimento
│   ├── deploy.sh           # Deploy automático para Tomcat
│   ├── start_server.sh     # Iniciar servidor Tomcat
│   └── stop_server.sh      # Parar servidor Tomcat
├── src/main/               # Código fonte (estrutura Maven)
│   ├── java/               # Classes Java
│   │   └── com/vinheria/
│   │       ├── beans/      # JavaBeans (QuizResposta, Vinho)
│   │       └── service/    # Serviços (VinhoService)
│   └── webapp/             # Aplicação web JSP
│       ├── WEB-INF/        # Configuração web
│       │   └── web.xml     # Deployment descriptor
│       ├── includes/       # Includes JSP
│       │   ├── quiz-header.jsp
│       │   └── quiz-footer.jsp
│       ├── quiz/           # Páginas do quiz JSP
│       │   ├── descubra-quiz.jsp
│       │   ├── descubra-inicio.jsp
│       │   ├── descubra-resultado.jsp
│       │   └── error.jsp
│       ├── css/            # CSS files
│       ├── js/             # JavaScript files
│       ├── assets/         # Imagens e recursos
│       └── data/           # Dados mockados
├── html/                   # Páginas HTML (protótipos)
│   ├── home.html           # Página inicial ✅
│   ├── login.html          # Página de login ✅
│   ├── cadastro.html       # Página de cadastro ✅
│   ├── catalogo.html       # Listagem de vinhos ✅
│   ├── detalhe-vinho.html  # Detalhe do vinho ✅
│   ├── quiz.html           # Quiz HTML (protótipo)
│   └── carrinho.html       # Carrinho de compras (pendente)
├── build.xml               # Configuração do Apache Ant
├── .vscode/                # Configuração do VSCode
└── PROJECT_CONTEXT.md      # Complete project context and requirements
```

## Key Project Concepts

### Core Problem
Solving "decision paralysis" in wine selection through personalized curation and storytelling, replicating the physical store's consultative experience digitally.

### MVP Pages Status
1. **Home** ✅ - Landing page (convertida para HTML)
2. **Login** ✅ - User authentication (convertida para HTML)
3. **Cadastro** ✅ - User registration (convertida para HTML)
4. **Listagem de Vinhos** ✅ - Wine catalog with advanced filters (completo)
5. **Detalhe do Vinho** ✅ - Individual wine details com "A Palavra dos Agnello" (completo)
6. **Quiz "Descubra seu Vinho"** 🔄 - Interactive recommendation quiz (pendente)
7. **Carrinho** 🔄 - Shopping cart and checkout (pendente)

### Differentiation Strategy
- **Hiper-curadoria**: Curated wine selection with personal stories
- **"A Palavra dos Agnello"**: Personal notes from owners on each wine
- **Quiz Recommendations**: Simplified decision-making through guided selection

## Development Guidelines

### Technical Constraints
- Use only JSP + CSS + Bootstrap
- Simple architecture suitable for academic project
- No complex security implementations
- No mobile-first responsive design required
- Focus on functionality over advanced features

### Content & Tone
- Personal and welcoming (reflecting Giulio's consultative approach)
- Educational without being pretentious
- Focus on stories and experiences, not just technical specs
- Maintain authenticity of the physical wine shop experience

## Como Executar o Projeto

### Pré-requisitos
- **Java 11+** (OpenJDK via Homebrew)
- **Apache Tomcat** (via Homebrew)
- **Apache Ant** (via Homebrew)
- **VSCode** com extensões Java recomendadas

### Scripts de Desenvolvimento
Todos os scripts estão na pasta `scripts/`:

```bash
# 🚀 Deploy completo (build + deploy + start server)
./scripts/deploy.sh

# 🔧 Gerenciar servidor
./scripts/start_server.sh    # Iniciar Tomcat
./scripts/stop_server.sh     # Parar Tomcat

# 🏗️ Build manual com Ant
ant clean deploy
```

### Fluxo de Desenvolvimento

1. **Desenvolvimento**: Editar arquivos em `src/main/webapp/`
2. **Deploy**: Executar `./scripts/deploy.sh`
3. **Acesso**: http://localhost:8080/vinheria

### VSCode Integration

Use **Ctrl+Shift+P** → "Tasks: Run Task":
- **Deploy to Tomcat** - Build e deploy automático
- **Start Tomcat** - Iniciar servidor
- **Stop Tomcat** - Parar servidor

### URLs da Aplicação

- **Home**: http://localhost:8080/vinheria
- **Quiz JSP**: http://localhost:8080/vinheria/quiz/descubra-inicio.jsp
- **Manager Tomcat**: http://localhost:8080/manager

### Estrutura de Build

- **Código fonte**: `src/main/java/` e `src/main/webapp/`
- **Build output**: `build/` (criado pelo Ant)
- **WAR file**: `vinheria.war` (deployado automaticamente)
- **Deploy**: `/opt/homebrew/opt/tomcat/libexec/webapps/`

## Important Files

- `PROJECT_CONTEXT.md` - Complete project requirements and business context
- `.gitignore` - Configured for Java/JSP, Node.js, and IDE files
- `build.xml` - Apache Ant build configuration
- `scripts/` - Development and deployment scripts

## Development Notes

### Progresso Atual ✅
- **CSS Personalizado**: Criado arquivo `styles.css` com paleta de cores da Vinheria Agnello (bege, marrom, dourado, cinza)
- **Páginas HTML Convertidas**: 4 páginas JSP convertidas para HTML limpo usando Bootstrap
  - Home: Layout responsivo com hero, steps e about sections
  - Login: Formulário centralizado com seção de benefícios
  - Cadastro: Layout lado a lado com modal de benefícios
  - **Catálogo**: Grid 3x3 responsivo com filtros avançados
- **Design System**: Classes Bootstrap customizadas mantendo identidade visual
- **Responsividade**: Layout totalmente responsivo para desktop e mobile
- **UX Melhorada**: Navegação consistente, formulários funcionais, micro-interações
- **Dataset Completo**: 18 vinhos com dados enriquecidos (ocasião, perfil, corpo, doçura)
- **Sistema de Filtros**: 9 categorias de filtros para curadoria personalizada

### Catálogo de Vinhos - Detalhes ✅
- **Grid Layout**: Cards 3x3 responsivos com hover effects sofisticados
- **Cards Enriquecidos**: Badges, ratings, informações contextuais, preços destacados
- **Filtros Avançados**:
  - Básicos: Tipo, preço, região, uva
  - **Ocasião**: Jantar especial, celebração, aperitivo, churrasco, etc.
  - **Perfil**: Sem erro, aventureiro, sofisticado, tradicionalista, etc.
  - **Características**: Corpo (leve/médio/encorpado), doçura (seco/brut/etc.)
- **Interface Consultiva**: Barra de busca, ordenação, paginação, breadcrumb
- **Imagens**: Placeholders otimizados (280x380px) via placehold.co
- **Dados**: JSON estruturado com 18 vinhos e metadados completos

## ⚠️ CÓDIGO TEMPORÁRIO - MIGRAÇÃO JSP

### JavaScript Funcional (REMOVER após migração JSP)

#### Arquivos Temporários
- **`js/catalogo.js`** - Sistema completo de filtros client-side (500+ linhas)
- **Modificações em `html/catalogo.html`** - Integração JavaScript (linhas 329-337, 393-394)
- **Estilos em `css/styles.css`** - Estados dos filtros JavaScript (linhas 615-753)

#### Funcionalidades a Migrar para Servidor (JSP + Java)
1. **Carregamento de Dados**:
   - `carregarVinhos()` → `VinhoService.listarTodos()`
   - Fetch do JSON → Consulta ao banco de dados

2. **Sistema de Filtros**:
   - `aplicarFiltros()` → Filtros SQL com WHERE clauses
   - Filtros client-side → Server-side processing
   - Arrays JavaScript → Collections Java

3. **Paginação**:
   - `obterVinhosPaginados()` → LIMIT/OFFSET no SQL
   - Controle JavaScript → Parâmetros de URL (page, size)

4. **Busca e Ordenação**:
   - `buscarVinhos()` → SQL LIKE queries
   - `ordenarResultados()` → ORDER BY clauses

5. **Renderização**:
   - `criarCardVinho()` → JSP templates com loops
   - DOM manipulation → Server-side HTML generation

#### Estratégia de Migração JSP
```jsp
<!-- Exemplo: Substituir renderização JavaScript -->
<%
  List<Vinho> vinhos = vinhoService.filtrar(filtros);
  for(Vinho vinho : vinhos) {
%>
  <div class="card wine-card">
    <h6><%= vinho.getNome() %></h6>
    <!-- etc... -->
  </div>
<% } %>
```

#### Limpeza Pós-Migração
1. **Deletar**: `js/catalogo.js` (arquivo completo)
2. **Remover**: Referência script em `catalogo.html`
3. **Limpar**: Estilos específicos JavaScript do `styles.css`
4. **Manter**: Estrutura HTML e CSS base

#### Benefícios da Abordagem Atual
- ✅ Catálogo 100% funcional para apresentação
- ✅ Base sólida de lógica testada para migração
- ✅ UX completa sem dependência de servidor
- ✅ Portfolio impressionante e demonstrável

**IMPORTANTE**: Este código é **temporário** e **deve ser removido** após a migração JSP estar completa.

---

### Próximos Passos 🔄
1. **Conversão para JSP**: Migrar páginas HTML para JSP dinâmicas
2. **Sistema de Filtros**: Converter filtros JavaScript para server-side
3. **Carrinho**: Sistema de compras com checkout
4. **Integração Quiz**: Conectar quiz JSP com recomendação de vinhos

### ✅ Recém Concluído
1. **Infraestrutura JSP**: Configuração completa Tomcat + Ant + VSCode
2. **Organização do Projeto**: Scripts separados, estrutura Maven padrão
3. **Quiz JSP**: Sistema completo implementado (QuizResposta.java + JSPs)
4. **Detalhe do Vinho**: Página individual com "A Palavra dos Agnello" (HTML)

### Página de Detalhe do Vinho - Detalhes da Implementação ✅
- **Arquivo**: `html/detalhe-vinho.html`
- **Layout**: Bootstrap responsivo com imagem à esquerda (col-lg-6) e informações à direita (col-lg-6)
- **Navegação**: Breadcrumb dinâmico, integração total com catálogo via parâmetros URL (`?id=`)
- **Informações**: Nome, avaliação (stars), preço destacado, dados técnicos completos, harmonização
- **Funcionalidades**: Seletor quantidade (1-10), botão "Adicionar ao Carrinho", validação de estoque
- **Seção Especial**: "A Palavra dos Agnello" com design exclusivo, gradiente dourado, aspas decorativas
- **Responsividade**: Layout adaptativo (lado a lado → stacked), tipografia escalonável
- **JavaScript**: Carregamento dinâmico via JSON, formatação automática de nomes Agnello
- **CSS**: 150+ linhas específicas com animações, hover effects, breakpoints móveis
- **Dados**: 18 descrições únicas alternando entre Giulio e Bianca Agnello no JSON

### Estrutura Técnica
- HTML semântico e Bootstrap 5.3 para responsividade
- CSS personalizado para identidade visual da marca Agnello (500+ linhas de estilos customizados)
- JSON estruturado para dados de produtos com metadados ricos e descrições "A Palavra dos Agnello"
- Grid system responsivo com breakpoints móveis
- Mockups funcionais prontos para integração com backend JSP
- Paleta de cores e tipografia definidas (Playfair Display + Roboto Condensed)
- Sistema de filtros consultivos baseado em perfil do usuário
- Página de detalhe responsiva com navegação integrada do catálogo

Always refer to `PROJECT_CONTEXT.md` for detailed business requirements and the specific user experience goals.
