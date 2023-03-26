package com.rtx.stour.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.Cascade;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "game")
public class Game {
    @Id
    @Column(name = "game_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "game_name")
    private String name;

    @Column(name = "game_series")
    private String series;

    @Column(name = "release_date")
    private Date releaseDate;

    @Column(name = "game_description")
    private String description;

    @ElementCollection
    @CollectionTable(
            name = "game_tags",
            joinColumns = @JoinColumn(name = "game_id")
    )
    @Column(name = "tag")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<String> tags;

    @ElementCollection
    @CollectionTable(
            name = "game_screenshots",
            joinColumns = @JoinColumn(name = "game_id")
    )
    @Column(name = "screenshot")
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<String> screenshots;

    @ManyToOne
    @JoinColumn(name = "publisher_id")
    private Publisher publisher;

    @ElementCollection
    @CollectionTable(
            name = "owned_games",
            joinColumns = @JoinColumn(name = "game_id")
    )
    @Column(name = "user_id")
    private List<Integer> owners;

    @ElementCollection
    @CollectionTable(
            name = "games_history",
            joinColumns = @JoinColumn(name = "game_id")
    )
    @Column(name = "user_id")
    private List<Integer> history;

    public Game() {
    }

    public Game(long id, String name, String series, Date releaseDate, String description, List<String> tags, List<String> screenshots, Publisher publisher) {
        this.id = id;
        this.name = name;
        this.series = series;
        this.releaseDate = releaseDate;
        this.description = description;
        this.tags = tags;
        this.screenshots = screenshots;
        this.publisher = publisher;
    }

    public Game(String name, String series, Date releaseDate, String description, List<String> tags, List<String> screenshots, Publisher publisher) {
        this.name = name;
        this.series = series;
        this.releaseDate = releaseDate;
        this.description = description;
        this.tags = tags;
        this.screenshots = screenshots;
        this.publisher = publisher;
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

    public String getSeries() {
        return series;
    }

    public void setSeries(String series) {
        this.series = series;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public List<String> getScreenshots() {
        return screenshots;
    }

    public void setScreenshots(List<String> screenshots) {
        this.screenshots = screenshots;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public List<Integer> getOwners() {
        return owners;
    }

    public void setOwners(List<Integer> owners) {
        this.owners = owners;
    }

    public List<Integer> getHistory() {
        return history;
    }

    public void setHistory(List<Integer> history) {
        this.history = history;
    }
}
