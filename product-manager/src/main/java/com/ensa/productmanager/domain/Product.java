package com.ensa.productmanager.domain;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

// TODO implement natual ordering comparison
@Entity
@Table(name = "product", schema = "public")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_product")
    private long id;
    @Column
    private String name;
    @Column
    private int sales;
    @Column(name = "total_rating")
    private String Rating;
    @Column(name = "date_product")
    private String date;
    @Column(name = "url_image")
    private String imageUrl;
    @Column(name = "url_product")
    private String productUrl;
    @OneToMany
    @JoinColumn(name = "id_store")
    private List<Store> stores;
    @OneToOne
    @JoinColumn(name = "id_category")
    private Category category;

    //todo:add of abdo
    @OneToMany
    @JoinColumn(name = "price")
    private List<LegacyPrice> price;
    //

    public Product() {
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Store> getStores() {
        return stores;
    }

    public void setStores(List<Store> stores) {
        this.stores = stores;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public String getRating() {
        return Rating;
    }

    public void setRating(String rating) {
        Rating = rating;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    //todo:add of abdo

    public List<LegacyPrice> getPrice() {
        return price;
    }

    public void setPrice(List<LegacyPrice> price) {
        this.price = price;
    }

    //

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sales=" + sales +
                ", Rating='" + Rating + '\'' +
                ", date=" + date +
                ", imageUrl='" + imageUrl + '\'' +
                ", productUrl='" + productUrl + '\'' +
                ", stores=" + stores +
                ", category=" + category +
                ", price=" + price +
                '}';
    }
}
