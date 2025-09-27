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
7. **Carrinho** ✅ - Sistema completo de carrinho de compras e checkout funcional em JSP.

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
- **Catálogo**: http://localhost:8080/vinheria/catalogo.jsp
- **Detalhe do Vinho**: http://localhost:8080/vinheria/detalhe-vinho.jsp?id=X
- **Carrinho**: http://localhost:8080/vinheria/carrinho.jsp
- **Checkout**: http://localhost:8080/vinheria/checkout.jsp
- **Confirmação**: http://localhost:8080/vinheria/confirmacao.jsp
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

O projeto Vinheria Agnello está **100% COMPLETO** com todas as funcionalidades do MVP implementadas e funcionais. O sistema utiliza arquitetura Java/JSP com Maven, dados mockados, e segue as melhores práticas de desenvolvimento web acadêmico. Todas as páginas são renderizadas no lado do servidor com design system Agnello unificado.

### ✅ Principais Conquistas Recentes

1.  **Migração para Maven**: O sistema de build foi modernizado, saindo do Ant para o Apache Maven, permitindo um gerenciamento de dependências robusto e um ciclo de vida de build padronizado.
2.  **Refatoração do `VinhoService`**: A lógica de dados foi centralizada. A classe agora carrega dinamicamente os vinhos a partir de um arquivo `vinhos.json` usando a biblioteca Gson, eliminando código "hardcoded" e duplicado.
3.  **Limpeza Geral do Projeto**: Todos os diretórios e arquivos legados da fase de prototipagem (`html/`, `js/catalogo.js`, etc.) foram removidos, simplificando a base de código.
4.  **Migração de Páginas Concluída**: As páginas de Catálogo e Detalhe do Vinho foram confirmadas como 100% funcionais em JSP, completando a migração de todas as telas existentes.
5.  **Sistema de Carrinho Completo**: Implementação completa do carrinho de compras e checkout usando HttpSession, com páginas JSP funcionais (`carrinho.jsp`, `checkout.jsp`, `confirmacao.jsp`) e contador dinâmico no header.

### 📋 MVP Completado

O projeto Vinheria Agnello está agora **100% funcional** com todas as páginas do MVP implementadas:

- ✅ **Home** - Página inicial com design Agnello
- ✅ **Login/Cadastro** - Autenticação de usuários
- ✅ **Catálogo** - Listagem com filtros avançados
- ✅ **Detalhe do Vinho** - Página individual com "Palavra dos Agnello"
- ✅ **Quiz** - Sistema de recomendação interativo
- ✅ **Carrinho & Checkout** - Sistema completo de compras

**Arquitetura Final**: JSP + HttpSession + dados mockados, adequado para projeto acadêmico.




































































































































































































































































































































































































































































































































































































































































































































































































































































- `PROJECT_CONTEXT.md` - Complete project requirements and business context
- `pom.xml` - Configuração do projeto Apache Maven
- `.gitignore` - Configured for Java/JSP, Node.js, and IDE files
- `scripts/` - Development and deployment scripts

## Development Notes

### 🎉 MVP COMPLETAMENTE FINALIZADO ✅
Todas as funcionalidades do projeto acadêmico Vinheria Agnello foram implementadas com sucesso:

- **Arquitetura Completa**: JSP + HttpSession + dados mockados
- **Sistema de Carrinho**: Funcional completo com checkout simulado
- **Design System**: Identidade visual Agnello unificada em todas as páginas
- **Responsividade**: Layout totalmente responsivo para desktop e mobile
- **Navegação Integrada**: Fluxo consistente entre todas as páginas
- **Dados Enriquecidos**: 18 vinhos com metadados completos e "Palavra dos Agnello"

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



### 🎯 Estado Atual da Aplicação
**MVP 100% COMPLETO**: Todas as páginas do projeto (Home, Login, Cadastro, Catálogo, Detalhe, Quiz, Carrinho, Checkout) estão implementadas com design Agnello unificado, navegação integrada e funcionando perfeitamente. Sistema pronto para apresentação e avaliação acadêmica.

### ✅ Recém Concluído (Migração HTML→JSP)
1. **Infraestrutura JSP Completa**: Configuração Tomcat + VSCode + scripts organizados
2. **Estrutura Maven**: Reorganização completa para `src/main/java/`, `src/main/resources/` e `src/main/webapp/`
3. **Quiz JSP Funcional**: Sistema completo (QuizResposta.java + 4 páginas JSP + includes)
4. **Build System**: Projeto migrado de Ant para Apache Maven, com gestão de dependências e ciclo de vida padronizados.
5. **Refatoração do Serviço**: `VinhoService` foi refatorado para carregar dados dinamicamente do `vinhos.json` usando a biblioteca Gson, eliminando a duplicação de dados e o código hardcoded.
6. **Design System Agnello**: Includes compartilhados (header.jsp + footer.jsp) com identidade visual unificada
7. **Páginas Principais Migradas**: index.jsp, home.jsp, login.jsp, cadastro.jsp - design consistente
8. **Navegação Integrada**: Todos os links atualizados para páginas JSP, quiz integrado ao design principal


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

### Sistema de Carrinho de Compras - Detalhes da Implementação ✅

#### Arquitetura Técnica
- **Bean CarrinhoItem**: Classe serializável com id, nome, preço, quantidade e imagem do vinho
- **HttpSession**: Armazenamento temporário do carrinho (sem banco de dados)
- **Páginas JSP Puras**: Sem servlets adicionais, mantendo simplicidade acadêmica
- **Dados Mockados**: Simulação completa de checkout sem integração real de pagamento

#### Funcionalidades Implementadas
- **Adição ao Carrinho**: Via POST direto na página `detalhe-vinho.jsp`
- **Contador no Header**: Badge dinâmico mostrando quantidade total de itens
- **Página do Carrinho**: Tabela responsiva com itens, quantidades e subtotais
- **Remoção de Itens**: Botões de exclusão com confirmação
- **Checkout Completo**: Formulários para dados pessoais, endereço e pagamento mockado
- **Confirmação de Compra**: Página final com resumo e mensagem personalizada

#### Fluxo de Compra
1. **Seleção**: Usuário adiciona vinhos ao carrinho na página de detalhe
2. **Revisão**: Visualiza itens, quantidades e totais no carrinho
3. **Checkout**: Preenche formulários de entrega e pagamento (simulado)
4. **Confirmação**: Recebe número do pedido e mensagem de agradecimento

#### Benefícios da Implementação
- ✅ **Simples e Acadêmico**: Adequado para projeto de faculdade
- ✅ **Funcional**: Fluxo completo testado e operacional
- ✅ **Escalável**: Estrutura preparada para integração futura
- ✅ **Consistente**: Mantém design system Agnello em todas as páginas

### Estrutura Técnica
- HTML semântico e Bootstrap 5.3 para responsividade
- CSS personalizado para identidade visual da marca Agnello (500+ linhas de estilos customizados)
- JSON estruturado para dados de produtos com metadados ricos e descrições "A Palavra dos Agnello"
- Grid system responsivo com breakpoints móveis
- Mockups funcionais prontos para integração com backend JSP
- Paleta de cores e tipografia definidas (Playfair Display + Roboto Condensed)
- Sistema de filtros consultivos baseado em perfil do usuário
- Página de detalhe responsiva com navegação integrada do catálogo
- Sistema completo de carrinho usando HttpSession (CarrinhoItem.java, carrinho.jsp, checkout.jsp, confirmacao.jsp)

Always refer to `PROJECT_CONTEXT.md` for detailed business requirements and the specific user experience goals.
