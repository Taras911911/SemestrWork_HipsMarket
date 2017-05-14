package ru.kpfu.itis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.form.AddStockForm;
import ru.kpfu.itis.model.Stock;
import ru.kpfu.itis.repository.StockRepository;
import ru.kpfu.itis.service.StockService;
import ru.kpfu.itis.util.transform.AddStockFormTransform;

import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockRepository stockRepository;

    @Override
    public List<Stock> getAll() {
        return stockRepository.findAll();
    }

    @Override
    public Stock getById(long id) {
        return stockRepository.findById(id);
    }

    @Override
    public void save(AddStockForm form) {
        Stock stock = AddStockFormTransform.transform(form);
        stockRepository.save(stock);
    }

    @Override
    public void delete(long id) {
        stockRepository.delete(id);
    }
}
