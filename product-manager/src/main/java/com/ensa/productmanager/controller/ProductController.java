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

    @RequestMapping(value = "/listproducts", method = RequestMethod.GET)
    public ResponseEntity<List<Product>> getProducts() {
        Iterable<Product> IterableProducts = productService.getAllProducts();
        List<Product> allProducts = new ArrayList<>();
        for (Product product : IterableProducts) {
            allProducts.add(product);
        }
        ResponseEntity<List<Product>> responseEntity = new ResponseEntity<List<Product>>(allProducts, HttpStatus.OK);
        return responseEntity;
    }

    @RequestMapping
    public Product getProductById(@PathVariable long id) {

        return null;
    }


}
