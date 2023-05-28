package com.rtx.stour.dto;

import com.rtx.stour.entity.Game;
import com.rtx.stour.entity.Publisher;

import java.util.List;

public class PublisherDTO {
    private Long publisherId;
    private String name;
    private String picture;
    private String description;
    private List<String> games;

    public PublisherDTO(Long publisherId, String name, String picture, String description, List<String> games) {
        this.publisherId = publisherId;
        this.name = name;
        this.picture = picture;
        this.description = description;
        this.games = games;
    }

    public PublisherDTO(Publisher publisher) {
        this.publisherId = publisher.getId();
        this.name = publisher.getName();
        this.picture = publisher.getPicture();
        this.description = publisher.getDescription();
        this.games = publisher.getGames().stream().map(Game::getName).toList();
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

    public Long getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(Long publisherId) {
        this.publisherId = publisherId;
    }
}
