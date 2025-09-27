package com.vinheria.beans;

import java.io.Serializable;

/**
 * Bean que representa um item no carrinho de compras
 */
public class CarrinhoItem implements Serializable {
    private static final long serialVersionUID = 1L;

    private int vinhoId;
    private String vinhoNome;
    private double vinhoPreco;
    private String vinhoImagem;
    private int quantidade;

    // Construtores
    public CarrinhoItem() {}

    public CarrinhoItem(int vinhoId, String vinhoNome, double vinhoPreco, String vinhoImagem, int quantidade) {
        this.vinhoId = vinhoId;
        this.vinhoNome = vinhoNome;
        this.vinhoPreco = vinhoPreco;
        this.vinhoImagem = vinhoImagem;
        this.quantidade = quantidade;
    }

    // Getters e Setters
    public int getVinhoId() {
        return vinhoId;
    }

    public void setVinhoId(int vinhoId) {
        this.vinhoId = vinhoId;
    }

    public String getVinhoNome() {
        return vinhoNome;
    }

    public void setVinhoNome(String vinhoNome) {
        this.vinhoNome = vinhoNome;
    }

    public double getVinhoPreco() {
        return vinhoPreco;
    }

    public void setVinhoPreco(double vinhoPreco) {
        this.vinhoPreco = vinhoPreco;
    }

    public String getVinhoImagem() {
        return vinhoImagem;
    }

    public void setVinhoImagem(String vinhoImagem) {
        this.vinhoImagem = vinhoImagem;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    // Métodos utilitários
    public double getSubtotal() {
        return vinhoPreco * quantidade;
    }

    public String getSubtotalFormatado() {
        return String.format("R$ %.2f", getSubtotal()).replace(".", ",");
    }

    @Override
    public String toString() {
        return "CarrinhoItem{" +
                "vinhoId=" + vinhoId +
                ", vinhoNome='" + vinhoNome + '\'' +
                ", quantidade=" + quantidade +
                ", subtotal=" + getSubtotal() +
                '}';
    }
}