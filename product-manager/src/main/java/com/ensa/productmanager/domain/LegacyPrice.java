package com.ensa.productmanager.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "legacy_price", schema = "public")
public class LegacyPrice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_price")
    private long id;
    @Column(name = "new_price")
    private String newPrice;
    @Column
    private Date date;
    @OneToOne
    @JoinColumn(name = "id_product")
    private Product product;
    @OneToOne
    @JoinColumn(name = "id_category")
    private Category category;
    @OneToOne
    @JoinColumn(name = "id_store")
    private Store store;

    public LegacyPrice() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(String newPrice) {
        this.newPrice = newPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "LegacyPrice{" +
                "id=" + id +
                ", newPrice='" + newPrice + '\'' +
                ", date='" + date + '\'' +
                ", product=" + product +
                ", category=" + category +
                ", store=" + store +
                '}';
    }
}
