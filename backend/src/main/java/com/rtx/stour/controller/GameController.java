package com.rtx.stour.controller;

import com.rtx.stour.dto.GameDTO;
import com.rtx.stour.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/games")
public class GameController {
    @Autowired
    GameService gameService;

    @PostMapping("/insertGame")
    @ResponseBody
    public GameDTO insertGame(@RequestBody GameDTO gameDTO) {
        return gameService.addGame(gameDTO);
    }

    @GetMapping("/getAll")
    @ResponseBody
    public List<GameDTO> getAllGames() {
        return gameService.retrieveGames();
    }

    @GetMapping("/getById/{id}")
    @ResponseBody
    public GameDTO getGameById(@PathVariable Long id) {
        return gameService.retrieveGameById(id);
    }

    @GetMapping("/getByName/{name}")
    @ResponseBody
    public GameDTO getGameByName(@PathVariable String name) {
        return gameService.retrieveGameByName(name);
    }

    @PutMapping("/updateGame/{name}")
    @ResponseBody
    public GameDTO updateGame(@RequestBody GameDTO gameDTO, @PathVariable String name) {
        return gameService.modifyGame(gameDTO, name);
    }

    @DeleteMapping("/deleteById/{id}")
    @ResponseBody
    public String deleteById(@PathVariable Long id) {
        return gameService.deleteById(id);
    }

    @DeleteMapping("/deleteByName/{name}")
    @ResponseBody
    public String deleteByName(@PathVariable String name) {
        return gameService.deleteByName(name);
    }
}
