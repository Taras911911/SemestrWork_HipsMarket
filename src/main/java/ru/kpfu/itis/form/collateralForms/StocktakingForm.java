package ru.kpfu.itis.form.collateralForms;

public class StocktakingForm {

    private long product;
    private long stock;
    private int quantity;

    public long getProduct() {
        return product;
    }

    public void setProduct(long product) {
        this.product = product;
    }

    public long getStock() {
        return stock;
    }

    public void setStock(long stocks) {
        this.stock = stocks;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
