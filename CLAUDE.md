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
├── css/                    # CSS files
│   ├── bootstrap.css       # Bootstrap CSS
│   ├── bootstrap.min.css   # Bootstrap CSS minified
│   └── styles.css          # Estilos personalizados da Vinheria Agnello
├── html/                   # Páginas HTML (protótipos)
│   ├── home.html           # Página inicial ✅
│   ├── login.html          # Página de login ✅
│   ├── cadastro.html       # Página de cadastro ✅
│   ├── catalogo.html       # Listagem de vinhos (pendente)
│   ├── detalhe-vinho.html  # Detalhe do vinho (pendente)
│   ├── quiz.html           # Quiz "Descubra seu Vinho" (pendente)
│   └── carrinho.html       # Carrinho de compras (pendente)
├── js/                     # Bootstrap JavaScript files
│   ├── bootstrap.bundle.min.js
│   └── bootstrap.min.js
├── assets/                 # Imagens e recursos
│   └── logo.png            # Logo da Vinheria Agnello
└── PROJECT_CONTEXT.md      # Complete project context and requirements
```

## Key Project Concepts

### Core Problem
Solving "decision paralysis" in wine selection through personalized curation and storytelling, replicating the physical store's consultative experience digitally.

### MVP Pages Status
1. **Home** ✅ - Landing page (convertida para HTML)
2. **Login** ✅ - User authentication (convertida para HTML)
3. **Cadastro** ✅ - User registration (convertida para HTML)
4. **Listagem de Vinhos** 🔄 - Wine catalog with filters (pendente)
5. **Detalhe do Vinho** 🔄 - Individual wine details com "A Palavra dos Agnello" (pendente)
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

## Important Files

- `PROJECT_CONTEXT.md` - Complete project requirements and business context
- `.gitignore` - Configured for Java/JSP, Node.js, and IDE files

## Development Notes

### Progresso Atual ✅
- **CSS Personalizado**: Criado arquivo `styles.css` com paleta de cores da Vinheria Agnello (bege, marrom, dourado, cinza)
- **Páginas HTML Convertidas**: 3 páginas JSP convertidas para HTML limpo usando Bootstrap
  - Home: Layout responsivo com hero, steps e about sections
  - Login: Formulário centralizado com seção de benefícios
  - Cadastro: Layout lado a lado com modal de benefícios
- **Design System**: Classes Bootstrap customizadas mantendo identidade visual
- **Responsividade**: Layout totalmente responsivo para desktop e mobile
- **UX Melhorada**: Navegação consistente, formulários funcionais, micro-interações

### Próximos Passos 🔄
1. **Catalogo de Vinhos**: Página com filtros e grid de produtos
2. **Detalhe do Vinho**: Página individual com "A Palavra dos Agnello"
3. **Quiz Recomendação**: Sistema interativo de descoberta de vinhos
4. **Carrinho**: Sistema de compras com checkout

### Estrutura Técnica
- HTML semântico e Bootstrap para responsividade
- CSS personalizado para identidade visual da marca Agnello
- Mockups funcionais prontos para integração com backend JSP
- Paleta de cores e tipografia definidas (Playfair Display + Roboto Condensed)

Always refer to `PROJECT_CONTEXT.md` for detailed business requirements and the specific user experience goals.
