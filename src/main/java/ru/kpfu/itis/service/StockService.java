package ru.kpfu.itis.service;

import org.springframework.stereotype.Service;
import ru.kpfu.itis.form.AddStockForm;
import ru.kpfu.itis.model.Stock;

import java.util.List;

@Service
public interface StockService {

    List<Stock> getAll();

    Stock getById(long id);

    void save(AddStockForm form);

    void delete(long id);
}
