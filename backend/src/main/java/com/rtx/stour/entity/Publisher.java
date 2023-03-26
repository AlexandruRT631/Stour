package com.rtx.stour.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.Cascade;

import java.util.List;

@Entity
@Table(name = "publisher")
public class Publisher {
    @Id
    @Column(name = "publisher_id")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private long id;

    @Column(name = "e_mail")
    private String email;

    @Column(name = "pass")
    private String pass;

    @Column(name = "publisher_name")
    private String name;

    @Column(name = "picture")
    private String picture;

    @Column(name = "publisher_description")
    private String description;

    @OneToMany(mappedBy = "publisher", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Game> games;

    public Publisher() {
    }

    public Publisher(long id, String email, String pass, String name, String picture, String description, List<Game> games) {
        this.id = id;
        this.email = email;
        this.pass = pass;
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.games = games;
    }

    public Publisher(String email, String pass, String name, String picture, String description, List<Game> games) {
        this.email = email;
        this.pass = pass;
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.games = games;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Game> getGames() {
        return games;
    }

    public void setGames(List<Game> games) {
        this.games = games;
    }
}
