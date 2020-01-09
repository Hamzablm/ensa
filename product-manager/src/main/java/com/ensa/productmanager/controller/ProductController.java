package com.ensa.productmanager.controller;

import com.ensa.productmanager.domain.Product;
import com.ensa.productmanager.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(value = "/listproducts", method = RequestMethod.GET)
    public List<Product> getProducts() {
        return productService.getProducts();
    }

}
