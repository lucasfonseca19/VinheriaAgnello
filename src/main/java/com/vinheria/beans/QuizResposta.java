package com.vinheria.beans;

import java.io.Serializable;

/**
 * Bean para capturar e armazenar as respostas do quiz "Descubra seu Vinho"
 * Implementa Serializable para permitir armazenamento na sessão
 */
public class QuizResposta implements Serializable {
    private static final long serialVersionUID = 1L;

    // Pergunta 1: Ocasião
    private String ocasiao;

    // Pergunta 2: Experiência/Perfil
    private String perfil;

    // Pergunta 3: Tipo Preferido
    private String tipoPreferido;

    // Pergunta 4: Orçamento
    private String faixaOrcamento;

    // Pergunta 5: Características
    private String caracteristicas;

    // Controle do quiz
    private int perguntaAtual = 1;
    private boolean completo = false;

    // Construtores
    public QuizResposta() {}

    // Getters e Setters
    public String getOcasiao() {
        return ocasiao;
    }

    public void setOcasiao(String ocasiao) {
        this.ocasiao = ocasiao;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getTipoPreferido() {
        return tipoPreferido;
    }

    public void setTipoPreferido(String tipoPreferido) {
        this.tipoPreferido = tipoPreferido;
    }

    public String getFaixaOrcamento() {
        return faixaOrcamento;
    }

    public void setFaixaOrcamento(String faixaOrcamento) {
        this.faixaOrcamento = faixaOrcamento;
    }

    public String getCaracteristicas() {
        return caracteristicas;
    }

    public void setCaracteristicas(String caracteristicas) {
        this.caracteristicas = caracteristicas;
    }

    public int getPerguntaAtual() {
        return perguntaAtual;
    }

    public void setPerguntaAtual(int perguntaAtual) {
        this.perguntaAtual = perguntaAtual;
    }

    public boolean isCompleto() {
        return completo;
    }

    public void setCompleto(boolean completo) {
        this.completo = completo;
    }

    // Métodos utilitários
    public void proximaPergunta() {
        if (perguntaAtual < 5) {
            perguntaAtual++;
        } else {
            completo = true;
        }
    }

    public void perguntaAnterior() {
        if (perguntaAtual > 1) {
            perguntaAtual--;
        }
    }

    public double getProgresso() {
        return (perguntaAtual / 5.0) * 100.0;
    }

    public boolean isValidaPerguntaAtual() {
        switch (perguntaAtual) {
            case 1: return ocasiao != null && !ocasiao.trim().isEmpty();
            case 2: return perfil != null && !perfil.trim().isEmpty();
            case 3: return tipoPreferido != null && !tipoPreferido.trim().isEmpty();
            case 4: return faixaOrcamento != null && !faixaOrcamento.trim().isEmpty();
            case 5: return caracteristicas != null && !caracteristicas.trim().isEmpty();
            default: return false;
        }
    }

    @Override
    public String toString() {
        return "QuizResposta{" +
                "ocasiao='" + ocasiao + '\'' +
                ", perfil='" + perfil + '\'' +
                ", tipoPreferido='" + tipoPreferido + '\'' +
                ", faixaOrcamento='" + faixaOrcamento + '\'' +
                ", caracteristicas='" + caracteristicas + '\'' +
                ", perguntaAtual=" + perguntaAtual +
                ", completo=" + completo +
                '}';
    }
}