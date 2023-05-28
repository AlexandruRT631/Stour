package com.rtx.stour.dto;

import com.rtx.stour.entity.Game;
import com.rtx.stour.entity.User;

import java.util.List;

public class UserDTO {
    private Long userId;
    private String nickname;
    private String picture;
    private boolean moderator;
    private String playing;
    private List<String> ownedGames;
    private List<String> friends;

    public UserDTO(Long userId, String nickname, String picture, boolean moderator, String playing, List<String> ownedGames, List<String> friends) {
        this.userId = userId;
        this.nickname = nickname;
        this.picture = picture;
        this.moderator = moderator;
        this.playing = playing;
        this.ownedGames = ownedGames;
        this.friends = friends;
    }

    public UserDTO(User user) {
        this.userId = user.getId();
        this.nickname = user.getNickname();
        this.picture = user.getPicture();
        this.moderator = user.isModerator();
        if (user.getPlaying() == null) {
            this.playing = null;
        }
        else {
            this.playing = user.getPlaying().getName();
        }
        this.ownedGames = user.getGames().stream().map(Game::getName).toList();
        this.friends = user.getFriends().stream().map(User::getNickname).toList();
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

    public List<String> getFriends() {
        return friends;
    }

    public void setFriends(List<String> friends) {
        this.friends = friends;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
