package com.mihajlo.storage.entity;

import com.mihajlo.storage.entity.base.Base;
import javax.persistence.*;

@Entity
@Table(name = "storage_user")
public class User extends Base {

    private String name;

    @Column(unique = true)
    private String email;

    private String password;

    @Column(length = 1200)
    private String image;

    @ManyToOne
    @JoinColumn(name ="id_role")
    private Role role;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
