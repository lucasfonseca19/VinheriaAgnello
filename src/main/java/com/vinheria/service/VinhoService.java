package com.vinheria.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.vinheria.beans.QuizResposta;
import com.vinheria.beans.Vinho;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Type;
import java.util.*;

/**
 * Service para operações com vinhos e algoritmo de recomendação
 */
public class VinhoService {
    private static final String JSON_PATH = "/data/vinhos.json";
    private List<Vinho> vinhos;

    // Classe interna para corresponder à estrutura do JSON
    private static class VinhosData {
        List<Vinho> vinhos;
    }

    public VinhoService() {
        carregarVinhos();
    }

    /**
     * Carrega os vinhos dinamicamente do arquivo vinhos.json usando Gson.
     */
    private void carregarVinhos() {
        try (InputStream inputStream = VinhoService.class.getResourceAsStream(JSON_PATH)) {
            if (inputStream == null) {
                throw new RuntimeException("Arquivo JSON não encontrado no classpath: " + JSON_PATH);
            }
            try (Reader reader = new InputStreamReader(inputStream)) {
                Gson gson = new Gson();
                VinhosData vinhosData = gson.fromJson(reader, VinhosData.class);
                this.vinhos = vinhosData.vinhos;
            }
        } catch (Exception e) {
            System.err.println("Erro crítico ao carregar e processar o arquivo JSON: " + e.getMessage());
            e.printStackTrace();
            // Em caso de falha, inicializa com uma lista vazia para evitar NullPointerException
            this.vinhos = new ArrayList<>();
        }
    }

    /**
     * Implementa o algoritmo de recomendação baseado nas respostas do quiz
     */
    public List<Vinho> recomendarVinhos(QuizResposta respostas) {
        Map<Vinho, Integer> pontuacao = new HashMap<>();

        for (Vinho vinho : vinhos) {
            int pontos = 0;

            // Pergunta 1: Ocasião (+10 pontos)
            if (vinho.temOcasiao(mapearOcasiao(respostas.getOcasiao()))) {
                pontos += 10;
            }

            // Pergunta 2: Perfil (+10 pontos)
            if (vinho.temPerfil(mapearPerfil(respostas.getPerfil()))) {
                pontos += 10;
            }

            // Pergunta 3: Tipo Preferido (+8 pontos)
            if (vinho.getTipo().equals(mapearTipo(respostas.getTipoPreferido()))) {
                pontos += 8;
            }

            // Pergunta 4: Orçamento (+8 pontos)
            if (dentroOrcamento(vinho.getPreco(), respostas.getFaixaOrcamento())) {
                pontos += 8;
            }

            // Pergunta 5: Características (+6 pontos)
            if (combinaCaracteristicas(vinho, respostas.getCaracteristicas())) {
                pontos += 6;
            }

            // Bonus: Escolha Agnello (+5 pontos)
            if (vinho.isEscolhaAgnello()) {
                pontos += 5;
            }

            pontuacao.put(vinho, pontos);
        }

        // Ordena por pontuação e retorna os top 3
        return pontuacao.entrySet().stream()
                .sorted(Map.Entry.<Vinho, Integer>comparingByValue().reversed())
                .limit(3)
                .map(Map.Entry::getKey)
                .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
    }

    // Métodos auxiliares de mapeamento

    private String mapearOcasiao(String ocasiao) {
        switch (ocasiao) {
            case "jantar_romantico": return "Jantar romântico";
            case "celebracao": return "Celebração";
            case "aperitivo": return "Aperitivo";
            case "churrasco": return "Churrasco";
            case "almoco_familia": return "Jantar família";
            case "happy_hour": return "Happy hour";
            default: return ocasiao;
        }
    }

    private String mapearPerfil(String perfil) {
        switch (perfil) {
            case "iniciante": return "Sem erro";
            case "aventureiro": return "Aventureiro";
            case "tradicionalista": return "Tradicionalista";
            case "sofisticado": return "Sofisticado";
            case "descontraido": return "Descontraído";
            default: return perfil;
        }
    }

    private String mapearTipo(String tipo) {
        switch (tipo) {
            case "tinto_encorpado": return "tinto";
            case "branco_refrescante": return "branco";
            case "rose_leve": return "rosé";
            case "espumante_elegante": return "espumante";
            default: return tipo;
        }
    }

    private boolean dentroOrcamento(double preco, String faixa) {
        switch (faixa) {
            case "ate_100": return preco <= 100;
            case "100_200": return preco > 100 && preco <= 200;
            case "200_500": return preco > 200 && preco <= 500;
            case "acima_500": return preco > 500;
            default: return true;
        }
    }

    private boolean combinaCaracteristicas(Vinho vinho, String caracteristica) {
        switch (caracteristica) {
            case "leve_facil":
                return "Leve".equals(vinho.getCorpo()) || "Meio-doce".equals(vinho.getDocura());
            case "equilibrado":
                return "Médio".equals(vinho.getCorpo());
            case "intenso_marcante":
                return "Encorpado".equals(vinho.getCorpo());
            case "doce_suave":
                return "Meio-doce".equals(vinho.getDocura()) || "Extra-seco".equals(vinho.getDocura());
            default:
                return false;
        }
    }

