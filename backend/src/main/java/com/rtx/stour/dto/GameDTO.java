package com.rtx.stour.dto;

import com.rtx.stour.entity.Game;

import java.util.Date;
import java.util.List;

public class GameDTO {
    private Long gameId;
    private String name;
    private String series;
    private Date releaseDate;
    private String description;
    private List<String> tags;
    private List<String> screenshots;
    private String publisher;

    public GameDTO() {
    }

    public GameDTO(Long gameId, String name, String series, Date releaseDate, String description, List<String> tags, List<String> screenshots, String publisher) {
        this.gameId = gameId;
        this.name = name;
        this.series = series;
        this.releaseDate = releaseDate;
        this.description = description;
        this.tags = tags;
        this.screenshots = screenshots;
        this.publisher = publisher;
    }

    public GameDTO(Game game) {
        this.gameId = game.getId();
        this.name = game.getName();
        this.series = game.getSeries();
        this.releaseDate = game.getReleaseDate();
        this.description = game.getDescription();
        this.tags = game.getTags();
        this.screenshots = game.getScreenshots();
        this.publisher = game.getPublisher().getName();
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

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Long getGameId() {
        return gameId;
    }

    public void setGameId(Long gameId) {
        this.gameId = gameId;
    }

    public void replaceNullFields(GameDTO gameDTO) {
        if (this.name == null) {
            this.name = gameDTO.getName();
        }
        if (this.series == null) {
            this.series = gameDTO.getSeries();
        }
        if (this.releaseDate == null) {
            this.releaseDate = gameDTO.getReleaseDate();
        }
        if (this.description == null) {
            this.description = gameDTO.getDescription();
        }
        if (this.tags == null) {
            this.tags = gameDTO.getTags();
        }
        if (this.screenshots == null) {
            this.screenshots = gameDTO.getScreenshots();
        }
        if (this.publisher == null) {
            this.publisher = gameDTO.getPublisher();
        }
    }
}
