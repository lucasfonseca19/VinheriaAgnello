/**
 * CATALOGO.JS - Sistema de Filtros para Vinheria Agnello
 *
 * ⚠️ CÓDIGO TEMPORÁRIO - SERÁ MIGRADO PARA JSP
 *
 * Este arquivo contém toda a lógica de filtros, busca e paginação
 * que será posteriormente migrada para o servidor (JSP + Java).
 *
 * Após a migração para JSP, este arquivo deve ser REMOVIDO.
 */

class CatalogoManager {
  constructor() {
    this.vinhos = [];
    this.vinhosFiltrados = [];
    this.paginaAtual = 1;
    this.itensPorPagina = 9;
    this.filtrosAtivos = {
      busca: '',
      tipos: [],
      precos: [],
      regiao: '',
      uva: '',
      ocasioes: [],
      perfis: [],
      caracteristicas: [],
      corpo: [],
      docura: []
    };

    this.init();
  }

  async init() {
    try {
      await this.carregarVinhos();
      this.configurarEventListeners();
      this.aplicarFiltros();
      this.mostrarLoading(false);
    } catch (error) {
      console.error('Erro ao inicializar catálogo:', error);
      this.mostrarErro('Erro ao carregar vinhos. Tente novamente.');
    }
  }

  // ===== CARREGAMENTO DE DADOS =====
  // TODO: Migrar para JSP - VinhoService.listarTodos()
  async carregarVinhos() {
    try {
      const response = await fetch('../data/vinhos.json');
      if (!response.ok) throw new Error('Erro ao carregar dados');

      const data = await response.json();
      this.vinhos = data.vinhos;
      this.vinhosFiltrados = [...this.vinhos];

      console.log(`${this.vinhos.length} vinhos carregados com sucesso`);
    } catch (error) {
      console.error('Erro ao carregar vinhos:', error);
      throw error;
    }
  }

