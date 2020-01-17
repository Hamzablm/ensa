package com.ensa.productmanager.service;

import com.ensa.productmanager.dao.LegacyPriceRepository;
import com.ensa.productmanager.dao.ProductRepository;
import com.ensa.productmanager.domain.Category;
import com.ensa.productmanager.domain.LegacyPrice;
import com.ensa.productmanager.domain.Product;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final LegacyPriceRepository legacyPriceRepository;

    public ProductService(ProductRepository productRepository, LegacyPriceRepository legacyPriceRepository) {
        this.productRepository = productRepository;
        this.legacyPriceRepository = legacyPriceRepository;
    }


    public Iterable<Product> findAllProducts() {
        return productRepository.findAll();
    }

    public Iterable<LegacyPrice> findAllLegacyPrice() {
        return legacyPriceRepository.findAll();
    }

    public Optional<Product> findById(long id) {
        return productRepository.findById(id);
    }

    public List<Product> findProductsByCategory(long id) {
        // TODO  query Products by category id
        List<Product> products = productRepository.findProductsByCategoryId(id);
        return products;
    }
}
