package com.vinheria.service;

import com.vinheria.beans.Vinho;
import com.vinheria.beans.QuizResposta;
import java.util.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Service para operações com vinhos e algoritmo de recomendação
 */
public class VinhoService {
    private static final String JSON_PATH = "/data/vinhos.json";
    private List<Vinho> vinhos;

    public VinhoService() {
        carregarVinhos();
    }

    /**
     * Carrega os vinhos do arquivo JSON
     */
    private void carregarVinhos() {
        vinhos = new ArrayList<>();

        // Para fins de demonstração, vamos criar alguns vinhos hardcoded
        // Em um ambiente real, seria feito parsing do JSON
        criarVinhosMock();
    }

    /**
     * Cria vinhos mock baseados no JSON existente
     */
    private void criarVinhosMock() {
        // Vinho 1 - Château Ausone (Premium, Tinto)
        Vinho vinho1 = new Vinho();
        vinho1.setId(1);
        vinho1.setNome("Château Ausone Saint-Émilion");
        vinho1.setPreco(1850.00);
        vinho1.setImagem("https://placehold.co/280x380/8B4513/FFFFFF/png?text=Château+Ausone");
        vinho1.setTipo("tinto");
        vinho1.setRegiao("França");
        vinho1.setUva("Merlot");
        vinho1.setAno(2018);
        vinho1.setAvaliacao(5);
        vinho1.setEscolhaAgnello(true);
        vinho1.setCorpo("Encorpado");
        vinho1.setDocura("Seco");
        vinho1.setOcasiao(Arrays.asList("Jantar especial", "Celebração"));
        vinho1.setPerfil(Arrays.asList("Aventureiro", "Sofisticado"));
        vinho1.setDescricaoAgnello("Giulio Agnello: Elegância e complexidade em cada gole. Um vinho para momentos especiais.");
        vinhos.add(vinho1);

        // Vinho 2 - Chablis (Branco, Médio)
        Vinho vinho2 = new Vinho();
        vinho2.setId(3);
        vinho2.setNome("Chablis Premier Cru Montmains");
        vinho2.setPreco(180.00);
        vinho2.setImagem("https://placehold.co/280x380/F5F5DC/8B4513/png?text=Chablis+Premier");
        vinho2.setTipo("branco");
        vinho2.setRegiao("França");
        vinho2.setUva("Chardonnay");
        vinho2.setAno(2020);
        vinho2.setAvaliacao(4);
        vinho2.setEscolhaAgnello(false);
        vinho2.setCorpo("Leve");
        vinho2.setDocura("Seco");
        vinho2.setOcasiao(Arrays.asList("Almoço", "Aperitivo"));
        vinho2.setPerfil(Arrays.asList("Sem erro", "Elegante"));
        vinho2.setDescricaoAgnello("Giulio Agnello: Mineralidade única de Chablis, perfeito para quem busca elegância.");
        vinhos.add(vinho2);

        // Vinho 3 - Dom Pérignon (Espumante Premium)
        Vinho vinho3 = new Vinho();
        vinho3.setId(4);
        vinho3.setNome("Dom Pérignon Vintage");
        vinho3.setPreco(950.00);
        vinho3.setImagem("https://placehold.co/280x380/2F4F2F/FFFFFF/png?text=Dom+Pérignon");
        vinho3.setTipo("espumante");
        vinho3.setRegiao("França");
        vinho3.setUva("Chardonnay");
        vinho3.setAno(2013);
        vinho3.setAvaliacao(5);
        vinho3.setEscolhaAgnello(true);
        vinho3.setCorpo("Médio");
        vinho3.setDocura("Brut");
        vinho3.setOcasiao(Arrays.asList("Celebração", "Brinde"));
        vinho3.setPerfil(Arrays.asList("Luxuoso", "Sofisticado"));
        vinho3.setDescricaoAgnello("Bianca Agnello: O champagne dos sonhos para celebrações inesquecíveis.");
        vinhos.add(vinho3);

        // Vinho 4 - Catena Zapata (Argentino, Acessível)
        Vinho vinho4 = new Vinho();
        vinho4.setId(6);
        vinho4.setNome("Catena Zapata Malbec");
        vinho4.setPreco(150.00);
        vinho4.setImagem("https://placehold.co/280x380/4B0082/FFFFFF/png?text=Catena+Zapata");
        vinho4.setTipo("tinto");
        vinho4.setRegiao("Argentina");
        vinho4.setUva("Malbec");
        vinho4.setAno(2020);
        vinho4.setAvaliacao(4);
        vinho4.setEscolhaAgnello(false);
        vinho4.setCorpo("Encorpado");
        vinho4.setDocura("Seco");
        vinho4.setOcasiao(Arrays.asList("Churrasco", "Encontro amigos"));
        vinho4.setPerfil(Arrays.asList("Aventureiro", "Descontraído"));
        vinho4.setDescricaoAgnello("Bianca Agnello: Intensidade argentina autêntica, perfeito para momentos descontraídos.");
        vinhos.add(vinho4);

        // Vinho 5 - Whispering Angel (Rosé)
        Vinho vinho5 = new Vinho();
        vinho5.setId(8);
        vinho5.setNome("Whispering Angel Rosé");
        vinho5.setPreco(120.00);
        vinho5.setImagem("https://placehold.co/280x380/FFC0CB/8B4513/png?text=Whispering+Angel");
        vinho5.setTipo("rosé");
        vinho5.setRegiao("França");
        vinho5.setUva("Grenache");
        vinho5.setAno(2022);
        vinho5.setAvaliacao(4);
        vinho5.setEscolhaAgnello(false);
        vinho5.setCorpo("Leve");
        vinho5.setDocura("Seco");
        vinho5.setOcasiao(Arrays.asList("Verão", "Piscina"));
        vinho5.setPerfil(Arrays.asList("Descontraído", "Fresh"));
        vinho5.setDescricaoAgnello("Bianca Agnello: Frescor provençal incomparável, o verão em uma garrafa!");
        vinhos.add(vinho5);

        // Vinho 6 - Riesling (Doce, Iniciante)
        Vinho vinho6 = new Vinho();
        vinho6.setId(9);
        vinho6.setNome("Riesling Kabinett Dr. Loosen");
        vinho6.setPreco(95.00);
        vinho6.setImagem("https://placehold.co/280x380/FFFFE0/8B4513/png?text=Dr.+Loosen");
        vinho6.setTipo("branco");
        vinho6.setRegiao("Alemanha");
        vinho6.setUva("Riesling");
        vinho6.setAno(2021);
        vinho6.setAvaliacao(4);
        vinho6.setEscolhaAgnello(false);
        vinho6.setCorpo("Leve");
        vinho6.setDocura("Meio-doce");
        vinho6.setOcasiao(Arrays.asList("Sobremesa", "Aperitivo"));
        vinho6.setPerfil(Arrays.asList("Sem erro", "Explorador"));
        vinho6.setDescricaoAgnello("Giulio Agnello: Doçura equilibrada alemã, perfeito para quem está começando.");
        vinhos.add(vinho6);

        // Vinho 7 - Prosecco (Espumante Acessível)
        Vinho vinho7 = new Vinho();
        vinho7.setId(13);
        vinho7.setNome("Prosecco di Valdobbiadene DOCG");
        vinho7.setPreco(75.00);
        vinho7.setImagem("https://placehold.co/280x380/F5F5DC/8B4513/png?text=Prosecco+DOCG");
        vinho7.setTipo("espumante");
        vinho7.setRegiao("Itália");
        vinho7.setUva("Glera");
        vinho7.setAno(2022);
        vinho7.setAvaliacao(3);
        vinho7.setEscolhaAgnello(false);
        vinho7.setCorpo("Leve");
        vinho7.setDocura("Extra-seco");
        vinho7.setOcasiao(Arrays.asList("Happy hour", "Celebração"));
        vinho7.setPerfil(Arrays.asList("Descontraído", "Sociável"));
        vinho7.setDescricaoAgnello("Giulio Agnello: Borbulhas italianas autênticas, alegria em cada gole!");
        vinhos.add(vinho7);

        // Vinho 8 - Tempranillo (Espanhol, Tradicional)
        Vinho vinho8 = new Vinho();
        vinho8.setId(16);
        vinho8.setNome("Tempranillo Reserva Marqués de Riscal");
        vinho8.setPreco(160.00);
        vinho8.setImagem("https://placehold.co/280x380/8B0000/FFFFFF/png?text=Marqués+Riscal");
        vinho8.setTipo("tinto");
        vinho8.setRegiao("Espanha");
        vinho8.setUva("Tempranillo");
        vinho8.setAno(2017);
        vinho8.setAvaliacao(4);
        vinho8.setEscolhaAgnello(false);
        vinho8.setCorpo("Médio");
        vinho8.setDocura("Seco");
        vinho8.setOcasiao(Arrays.asList("Jantar família", "Tapas"));
        vinho8.setPerfil(Arrays.asList("Tradicionalista", "Autêntico"));
        vinho8.setDescricaoAgnello("Bianca Agnello: Tradição espanhola centenária, calorosa e autêntica.");
        vinhos.add(vinho8);
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

    // Getters
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