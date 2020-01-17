package com.ensa.productmanager.controller;

import com.ensa.productmanager.domain.Category;
import com.ensa.productmanager.domain.LegacyPrice;
import com.ensa.productmanager.domain.Product;
import com.ensa.productmanager.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.util.*;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @CrossOrigin(origins = "http://localhost:63342")
    @GetMapping("/api/products")
    public ResponseEntity<List<Product>> findAllProducts() {
        Iterable<Product> IterableProducts = productService.findAllProducts();
        List<Product> allProducts = new ArrayList<>();
        for (Product product : IterableProducts) {
            allProducts.add(product);
        }
        return new ResponseEntity<>(allProducts, HttpStatus.OK);
    }

    @CrossOrigin(origins = "http://localhost:63342")
    @PostMapping("/api/products")
    public ResponseEntity<Product> findProductById(@RequestParam("id") long id) {
        Optional<Product> productOptional = productService.findById(id);
        return ResponseEntity.of(productOptional);
    }


    @CrossOrigin(origins = "http://localhost:63342")
    @GetMapping(value = "/api/legacyProducts")
    public ResponseEntity<List<LegacyPrice>> findLegacyProducts(@RequestParam(required = false) String strategy) {
        Iterable<LegacyPrice> allLegacyPrice = productService.findAllLegacyPrice();
        List<LegacyPrice> legacyPriceList = new ArrayList<>();
        allLegacyPrice.forEach(legacyPriceList::add);
        if (strategy != null && strategy.equals("price")) {
            Comparator<LegacyPrice> cmp = Comparator.comparingInt(legacyPrice ->
                    Integer.parseInt(legacyPrice.getNewPrice()));
            legacyPriceList.sort(cmp);
        }
        return ResponseEntity.ok(legacyPriceList);
    }

    @CrossOrigin(origins = "http://localhost:63342")
    @GetMapping("/refresh")
    public ResponseEntity<List<Product>> refreshDatabase() {
        //TODO: scrap products and stores
        return new ResponseEntity<>(null, HttpStatus.OK);
    }

    @CrossOrigin(origins = "http://localhost:63342")
    @PostMapping("/api/productsByCategory")
    public ResponseEntity<List<Product>> findProductsByCategory(@RequestParam("id") long id) {
        List<Product> productsByCategory = productService.findProductsByCategory(id);
        return ResponseEntity.of(Optional.of(productsByCategory));
    }
}
