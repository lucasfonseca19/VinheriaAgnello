package com.vinheria.beans;

import java.io.Serializable;
import java.util.List;

/**
 * Bean que representa um vinho no sistema
 */
public class Vinho implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String nome;
    private double preco;
    private String imagem;
    private String tipo;
    private String regiao;
    private String uva;
    private int ano;
    private int avaliacao;
    private boolean escolhaAgnello;
    private String harmonizacao;
    private double teorAlcoolico;
    private int estoque;
    private String descricaoCurta;
    private List<String> badges;
    private List<String> ocasiao;
    private List<String> perfil;
    private String corpo;
    private String docura;
    private String descricaoAgnello;

    // Construtores
    public Vinho() {}

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRegiao() {
        return regiao;
    }

    public void setRegiao(String regiao) {
        this.regiao = regiao;
    }

    public String getUva() {
        return uva;
    }

    public void setUva(String uva) {
        this.uva = uva;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(int avaliacao) {
        this.avaliacao = avaliacao;
    }

    public boolean isEscolhaAgnello() {
        return escolhaAgnello;
    }

    public void setEscolhaAgnello(boolean escolhaAgnello) {
        this.escolhaAgnello = escolhaAgnello;
    }

    public String getHarmonizacao() {
        return harmonizacao;
    }

    public void setHarmonizacao(String harmonizacao) {
        this.harmonizacao = harmonizacao;
    }

    public double getTeorAlcoolico() {
        return teorAlcoolico;
    }

    public void setTeorAlcoolico(double teorAlcoolico) {
        this.teorAlcoolico = teorAlcoolico;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }

    public String getDescricaoCurta() {
        return descricaoCurta;
    }

    public void setDescricaoCurta(String descricaoCurta) {
        this.descricaoCurta = descricaoCurta;
    }

    public List<String> getBadges() {
        return badges;
    }

    public void setBadges(List<String> badges) {
        this.badges = badges;
    }

    public List<String> getOcasiao() {
        return ocasiao;
    }

    public void setOcasiao(List<String> ocasiao) {
        this.ocasiao = ocasiao;
    }

    public List<String> getPerfil() {
        return perfil;
    }

    public void setPerfil(List<String> perfil) {
        this.perfil = perfil;
    }

    public String getCorpo() {
        return corpo;
    }

    public void setCorpo(String corpo) {
        this.corpo = corpo;
    }

    public String getDocura() {
        return docura;
    }

    public void setDocura(String docura) {
        this.docura = docura;
    }

    public String getDescricaoAgnello() {
        return descricaoAgnello;
    }

    public void setDescricaoAgnello(String descricaoAgnello) {
        this.descricaoAgnello = descricaoAgnello;
    }

    // Métodos utilitários
    public String getPrecoFormatado() {
        return String.format("R$ %.2f", preco);
    }

    public String getEstrelas() {
        StringBuilder estrelas = new StringBuilder();
        for (int i = 1; i <= 5; i++) {
            if (i <= avaliacao) {
                estrelas.append("★");
            } else {
                estrelas.append("☆");
            }
        }
        return estrelas.toString();
    }

    public boolean temBadge(String badge) {
        return badges != null && badges.contains(badge);
    }

    public boolean temOcasiao(String ocasiao) {
        return this.ocasiao != null && this.ocasiao.contains(ocasiao);
    }

    public boolean temPerfil(String perfil) {
        return this.perfil != null && this.perfil.contains(perfil);
    }

    @Override
    public String toString() {
        return "Vinho{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", preco=" + preco +
                ", tipo='" + tipo + '\'' +
                ", escolhaAgnello=" + escolhaAgnello +
                '}';
    }
}