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
        return game.map(Game::getName).orElse(null);
    }

    public List<UserDTO> retrieveUsers() {
        return ((List<User>) userRepository.findAll()).stream().map(UserDTO::new).toList();
    }

    public UserDTO retrieveUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.map(UserDTO::new).orElse(null);
    }

    public UserDTO retrieveUserByNickname(String nickname) {
        Optional<User> user = userRepository.findByNickname(nickname);
        return user.map(UserDTO::new).orElse(null);
    }

    public UserDTO addUser(User user) {
        if (userRepository.findByNickname(user.getNickname()).isEmpty()) {
            user.setPlaying(null);
            user.setGames(new ArrayList<>());
            user.setFriends(new ArrayList<>());
            User insertedUser = userRepository.save(user);
            return new UserDTO(insertedUser);
        }
        return null;
    }

    public UserDTO modifyUser(User modifiedUser) {
        Optional<User> oldUser = userRepository.findById(modifiedUser.getId());
        if (oldUser.isPresent()) {
            User user = oldUser.get();
            if (modifiedUser.getEmail() != null) {
                user.setEmail(modifiedUser.getEmail());
            }
            if (modifiedUser.getNickname() != null) {
                user.setNickname(modifiedUser.getNickname());
            }
            if (modifiedUser.getPassword() != null) {
                user.setPassword(modifiedUser.getPassword());
            }
            if (modifiedUser.getPicture() != null) {
                user.setPicture(modifiedUser.getPicture());
            }
            if (modifiedUser.isModerator()) {
                user.setModerator(modifiedUser.isModerator());
            }
            User newUser = userRepository.save(user);
            return new UserDTO(newUser);
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
