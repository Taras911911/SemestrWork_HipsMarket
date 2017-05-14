package ru.kpfu.itis.form;

import org.springframework.security.access.method.P;
import ru.kpfu.itis.model.Product;
import ru.kpfu.itis.model.Stock;
import ru.kpfu.itis.service.ProductService;
import ru.kpfu.itis.service.StockService;
import ru.kpfu.itis.service.impl.ProductServiceImpl;
import ru.kpfu.itis.service.impl.StockServiceImpl;

public class AddStocktakingForm {

    private Product product;
    private Stock stock;
    private int quantity;

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
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
