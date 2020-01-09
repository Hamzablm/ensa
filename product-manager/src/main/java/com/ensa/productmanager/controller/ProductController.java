package com.ensa.productmanager.controller;

import com.ensa.productmanager.domain.Product;
import com.ensa.productmanager.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public ResponseEntity<List<Product>> getProducts() {
        Iterable<Product> IterableProducts = productService.getAllProducts();
        List<Product> allProducts = new ArrayList<>();
        for (Product product : IterableProducts) {
            allProducts.add(product);
        }
        return new ResponseEntity<>(allProducts, HttpStatus.OK);
    }

    @RequestMapping
    public Product getProductById(@PathVariable long id) {

        return null;
    }

    @GetMapping("/legacyProducts")
    public ResponseEntity<List<Product>> getLegacyProducts() {

}
