package ru.kpfu.itis.util.transform;

import ru.kpfu.itis.form.AddStockForm;
import ru.kpfu.itis.model.Stock;

public class AddStockFormTransform {

    public static Stock transform(AddStockForm form) {
        Stock stock = new Stock();
        stock.setCity(form.getCity());
        stock.setStreet(form.getStreet());
        return stock;
    }
}
