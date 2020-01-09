package com.ensa.productmanager.domain;

import javax.persistence.*;

@Entity
public class LegacyPrice {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private long id;
    @Column
    private int newPrice;
    @Column
    private String date;

    public LegacyPrice() {
    }

    public LegacyPrice(long id, int newPrice, String date) {
        this.id = id;
        this.newPrice = newPrice;
        this.date = date;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(int newPrice) {
        this.newPrice = newPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "LegacyPrice{" +
                "id=" + id +
                ", newPrice=" + newPrice +
                ", date='" + date + '\'' +
                '}';
    }
}
