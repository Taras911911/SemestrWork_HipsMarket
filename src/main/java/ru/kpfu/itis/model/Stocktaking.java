package ru.kpfu.itis.model;

import javax.persistence.*;

@Entity
@Table(name = "stocktaking")
public class Stocktaking {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @OneToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;
    @OneToOne
    @JoinColumn(name = "stock_id", nullable = false)
    private Stock stock;
    @Column(nullable = false)
    private int quantity_product;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public int getQuantity() {
        return quantity_product;
    }

    public void setQuantity(int quantity_product) {
        this.quantity_product = quantity_product;
    }
}
