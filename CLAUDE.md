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
├── css/                    # Bootstrap CSS files
│   ├── bootstrap.css
│   └── bootstrap.min.css
├── js/                     # Bootstrap JavaScript files
│   ├── bootstrap.bundle.min.js
│   └── bootstrap.min.js
└── PROJECT_CONTEXT.md      # Complete project context and requirements
```

## Key Project Concepts

### Core Problem
Solving "decision paralysis" in wine selection through personalized curation and storytelling, replicating the physical store's consultative experience digitally.

### MVP Pages to Develop
1. **Home** - Landing page
2. **Login** - User authentication
3. **Cadastro** - User registration
4. **Listagem de Vinhos** - Wine catalog with filters
5. **Detalhe do Vinho** - Individual wine details with "A Palavra dos Agnello" (personal notes)
6. **Quiz "Descubra seu Vinho"** - Interactive recommendation quiz
7. **Carrinho** - Shopping cart and checkout

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

This is an early-stage project currently containing only Bootstrap assets. The JSP pages and business logic are yet to be implemented. Always refer to `PROJECT_CONTEXT.md` for detailed business requirements and the specific user experience goals.