    // Métodos para o catálogo JSP

    /**
     * Filtra vinhos baseado nos parâmetros da request
     */
    public List<Vinho> filtrarVinhos(String busca, String[] tipos, String[] precos,
                                     String regiao, String uva, String[] ocasioes,
                                     String[] perfis, String[] caracteristicas,
                                     String[] corpos, String[] docuras) {
        return vinhos.stream()
                .filter(vinho -> passaPorFiltros(vinho, busca, tipos, precos, regiao, uva,
                                                ocasioes, perfis, caracteristicas, corpos, docuras))
                .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
    }

    private boolean passaPorFiltros(Vinho vinho, String busca, String[] tipos, String[] precos,
                                   String regiao, String uva, String[] ocasioes, String[] perfis,
                                   String[] caracteristicas, String[] corpos, String[] docuras) {

        // Filtro de busca textual
        if (busca != null && !busca.trim().isEmpty()) {
            String buscaLower = busca.toLowerCase();
            boolean matchBusca = vinho.getNome().toLowerCase().contains(buscaLower) ||
                               vinho.getRegiao().toLowerCase().contains(buscaLower) ||
                               vinho.getUva().toLowerCase().contains(buscaLower);
            if (!matchBusca) return false;
        }

        // Filtro de tipo
        if (tipos != null && tipos.length > 0) {
            boolean matchTipo = false;
            for (String tipo : tipos) {
                if (tipo.equals(vinho.getTipo())) {
                    matchTipo = true;
                    break;
                }
            }
            if (!matchTipo) return false;
        }

        // Filtro de preço
        if (precos != null && precos.length > 0) {
            boolean matchPreco = false;
            for (String faixaId : precos) {
                double preco = vinho.getPreco();
                boolean dentroFaixa = false;
                switch(faixaId) {
                    case "preco1": dentroFaixa = preco <= 100; break;
                    case "preco2": dentroFaixa = preco > 100 && preco <= 200; break;
                    case "preco3": dentroFaixa = preco > 200 && preco <= 500; break;
                    case "preco4": dentroFaixa = preco > 500; break;
                }
                if (dentroFaixa) {
                    matchPreco = true;
                    break;
                }
            }
            if (!matchPreco) return false;
        }

        // Filtro de região
        if (regiao != null && !regiao.trim().isEmpty() && !regiao.equals("todas")) {
            String regiaoMapeada = mapearRegiao(regiao);
            if (!vinho.getRegiao().equals(regiaoMapeada)) return false;
        }

        // Filtro de uva
        if (uva != null && !uva.trim().isEmpty() && !uva.equals("todas")) {
            String uvaMapeada = mapearUva(uva);
            if (!vinho.getUva().equals(uvaMapeada)) return false;
        }

        // Filtro de ocasião
        if (ocasioes != null && ocasioes.length > 0) {
            boolean matchOcasiao = false;
            for (String ocasiaoId : ocasioes) {
                String ocasiaoMapeada = mapearOcasiaoFiltro(ocasiaoId);
                if (vinho.temOcasiao(ocasiaoMapeada)) {
                    matchOcasiao = true;
                    break;
                }
            }
            if (!matchOcasiao) return false;
        }

        // Filtro de perfil
        if (perfis != null && perfis.length > 0) {
            boolean matchPerfil = false;
            for (String perfilId : perfis) {
                String perfilMapeado = mapearPerfilFiltro(perfilId);
                if (vinho.temPerfil(perfilMapeado)) {
                    matchPerfil = true;
                    break;
                }
            }
            if (!matchPerfil) return false;
        }

        // Filtro de características
        if (caracteristicas != null && caracteristicas.length > 0) {
            boolean matchCaracteristica = false;
            for (String caracId : caracteristicas) {
                boolean temCaracteristica = false;
                switch(caracId) {
                    case "escolhaAgnello": temCaracteristica = vinho.isEscolhaAgnello(); break;
                    case "organico": temCaracteristica = vinho.temBadge("Orgânico"); break;
                    case "reserva": temCaracteristica = vinho.temBadge("Reserva"); break;
                    case "premium": temCaracteristica = vinho.temBadge("Premium"); break;
                }
                if (temCaracteristica) {
                    matchCaracteristica = true;
                    break;
                }
            }
            if (!matchCaracteristica) return false;
        }

        // Filtro de corpo
        if (corpos != null && corpos.length > 0) {
            boolean matchCorpo = false;
            for (String corpoId : corpos) {
                String corpoMapeado = mapearCorpo(corpoId);
                if (vinho.getCorpo().equals(corpoMapeado)) {
                    matchCorpo = true;
                    break;
                }
            }
            if (!matchCorpo) return false;
        }

        // Filtro de doçura
        if (docuras != null && docuras.length > 0) {
            boolean matchDocura = false;
            for (String docuraId : docuras) {
                String docuraMapeada = mapearDocura(docuraId);
                if (vinho.getDocura().equals(docuraMapeada)) {
                    matchDocura = true;
                    break;
                }
            }
            if (!matchDocura) return false;
        }

        return true;
    }

