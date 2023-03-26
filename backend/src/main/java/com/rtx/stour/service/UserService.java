package com.rtx.stour.service;

import com.rtx.stour.dto.GameDTO;
import com.rtx.stour.dto.UserDTO;
import com.rtx.stour.entity.Game;
import com.rtx.stour.entity.User;
import com.rtx.stour.repository.GameRepository;
import com.rtx.stour.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    GameRepository gameRepository;

    private String getGameName(Long id) {
        if (id == null) {
            return null;
        }
        Optional<Game> game = gameRepository.findById(id);
        if (game.isPresent()) {
            return game.get().getName();
        } else {
            return null;
        }
    }

    public List<UserDTO> retrieveUsers() {
        return ((List<User>) userRepository.findAll()).stream().map(user -> new UserDTO(
                user.getNickname(),
                user.getPicture(),
                user.isModerator(),
                getGameName(user.getPlaying()),
                user.getOwnedGames().stream().map(gameId -> gameRepository.findById(gameId).get().getName()).toList(),
                user.getHistory().stream().map(gameId -> gameRepository.findById(gameId).get().getName()).toList(),
                user.getFriends().stream().map(friendId -> userRepository.findById(friendId).get().getNickname()).toList()
        )).toList();
    }

    private UserDTO toUserDTO(User user) {
        return new UserDTO(
                user.getNickname(),
                user.getPicture(),
                user.isModerator(),
                getGameName(user.getPlaying()),
                user.getOwnedGames().stream().map(gameId -> gameRepository.findById(gameId).get().getName()).toList(),
                user.getHistory().stream().map(gameId -> gameRepository.findById(gameId).get().getName()).toList(),
                user.getFriends().stream().map(friendId -> userRepository.findById(friendId).get().getNickname()).toList()
        );
    }

    public UserDTO retrieveUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            return toUserDTO(user.get());
        }
        return null;
    }

    public UserDTO retrieveUserByNickname(String nickname) {
        Optional<User> user = userRepository.findByNickname(nickname);
        if (user.isPresent()) {
            return toUserDTO(user.get());
        }
        return null;
    }

    public UserDTO addUser(User user) {
        if (userRepository.findByNickname(user.getNickname()).isEmpty()) {
            user.setPlaying(null);
            user.setOwnedGames(new ArrayList<>());
            user.setHistory(new ArrayList<>());
            user.setFriends(new ArrayList<>());
            User insertedUser = userRepository.save(user);
            return toUserDTO(insertedUser);
        }
        return null;
    }

    public UserDTO modifyUser(User modifiedUser, String nickname) {
        Optional<User> oldUser = userRepository.findByNickname(nickname);
        if (oldUser.isPresent()) {
            User user = oldUser.get();
            if (modifiedUser.getNickname() != null) {
                user.setNickname(modifiedUser.getNickname());
            }
            if (modifiedUser.getPicture() != null) {
                user.setPicture(modifiedUser.getPicture());
            }
            if (modifiedUser.isModerator()) {
                user.setModerator(modifiedUser.isModerator());
            }
            if (modifiedUser.getOwnedGames() != null) {
                user.setOwnedGames(modifiedUser.getOwnedGames());
                if (user.getPlaying() != null && !user.getOwnedGames().contains(user.getPlaying())) {
                    user.setPlaying(null);
                }
            }
            if (!Objects.equals(modifiedUser.getPlaying(), user.getPlaying())) {
                if (modifiedUser.getPlaying() != null && user.getOwnedGames().contains(modifiedUser.getPlaying())) {
                    user.setPlaying(modifiedUser.getPlaying());
                } else {
                    user.setPlaying(null);
                }
            }
            if (modifiedUser.getHistory() != null) {
                user.setHistory(modifiedUser.getHistory());
            }
            if (modifiedUser.getFriends() != null) {
                user.setFriends(modifiedUser.getFriends());
            }
            User newUser = userRepository.save(user);
            return toUserDTO(newUser);
        }
        return null;
    }

    public String deleteById (Long id) {
        Optional<User> user = userRepository.findById(id);
        if (user.isPresent()) {
            userRepository.deleteById(id);
            return "User deleted";
        }
        return "User not found";
    }

    public String deleteByNickname (String nickname) {
        Optional<User> user = userRepository.findByNickname(nickname);
        if (user.isPresent()) {
            userRepository.deleteById(user.get().getId());
            return "User deleted";
        }
        return "User not found";
    }
}
