package ru.kpfu.itis.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.model.Stock;

import java.util.List;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

    List<Stock> findAll();

    Stock findById(long id);

}
