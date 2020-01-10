package com.ensa.productmanager.controller;

import com.ensa.productmanager.domain.Product;
import com.ensa.productmanager.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/api/products")
    public ResponseEntity<List<Product>> findAllProducts() {
        Iterable<Product> IterableProducts = productService.findAllProducts();
        List<Product> allProducts = new ArrayList<>();
        for (Product product : IterableProducts) {
            allProducts.add(product);
        }
        return new ResponseEntity<>(allProducts, HttpStatus.OK);
    }

    @PostMapping("/api/products")
    public ResponseEntity<Product> findProductById(@RequestParam("id") long id) {
        Optional<Product> productOptional = productService.findById(id);
        return ResponseEntity.of(productOptional);
    }

    // TODO: We want data a sat
    @GetMapping("/api/legacyProducts")
    public ResponseEntity<List<Product>> findLegacyProducts() {

        return ResponseEntity.ok(null);
    }

    @GetMapping("/refresh")
    public ResponseEntity<List<Product>> refreshDatabase() {
        //TODO: scrap products and stores
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
