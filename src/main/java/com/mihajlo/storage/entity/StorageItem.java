package com.mihajlo.storage.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "storage_item")
public class StorageItem extends Base {

    private String name;

    private String total;

    private String unitOfMesure;

    private String totalPrice;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getUnitOfMesure() {
        return unitOfMesure;
    }

    public void setUnitOfMesure(String unitOfMesure) {
        this.unitOfMesure = unitOfMesure;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }
}
