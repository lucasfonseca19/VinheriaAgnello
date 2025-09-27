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
├── pom.xml                 # Configuração do Apache Maven
├── scripts/                # Scripts de desenvolvimento
│   ├── deploy.sh           # Deploy automático para Tomcat
│   ├── start_server.sh     # Iniciar servidor Tomcat
│   └── stop_server.sh      # Parar servidor Tomcat
├── src/main/               # Código fonte (estrutura Maven)
│   ├── java/               # Classes Java
│   │   └── com/vinheria/
│   │       ├── beans/      # JavaBeans (QuizResposta, Vinho)
│   │       └── service/    # Serviços (VinhoService)
│   ├── resources/
│   │   └── data/
│   │       └── vinhos.json # Dados mockados dos vinhos
│   └── webapp/             # Aplicação web JSP
│       ├── WEB-INF/        # Configuração web
│       │   └── web.xml     # Deployment descriptor
│       ├── includes/       # Includes JSP compartilhados
│       ├── quiz/           # Páginas do quiz JSP
│       ├── index.jsp       # Página principal
│       ├── ...             # Outras páginas JSP
│       ├── css/            # CSS files
│       ├── js/             # JavaScript files
│       └── assets/         # Imagens e recursos
├── .vscode/                # Configuração do VSCode
└── PROJECT_CONTEXT.md      # Complete project context and requirements
```

## Key Project Concepts

### Core Problem
Solving "decision paralysis" in wine selection through personalized curation and storytelling, replicating the physical store's consultative experience digitally.

### MVP Pages Status
1. **Home** ✅ - Página inicial totalmente funcional em JSP.
2. **Login** ✅ - Autenticação de usuários funcional em JSP.
3. **Cadastro** ✅ - Registro de novos usuários funcional em JSP.
4. **Listagem de Vinhos** ✅ - Catálogo com filtros avançados, busca e paginação, 100% funcional em JSP.
5. **Detalhe do Vinho** ✅ - Página de detalhe individual do vinho, 100% funcional em JSP.
6. **Quiz "Descubra seu Vinho"** ✅ - Quiz interativo para recomendação, 100% funcional em JSP.
7. **Carrinho** 🔄 - Funcionalidade de carrinho de compras e checkout (pendente).

### Differentiation Strategy
- **Hiper-curadoria**: Curated wine selection with personal stories
- **"A Palavra dos Agnello"**: Personal notes from owners on each wine
- **Quiz Recommendations**: Simplified decision-making through guided selection

## Design System Agnello

### Identidade Visual
- **Paleta de Cores**:
  - Bege: `#F5F5DC` (fundo principal)
  - Marrom: `#654321` (texto principal)
  - Dourado: `#DAA520` (acentos e CTAs)
  - Cinza: `#6c757d` (texto secundário)

### Tipografia
- **Principais**: Playfair Display (títulos) + Roboto Condensed (corpo)
- **Classes CSS**: `.font-playfair`, `.hero-title`, `.about-title`

### Componentes Reutilizáveis
- **Header**: `includes/header.jsp` - Logo Agnello, navegação, ícones login/carrinho
- **Footer**: `includes/footer.jsp` - Informações de contato, dados FIAP
- **Quiz Header/Footer**: `includes/quiz-header.jsp` e `includes/quiz-footer.jsp` - Versões específicas do quiz

### Classes CSS Principais
- `.agnello-header`, `.agnello-footer` - Layout principal
- `.agnello-hero`, `.agnello-steps`, `.agnello-about` - Seções home
- `.agnello-form` - Formulários estilizados
- `.btn-agnello` - Botões com estilo da marca

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
- **Apache Maven** (via Homebrew)
- **VSCode** com extensões Java recomendadas

### Scripts de Desenvolvimento
Todos os scripts estão na pasta `scripts/`:

```bash
# 🚀 Deploy completo (build com Maven + deploy no Tomcat)
./scripts/deploy.sh

# 🔧 Gerenciar servidor
./scripts/start_server.sh    # Iniciar Tomcat
./scripts/stop_server.sh     # Parar Tomcat

# 🏗️ Build manual com Maven
mvn clean install
```

