package com.rtx.stour.dto;

import java.util.List;

public class UserDTO {
    private String nickname;
    private String picture;
    private boolean moderator;
    private String playing;
    private List<String> ownedGames;
    private List<String> history;
    private List<String> friends;

    public UserDTO(String nickname, String picture, boolean moderator, String playing, List<String> ownedGames, List<String> history, List<String> friends) {
        this.nickname = nickname;
        this.picture = picture;
        this.moderator = moderator;
        this.playing = playing;
        this.ownedGames = ownedGames;
        this.history = history;
        this.friends = friends;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public boolean isModerator() {
        return moderator;
    }

    public void setModerator(boolean moderator) {
        this.moderator = moderator;
    }

    public String getPlaying() {
        return playing;
    }

    public void setPlaying(String playing) {
        this.playing = playing;
    }

    public List<String> getOwnedGames() {
        return ownedGames;
    }

    public void setOwnedGames(List<String> ownedGames) {
        this.ownedGames = ownedGames;
    }

    public List<String> getHistory() {
        return history;
    }

    public void setHistory(List<String> history) {
        this.history = history;
    }

    public List<String> getFriends() {
        return friends;
    }

    public void setFriends(List<String> friends) {
        this.friends = friends;
    }
}
