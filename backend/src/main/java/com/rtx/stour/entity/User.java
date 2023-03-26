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

    @Column(name="playing")
    private Long playing;

    @ElementCollection
    @CollectionTable(
            name="owned_games",
            joinColumns = @JoinColumn(name="user_id")
    )
    @Column(name="game_id")
    private List<Long> ownedGames;

    @ElementCollection
    @CollectionTable(
            name="games_history",
            joinColumns = @JoinColumn(name="user_id")
    )
    @Column(name="game_id")
    private List<Long> history;

    @ElementCollection
    @CollectionTable(
            name="friends",
            joinColumns = @JoinColumn(name="user_id")
    )
    @Column(name="friend_id")
    private List<Long> friends;

    @ElementCollection
    @CollectionTable(
            name="friends",
            joinColumns = @JoinColumn(name="friend_id")
    )
    @Column(name="user_id")
    private List<Long> friends2;

    public User() {
    }

    public User(long id, String email, String password, String nickname, String picture, boolean moderator, Long playing, List<Long> ownedGames, List<Long> history, List<Long> friends) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.nickname = nickname;
        this.picture = picture;
        this.moderator = moderator;
        this.playing = playing;
        this.ownedGames = ownedGames;
        this.history = history;
        this.friends = friends;
        this.friends2 = friends;
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

    public Long getPlaying() {
        return playing;
    }

    public void setPlaying(Long playing) {
        this.playing = playing;
    }

    public List<Long> getOwnedGames() {
        return ownedGames;
    }

    public void setOwnedGames(List<Long> ownedGames) {
        this.ownedGames = ownedGames;
    }

    public List<Long> getHistory() {
        return history;
    }

    public void setHistory(List<Long> history) {
        this.history = history;
    }

    public List<Long> getFriends() {
        return friends;
    }

    public void setFriends(List<Long> friends) {
        this.friends = friends;
        this.friends2 = friends;
    }
}
