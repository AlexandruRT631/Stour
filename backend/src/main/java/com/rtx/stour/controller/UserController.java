package com.rtx.stour.controller;

import com.rtx.stour.dto.UserDTO;
import com.rtx.stour.entity.User;
import com.rtx.stour.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping("/insertUser")
    @ResponseBody
    public UserDTO insertUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    @GetMapping("/getAll")
    @ResponseBody
    public List<UserDTO> getAllUsers() {
        return userService.retrieveUsers();
    }

    @GetMapping("/getById/{id}")
    @ResponseBody
    public UserDTO getUserById(@PathVariable Long id) {
        return userService.retrieveUserById(id);
    }

    @GetMapping("/getByNickname/{nickname}")
    @ResponseBody
    public UserDTO getUserByName(@PathVariable String nickname) {
        return userService.retrieveUserByNickname(nickname);
    }

    @PutMapping("/updateUser/{nickname}")
    @ResponseBody
    public UserDTO updateUser(@RequestBody User user, @PathVariable String nickname) {
        return userService.modifyUser(user, nickname);
    }

    @DeleteMapping("/deleteById/{id}")
    @ResponseBody
    public String deleteById(@PathVariable Long id) {
        return userService.deleteById(id);
    }

    @DeleteMapping("/deleteByNickname/{nickname}")
    @ResponseBody
    public String deleteByNickname(@PathVariable String nickname) {
        return userService.deleteByNickname(nickname);
    }
}