    // Métodos de mapeamento para filtros
    private String mapearRegiao(String regiao) {
        switch(regiao) {
            case "franca": return "França";
            case "italia": return "Itália";
            case "portugal": return "Portugal";
            case "argentina": return "Argentina";
            case "brasil": return "Brasil";
            case "chile": return "Chile";
            case "espanha": return "Espanha";
            case "alemanha": return "Alemanha";
            case "australia": return "Austrália";
            case "eua": return "Estados Unidos";
            default: return regiao;
        }
    }

    private String mapearUva(String uva) {
        switch(uva) {
            case "cabernet": return "Cabernet Sauvignon";
            case "merlot": return "Merlot";
            case "pinot": return "Pinot Noir";
            case "chardonnay": return "Chardonnay";
            case "sauvignon": return "Sauvignon Blanc";
            case "malbec": return "Malbec";
            case "tempranillo": return "Tempranillo";
            case "nebbiolo": return "Nebbiolo";
            case "sangiovese": return "Sangiovese";
            case "riesling": return "Riesling";
            default: return uva;
        }
    }

    private String mapearOcasiaoFiltro(String ocasiao) {
        switch(ocasiao) {
            case "jantar-especial": return "Jantar especial";
            case "celebracao": return "Celebração";
            case "aperitivo": return "Aperitivo";
            case "almoco": return "Almoço";
            case "happy-hour": return "Happy hour";
            case "jantar-romantico": return "Jantar romântico";
            case "churrasco": return "Churrasco";
            case "sobremesa": return "Sobremesa";
            default: return ocasiao;
        }
    }

    private String mapearPerfilFiltro(String perfil) {
        switch(perfil) {
            case "sem-erro": return "Sem erro";
            case "aventureiro": return "Aventureiro";
            case "sofisticado": return "Sofisticado";
            case "tradicionalista": return "Tradicionalista";
            case "descontraido": return "Descontraído";
            case "explorador": return "Explorador";
            case "colecionador": return "Colecionador";
            case "consciente": return "Consciente";
            default: return perfil;
        }
    }

    private String mapearCorpo(String corpo) {
        switch(corpo) {
            case "leve": return "Leve";
            case "medio": return "Médio";
            case "encorpado": return "Encorpado";
            default: return corpo;
        }
    }

    private String mapearDocura(String docura) {
        switch(docura) {
            case "seco": return "Seco";
            case "meio-seco": return "Meio-seco";
            case "meio-doce": return "Meio-doce";
            case "brut": return "Brut";
            case "brut-nature": return "Brut Nature";
            default: return docura;
        }
    }

    /**
     * Ordena a lista de vinhos conforme critério
     */
    public List<Vinho> ordenarVinhos(List<Vinho> vinhos, String criterio) {
        List<Vinho> vinhosCopia = new ArrayList<>(vinhos);

        switch(criterio) {
            case "nome":
                vinhosCopia.sort((a, b) -> a.getNome().compareTo(b.getNome()));
                break;
            case "preco-menor":
                vinhosCopia.sort((a, b) -> Double.compare(a.getPreco(), b.getPreco()));
                break;
            case "preco-maior":
                vinhosCopia.sort((a, b) -> Double.compare(b.getPreco(), a.getPreco()));
                break;
            case "avaliacao":
                vinhosCopia.sort((a, b) -> Integer.compare(b.getAvaliacao(), a.getAvaliacao()));
                break;
            default: // relevância
                vinhosCopia.sort((a, b) -> {
                    if (a.isEscolhaAgnello() && !b.isEscolhaAgnello()) return -1;
                    if (!a.isEscolhaAgnello() && b.isEscolhaAgnello()) return 1;
                    return Integer.compare(b.getAvaliacao(), a.getAvaliacao());
                });
        }
        return vinhosCopia;
    }

    /**
     * Pagina a lista de vinhos
     */
    public List<Vinho> paginarVinhos(List<Vinho> vinhos, int pagina, int itensPorPagina) {
        int inicio = (pagina - 1) * itensPorPagina;
        int fim = Math.min(inicio + itensPorPagina, vinhos.size());

        if (inicio >= vinhos.size()) return new ArrayList<>();

        return vinhos.subList(inicio, fim);
    }

    /**
     * Calcula total de páginas
     */
    public int calcularTotalPaginas(int totalItens, int itensPorPagina) {
        return (int) Math.ceil((double) totalItens / itensPorPagina);
    }

    // Getters originais
    public List<Vinho> getTodosVinhos() {
        return new ArrayList<>(vinhos);
    }

    public Vinho buscarPorId(int id) {
        return vinhos.stream()
                .filter(vinho -> vinho.getId() == id)
                .findFirst()
                .orElse(null);
    }
}