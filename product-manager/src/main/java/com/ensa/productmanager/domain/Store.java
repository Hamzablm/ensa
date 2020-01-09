package com.ensa.productmanager.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Store {
    @Id
    @GeneratedValue
    private long id;

    @Column
    private String name;
    @Column
    private String url;
    @Column
    private String totalRating;

    public Store() {
    }

    public Store(long id, String name, String url, String totalRating) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.totalRating = totalRating;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTotalRating() {
        return totalRating;
    }

    public void setTotalRating(String totalRating) {
        this.totalRating = totalRating;
    }

    @Override
    public String toString() {
        return "Store{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", totalRating='" + totalRating + '\'' +
                '}';
    }
}
