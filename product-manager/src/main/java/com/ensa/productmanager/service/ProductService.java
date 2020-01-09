package com.ensa.productmanager.service;

import com.ensa.productmanager.dao.ProductDao;
import com.ensa.productmanager.domain.Product;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private ProductDao productDao;


    public List<Product> getProducts() {

        return productDao.getProducts();
    }
}
