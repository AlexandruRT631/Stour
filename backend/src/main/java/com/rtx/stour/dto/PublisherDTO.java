package com.rtx.stour.dto;

import java.util.List;

public class PublisherDTO {
    private String name;
    private String picture;
    private String description;
    private List<String> games;

    public PublisherDTO(String name, String picture, String description, List<String> games) {
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.games = games;
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

    public List<String> getGames() {
        return games;
    }

    public void setGames(List<String> games) {
        this.games = games;
    }
}
