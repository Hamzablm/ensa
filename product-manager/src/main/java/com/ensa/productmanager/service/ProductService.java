package com.ensa.productmanager.service;

import com.ensa.productmanager.dao.ProductDao;
import com.ensa.productmanager.dao.ProductRepository;
import com.ensa.productmanager.domain.Product;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    private ProductRepository productRepository;


    public Iterable<Product> getAllProducts() {

        return productRepository.findAll();
    }
}