### Fluxo de Desenvolvimento

1. **Desenvolvimento**: Editar arquivos em `src/main/`
2. **Deploy**: Executar `./scripts/deploy.sh` para um ciclo completo de build e deploy.
3. **Acesso**: http://localhost:8080/vinheria

### VSCode Integration

Com a migração para Maven, é recomendado usar a extensão "Extension Pack for Java" da Microsoft, que integra o ciclo de vida do Maven diretamente na IDE, permitindo executar builds e outras tarefas com um clique.

### URLs da Aplicação

- **Home**: http://localhost:8080/vinheria (index.jsp - página principal)
- **Login**: http://localhost:8080/vinheria/login.jsp
- **Cadastro**: http://localhost:8080/vinheria/cadastro.jsp
- **Quiz JSP**: http://localhost:8080/vinheria/quiz/descubra-inicio.jsp
- **Manager Tomcat**: http://localhost:8080/manager

### Estrutura de Build

- **Código fonte**: `src/main/java/`, `src/main/resources/` e `src/main/webapp/`
- **Build output**: `target/` (criado pelo Maven)
- **WAR file**: `target/vinheria.war` (artefato final para deploy)
- **Deploy**: `/opt/homebrew/opt/tomcat/libexec/webapps/`

## Important Files

- `PROJECT_CONTEXT.md` - Complete project requirements and business context
- `pom.xml` - Configuração do projeto Apache Maven
- `.gitignore` - Configured for Java/JSP, Node.js, and IDE files
- `scripts/` - Development and deployment scripts

## 🎯 Estado Atual da Aplicação

O projeto foi **completamente migrado para uma arquitetura Java/JSP com Maven**. Todas as páginas principais do MVP (Home, Login, Cadastro, Quiz, Catálogo e Detalhe do Vinho) são renderizadas no lado do servidor, com dados carregados dinamicamente. Os protótipos estáticos e códigos temporários foram removidos, e o projeto segue agora as práticas padrão de desenvolvimento Java para web.

### ✅ Principais Conquistas Recentes

1.  **Migração para Maven**: O sistema de build foi modernizado, saindo do Ant para o Apache Maven, permitindo um gerenciamento de dependências robusto e um ciclo de vida de build padronizado.
2.  **Refatoração do `VinhoService`**: A lógica de dados foi centralizada. A classe agora carrega dinamicamente os vinhos a partir de um arquivo `vinhos.json` usando a biblioteca Gson, eliminando código "hardcoded" e duplicado.
3.  **Limpeza Geral do Projeto**: Todos os diretórios e arquivos legados da fase de prototipagem (`html/`, `js/catalogo.js`, etc.) foram removidos, simplificando a base de código.
4.  **Migração de Páginas Concluída**: As páginas de Catálogo e Detalhe do Vinho foram confirmadas como 100% funcionais em JSP, completando a migração de todas as telas existentes.

### 📋 Próximos Passos

O foco agora se volta para a implementação da última funcionalidade principal do MVP:

1.  **Implementar o Carrinho de Compras**:
    - Criar a lógica de negócio para adicionar, remover e visualizar itens no carrinho (provavelmente usando a `HttpSession`).
    - Desenvolver a página `carrinho.jsp` para exibir os itens.
    - Simular o processo de checkout.
2.  **Criar um `CarrinhoDAO` ou similar**: Para gerenciar o estado do carrinho de forma mais organizada no backend.




































































































































































































































































































































































































































































































































































































































































































































































































































































- `PROJECT_CONTEXT.md` - Complete project requirements and business context
- `pom.xml` - Configuração do projeto Apache Maven
- `.gitignore` - Configured for Java/JSP, Node.js, and IDE files
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
1. **Migração HTML→JSP RESTANTE**: Converter últimas páginas HTML para JSP
   - `html/catalogo.html` → `webapp/catalogo.jsp` (PRÓXIMA PRIORIDADE)
   - `html/detalhe-vinho.html` → `webapp/detalhe-vinho.jsp`