  // ===== EVENT LISTENERS =====
  configurarEventListeners() {
    // Busca textual
    const campoBusca = document.querySelector('input[placeholder*="Busque por nome"]');
    if (campoBusca) {
      campoBusca.addEventListener('input', (e) => {
        this.filtrosAtivos.busca = e.target.value.toLowerCase();
        this.aplicarFiltros();
      });
    }

    // Filtros de tipo
    const checkboxesTipo = document.querySelectorAll('#tinto, #branco, #rose, #espumante');
    checkboxesTipo.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('tipos', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Filtros de preço
    const checkboxesPreco = document.querySelectorAll('#preco1, #preco2, #preco3, #preco4');
    checkboxesPreco.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('precos', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Select região
    const selectRegiao = document.querySelector('select option[value="franca"]')?.parentElement;
    if (selectRegiao) {
      selectRegiao.addEventListener('change', (e) => {
        this.filtrosAtivos.regiao = e.target.value;
        this.aplicarFiltros();
      });
    }

    // Select uva
    const selectUva = document.querySelector('select option[value="cabernet"]')?.parentElement;
    if (selectUva) {
      selectUva.addEventListener('change', (e) => {
        this.filtrosAtivos.uva = e.target.value;
        this.aplicarFiltros();
      });
    }

    // Filtros de ocasião
    const checkboxesOcasiao = document.querySelectorAll(
      '#jantar-especial, #celebracao, #aperitivo, #almoco, #happy-hour, #jantar-romantico, #churrasco, #sobremesa'
    );
    checkboxesOcasiao.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('ocasioes', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Filtros de perfil
    const checkboxesPerfil = document.querySelectorAll(
      '#sem-erro, #aventureiro, #sofisticado, #tradicionalista, #descontraido, #explorador, #colecionador, #consciente'
    );
    checkboxesPerfil.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('perfis', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Filtros de características
    const checkboxesCaracteristicas = document.querySelectorAll(
      '#escolhaAgnello, #organico, #reserva, #premium'
    );
    checkboxesCaracteristicas.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('caracteristicas', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Filtros de corpo
    const checkboxesCorpo = document.querySelectorAll('#leve, #medio, #encorpado');
    checkboxesCorpo.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('corpo', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Filtros de doçura
    const checkboxesDocura = document.querySelectorAll('#seco, #meio-seco, #meio-doce, #brut, #brut-nature');
    checkboxesDocura.forEach(checkbox => {
      checkbox.addEventListener('change', () => {
        this.atualizarFiltroArray('docura', checkbox.id, checkbox.checked);
        this.aplicarFiltros();
      });
    });

    // Ordenação
    const selectOrdenacao = document.getElementById('orderBy');
    if (selectOrdenacao) {
      selectOrdenacao.addEventListener('change', (e) => {
        this.ordenarResultados(e.target.value);
        this.renderizarVinhos();
      });
    }

    // Limpar filtros
    const btnLimpar = document.querySelector('.btn-outline-secondary');
    if (btnLimpar) {
      btnLimpar.addEventListener('click', () => {
        this.limparFiltros();
      });
    }
  }

  // ===== FILTROS =====
  // TODO: Migrar para JSP - VinhoService.filtrar(filtros)
  aplicarFiltros() {
    this.vinhosFiltrados = this.vinhos.filter(vinho => {
      return this.passaPorTodosFiltros(vinho);
    });

    this.paginaAtual = 1; // Reset para primeira página
    this.renderizarVinhos();
    this.atualizarContador();
    this.renderizarPaginacao();
  }

  passaPorTodosFiltros(vinho) {
    // Filtro de busca textual
    if (this.filtrosAtivos.busca &&
        !vinho.nome.toLowerCase().includes(this.filtrosAtivos.busca) &&
        !vinho.regiao.toLowerCase().includes(this.filtrosAtivos.busca) &&
        !vinho.uva.toLowerCase().includes(this.filtrosAtivos.busca)) {
      return false;
    }

    // Filtro de tipo
    if (this.filtrosAtivos.tipos.length > 0) {
      const tipoMatch = this.filtrosAtivos.tipos.some(tipo => {
        const tipoMap = {
          'tinto': 'tinto',
          'branco': 'branco',
          'rose': 'rosé',
          'espumante': 'espumante'
        };
        return vinho.tipo === tipoMap[tipo];
      });
      if (!tipoMatch) return false;
    }

    // Filtro de preço
    if (this.filtrosAtivos.precos.length > 0) {
      const precoMatch = this.filtrosAtivos.precos.some(faixaId => {
        const preco = vinho.preco;
        switch(faixaId) {
          case 'preco1': return preco <= 100;
          case 'preco2': return preco > 100 && preco <= 200;
          case 'preco3': return preco > 200 && preco <= 500;
          case 'preco4': return preco > 500;
          default: return true;
        }
      });
      if (!precoMatch) return false;
    }

    // Filtro de região
    if (this.filtrosAtivos.regiao && this.filtrosAtivos.regiao !== '') {
      const regiaoMap = {
        'franca': 'França',
        'italia': 'Itália',
        'portugal': 'Portugal',
        'argentina': 'Argentina',
        'brasil': 'Brasil',
        'chile': 'Chile',
        'espanha': 'Espanha',
        'alemanha': 'Alemanha',
        'australia': 'Austrália',
        'eua': 'Estados Unidos'
      };
      if (vinho.regiao !== regiaoMap[this.filtrosAtivos.regiao]) return false;
    }

    // Filtro de uva
    if (this.filtrosAtivos.uva && this.filtrosAtivos.uva !== '') {
      const uvaMap = {
        'cabernet': 'Cabernet Sauvignon',
        'merlot': 'Merlot',
        'pinot': 'Pinot Noir',
        'chardonnay': 'Chardonnay',
        'sauvignon': 'Sauvignon Blanc',
        'malbec': 'Malbec',
        'tempranillo': 'Tempranillo',
        'nebbiolo': 'Nebbiolo',
        'sangiovese': 'Sangiovese',
        'riesling': 'Riesling'
      };
      if (vinho.uva !== uvaMap[this.filtrosAtivos.uva]) return false;
    }

    // Filtro de ocasião
    if (this.filtrosAtivos.ocasioes.length > 0) {
      const ocasiaoMap = {
        'jantar-especial': 'Jantar especial',
        'celebracao': 'Celebração',
        'aperitivo': 'Aperitivo',
        'almoco': 'Almoço',
        'happy-hour': 'Happy hour',
        'jantar-romantico': 'Jantar romântico',
        'churrasco': 'Churrasco',
        'sobremesa': 'Sobremesa'
      };

      const ocasiaoMatch = this.filtrosAtivos.ocasioes.some(ocasiaoId =>
        vinho.ocasiao && vinho.ocasiao.includes(ocasiaoMap[ocasiaoId])
      );
      if (!ocasiaoMatch) return false;
    }

    // Filtro de perfil
    if (this.filtrosAtivos.perfis.length > 0) {
      const perfilMap = {
        'sem-erro': 'Sem erro',
        'aventureiro': 'Aventureiro',
        'sofisticado': 'Sofisticado',
        'tradicionalista': 'Tradicionalista',
        'descontraido': 'Descontraído',
        'explorador': 'Explorador',
        'colecionador': 'Colecionador',
        'consciente': 'Consciente'
      };

      const perfilMatch = this.filtrosAtivos.perfis.some(perfilId =>
        vinho.perfil && vinho.perfil.includes(perfilMap[perfilId])
      );
      if (!perfilMatch) return false;
    }

    // Filtro de características
    if (this.filtrosAtivos.caracteristicas.length > 0) {
      const caracteristicaMatch = this.filtrosAtivos.caracteristicas.some(caracId => {
        switch(caracId) {
          case 'escolhaAgnello': return vinho.escolhaAgnello === true;
          case 'organico': return vinho.badges && vinho.badges.includes('Orgânico');
          case 'reserva': return vinho.badges && vinho.badges.includes('Reserva');
          case 'premium': return vinho.badges && vinho.badges.includes('Premium');
          default: return false;
        }
      });
      if (!caracteristicaMatch) return false;
    }

    // Filtro de corpo
    if (this.filtrosAtivos.corpo.length > 0) {
      const corpoMap = {
        'leve': 'Leve',
        'medio': 'Médio',
        'encorpado': 'Encorpado'
      };

      const corpoMatch = this.filtrosAtivos.corpo.some(corpoId =>
        vinho.corpo === corpoMap[corpoId]
      );
      if (!corpoMatch) return false;
    }

    // Filtro de doçura
    if (this.filtrosAtivos.docura.length > 0) {
      const docuraMap = {
        'seco': 'Seco',
        'meio-seco': 'Meio-seco',
        'meio-doce': 'Meio-doce',
        'brut': 'Brut',
        'brut-nature': 'Brut Nature'
      };

      const docuraMatch = this.filtrosAtivos.docura.some(docuraId =>
        vinho.docura === docuraMap[docuraId]
      );
      if (!docuraMatch) return false;
    }

    return true;
  }

  // ===== ORDENAÇÃO =====
  // TODO: Migrar para JSP - ORDER BY no SQL
  ordenarResultados(criterio) {
    switch(criterio) {
      case 'nome':
        this.vinhosFiltrados.sort((a, b) => a.nome.localeCompare(b.nome));
        break;
      case 'preco-menor':
        this.vinhosFiltrados.sort((a, b) => a.preco - b.preco);
        break;
      case 'preco-maior':
        this.vinhosFiltrados.sort((a, b) => b.preco - a.preco);
        break;
      case 'avaliacao':
        this.vinhosFiltrados.sort((a, b) => b.avaliacao - a.avaliacao);
        break;
      default: // relevância
        // Prioriza "Escolha Agnello" e depois por avaliação
        this.vinhosFiltrados.sort((a, b) => {
          if (a.escolhaAgnello && !b.escolhaAgnello) return -1;
          if (!a.escolhaAgnello && b.escolhaAgnello) return 1;
          return b.avaliacao - a.avaliacao;
        });
    }
  }

  // ===== PAGINAÇÃO =====
  // TODO: Migrar para JSP - LIMIT/OFFSET no SQL
  obterVinhosPaginados() {
    const inicio = (this.paginaAtual - 1) * this.itensPorPagina;
    const fim = inicio + this.itensPorPagina;
    return this.vinhosFiltrados.slice(inicio, fim);
  }

  obterTotalPaginas() {
    return Math.ceil(this.vinhosFiltrados.length / this.itensPorPagina);
  }

  // ===== RENDERIZAÇÃO =====
  // TODO: Migrar para JSP - Geração server-side
  renderizarVinhos() {
    const container = document.querySelector('.row.row-cols-1.row-cols-md-2.row-cols-lg-3');
    if (!container) return;

    const vinhosPaginados = this.obterVinhosPaginados();

    if (vinhosPaginados.length === 0) {
      container.innerHTML = `
        <div class="col-12 text-center py-5">
          <h4 class="text-cinza">Nenhum vinho encontrado</h4>
          <p class="text-cinza">Tente ajustar os filtros para encontrar vinhos disponíveis.</p>
        </div>
      `;
      return;
    }

    container.innerHTML = vinhosPaginados.map(vinho => this.criarCardVinho(vinho)).join('');
  }

  criarCardVinho(vinho) {
    const badges = vinho.badges ? vinho.badges.map(badge => {
      const badgeClass = badge === 'Escolha Agnello' ? 'bg-dourado' :
                       badge === 'Orgânico' ? 'bg-success' :
                       badge === 'Nacional' ? 'bg-warning text-dark' :
                       badge === 'Verão' ? 'bg-light text-dark' :
                       badge === 'Baixo Álcool' ? 'bg-success' :
                       badge === 'Kabinett' ? 'bg-primary' :
                       badge === 'Brut Nature' ? 'bg-light text-dark' : 'bg-secondary';

      return `<span class="badge ${badgeClass} mt-1">${badge}</span>`;
    }).join('') : '';

    const rating = '★'.repeat(vinho.avaliacao) + '☆'.repeat(5 - vinho.avaliacao);

    return `
      <div class="col">
        <div class="card wine-card h-100 shadow-sm">
          <div class="position-relative">
            <img src="${vinho.imagem}" class="card-img-top" alt="${vinho.nome}">
            <div class="badges-container position-absolute top-0 start-0 p-2">
              ${badges}
            </div>
            <div class="rating-container position-absolute top-0 end-0 p-2">
              <div class="rating text-warning">
                ${rating}
              </div>
            </div>
          </div>
          <div class="card-body d-flex flex-column">
            <h6 class="card-title text-marrom font-playfair">${vinho.nome}</h6>
            <p class="card-text text-cinza small mb-2">${vinho.regiao} • ${vinho.uva} • ${vinho.ano}</p>
            <p class="card-text text-cinza small flex-grow-1">${vinho.descricao_curta}</p>
            <div class="price-section mt-auto">
              <h5 class="text-dourado mb-2">R$ ${vinho.preco.toFixed(2).replace('.', ',')}</h5>
              <div class="d-grid">
                <button class="btn btn-agnello btn-sm">Adicionar ao Carrinho</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    `;
  }

  renderizarPaginacao() {
    const paginacao = document.querySelector('.pagination');
    if (!paginacao) return;

    const totalPaginas = this.obterTotalPaginas();
    if (totalPaginas <= 1) {
      paginacao.innerHTML = '';
      return;
    }

    let html = '';

    // Botão Anterior
    html += `
      <li class="page-item ${this.paginaAtual === 1 ? 'disabled' : ''}">
        <a class="page-link" href="#" data-page="${this.paginaAtual - 1}">Anterior</a>
      </li>
    `;

    // Páginas numeradas
    for (let i = 1; i <= totalPaginas; i++) {
      if (i === this.paginaAtual) {
        html += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
      } else if (i === 1 || i === totalPaginas || Math.abs(i - this.paginaAtual) <= 1) {
        html += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
      } else if (i === this.paginaAtual - 2 || i === this.paginaAtual + 2) {
        html += `<li class="page-item disabled"><span class="page-link">...</span></li>`;
      }
    }

    // Botão Próximo
    html += `
      <li class="page-item ${this.paginaAtual === totalPaginas ? 'disabled' : ''}">
        <a class="page-link" href="#" data-page="${this.paginaAtual + 1}">Próximo</a>
      </li>
    `;

    paginacao.innerHTML = html;

    // Event listeners para paginação
    paginacao.querySelectorAll('a.page-link').forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        const novaPagina = parseInt(e.target.dataset.page);
        if (novaPagina && novaPagina !== this.paginaAtual) {
          this.paginaAtual = novaPagina;
          this.renderizarVinhos();
          this.renderizarPaginacao();
          // Scroll para o topo da listagem
          document.querySelector('.search-bar').scrollIntoView({ behavior: 'smooth' });
        }
      });
    });
  }

  // ===== UTILITÁRIOS =====
  atualizarFiltroArray(tipo, valor, adicionar) {
    if (adicionar) {
      if (!this.filtrosAtivos[tipo].includes(valor)) {
        this.filtrosAtivos[tipo].push(valor);
      }
    } else {
      this.filtrosAtivos[tipo] = this.filtrosAtivos[tipo].filter(item => item !== valor);
    }
  }

  atualizarContador() {
    const contador = document.querySelector('.toolbar-catalog p, .d-flex p');
    if (contador) {
      const inicio = (this.paginaAtual - 1) * this.itensPorPagina + 1;
      const fim = Math.min(this.paginaAtual * this.itensPorPagina, this.vinhosFiltrados.length);
      const total = this.vinhosFiltrados.length;

      contador.textContent = total > 0 ?
        `Mostrando ${inicio}-${fim} de ${total} vinhos` :
        'Nenhum vinho encontrado';
    }
  }

  limparFiltros() {
    // Reset filtros
    this.filtrosAtivos = {
      busca: '',
      tipos: [],
      precos: [],
      regiao: '',
      uva: '',
      ocasioes: [],
      perfis: [],
      caracteristicas: [],
      corpo: [],
      docura: []
    };

    // Limpar campos do form
    document.querySelectorAll('input[type="checkbox"]').forEach(cb => cb.checked = false);
    document.querySelectorAll('select').forEach(select => select.selectedIndex = 0);
    document.querySelector('input[placeholder*="Busque por nome"]').value = '';

    // Reaplicar filtros
    this.aplicarFiltros();
  }

  mostrarLoading(mostrar = true) {
    const container = document.querySelector('.row.row-cols-1.row-cols-md-2.row-cols-lg-3');
    if (!container) return;

    if (mostrar) {
      container.innerHTML = `
        <div class="col-12 text-center py-5">
          <div class="spinner-border text-dourado" role="status">
            <span class="visually-hidden">Carregando...</span>
          </div>
          <p class="mt-3 text-cinza">Carregando vinhos...</p>
        </div>
      `;
    }
  }

  mostrarErro(mensagem) {
    const container = document.querySelector('.row.row-cols-1.row-cols-md-2.row-cols-lg-3');
    if (container) {
      container.innerHTML = `
        <div class="col-12 text-center py-5">
          <h4 class="text-danger">Erro</h4>
          <p class="text-cinza">${mensagem}</p>
        </div>
      `;
    }
  }
}

// ===== INICIALIZAÇÃO =====
// TODO: Na migração JSP, remover este bloco
document.addEventListener('DOMContentLoaded', () => {
  // Verificar se estamos na página do catálogo
  if (window.location.pathname.includes('catalogo.html')) {
    new CatalogoManager();
  }
});

// Exportar para possível uso futuro (migração)
window.CatalogoManager = CatalogoManager;