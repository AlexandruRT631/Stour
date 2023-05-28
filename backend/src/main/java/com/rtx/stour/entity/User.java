package com.rtx.stour.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="user_id")
    private long id;

    @Column(name="e_mail")
    private String email;

    @Column(name="pass")
    private String password;

    @Column(name="nickname")
    private String nickname;

    @Column(name="picture")
    private String picture;

    @Column(name="moderator")
    private boolean moderator;

    @ManyToOne
    @JoinColumn(name="playing")
    private Game playing;

    @ManyToMany
    @JoinTable(name = "owned_games",
               joinColumns = @JoinColumn(name="user_id"),
               inverseJoinColumns = @JoinColumn(name="game_id"))
    private List<Game> games;

    @ManyToMany
    @JoinTable(name="friends",
               joinColumns = @JoinColumn(name="user_id"),
               inverseJoinColumns = @JoinColumn(name="friend_id"))
    private List<User> friends;

    public User() {
    }

    public User(long id, String email, String password, String nickname, String picture, boolean moderator, Game playing, List<Game> games, List<User> friends) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.picture = picture;
        this.moderator = moderator;
        this.playing = playing;
        this.games = games;
        this.friends = friends;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Game getPlaying() {
        return playing;
    }

    public void setPlaying(Game playing) {
        this.playing = playing;
    }

    public List<Game> getGames() {
        return games;
    }

    public void setGames(List<Game> games) {
        this.games = games;
    }

    public List<User> getFriends() {
        return friends;
    }

    public void setFriends(List<User> friends) {
        this.friends = friends;
    }
}