2. **Sistema de Filtros**: Converter filtros JavaScript para server-side Java
3. **DAO Implementation**: Criar VinhoDAO para acesso aos dados
4. **Carrinho**: Sistema de compras com checkout JSP

### 🎯 Estado Atual da Aplicação
**DESIGN SYSTEM COMPLETO**: Todas as páginas principais (index, login, cadastro, quiz) estão com o design Agnello unificado, navegação integrada e funcionando perfeitamente. Próximo foco: migração do catálogo de vinhos mantendo toda a funcionalidade de filtros.

### ✅ Recém Concluído (Migração HTML→JSP)
1. **Infraestrutura JSP Completa**: Configuração Tomcat + VSCode + scripts organizados
2. **Estrutura Maven**: Reorganização completa para `src/main/java/`, `src/main/resources/` e `src/main/webapp/`
3. **Quiz JSP Funcional**: Sistema completo (QuizResposta.java + 4 páginas JSP + includes)
4. **Build System**: Projeto migrado de Ant para Apache Maven, com gestão de dependências e ciclo de vida padronizados.
5. **Refatoração do Serviço**: `VinhoService` foi refatorado para carregar dados dinamicamente do `vinhos.json` usando a biblioteca Gson, eliminando a duplicação de dados e o código hardcoded.
6. **Design System Agnello**: Includes compartilhados (header.jsp + footer.jsp) com identidade visual unificada
7. **Páginas Principais Migradas**: index.jsp, home.jsp, login.jsp, cadastro.jsp - design consistente
8. **Navegação Integrada**: Todos os links atualizados para páginas JSP, quiz integrado ao design principal

### 🔄 Status da Migração HTML → JSP

#### ✅ Migradas para JSP (COMPLETAS)
- **Sistema Principal**: Design Agnello unificado e navegação integrada
  - `index.jsp` - Página inicial (design Agnello completo)
  - `home.jsp` - Home alternativa (mesmo conteúdo do index)
  - `login.jsp` - Login com form processing e seção de benefícios
  - `cadastro.jsp` - Cadastro com modal de benefícios funcionando
  - `includes/header.jsp` - Header Agnello (logo, navegação, icons)
  - `includes/footer.jsp` - Footer Agnello (contato, informações FIAP)

- **Quiz System**: 100% funcional em JSP com design Agnello
  - `quiz/descubra-inicio.jsp` - Página inicial do quiz
  - `quiz/descubra-quiz.jsp` - Quiz interativo (5 perguntas)
  - `quiz/descubra-resultado.jsp` - Resultados e recomendações
  - `quiz/error.jsp` - Página de erro
  - `includes/quiz-header.jsp` - Header atualizado com design Agnello
  - `includes/quiz-footer.jsp` - Footer atualizado com design Agnello
  - Classes Java: `QuizResposta.java`, `Vinho.java`, `VinhoService.java`

#### 🔄 Pendentes de Migração (HTML → JSP)
- `html/catalogo.html` → `src/main/webapp/catalogo.jsp` (próxima prioridade)
- `html/detalhe-vinho.html` → `src/main/webapp/detalhe-vinho.jsp`

#### ✅ Tarefas da Migração CONCLUÍDAS
1. **✅ Includes compartilhados criados** (`header.jsp`, `footer.jsp`)
2. **✅ Design System Agnello implementado** (paleta, tipografia, layout)
3. **✅ Formulários JSP configurados** para processamento server-side
4. **✅ Navegação integrada** entre todas as páginas JSP
5. **✅ Consistência visual total** em toda a aplicação

#### 📋 Próximas Tarefas (Listagem de Vinhos)
1. **Migrar catálogo HTML→JSP** preservando filtros e funcionalidades
2. **Converter filtros JavaScript** para lógica server-side Java
3. **Implementar VinhoDAO** para acesso aos dados estruturados
4. **Remover código JavaScript temporário** do `js/catalogo.js`

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
