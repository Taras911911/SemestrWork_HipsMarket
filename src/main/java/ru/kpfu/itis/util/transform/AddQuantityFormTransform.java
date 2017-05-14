package ru.kpfu.itis.util.transform;

import ru.kpfu.itis.form.AddQuantityForm;
import ru.kpfu.itis.model.Stocktaking;

public class AddQuantityFormTransform {

    public static Stocktaking transform(AddQuantityForm form) {
        Stocktaking stocktaking = new Stocktaking();
        Stocktaking stocktaking_form = form.getStocktaking();
        stocktaking.setId(stocktaking_form.getId());
        stocktaking.setProduct(stocktaking_form.getProduct());
        stocktaking.setStock(stocktaking_form.getStock());
        stocktaking.setQuantity(form.getQuantity());
        return stocktaking;
    }
}
