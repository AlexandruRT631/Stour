package com.rtx.stour.service;

import com.rtx.stour.dto.GameDTO;
import com.rtx.stour.entity.Game;
import com.rtx.stour.entity.Publisher;
import com.rtx.stour.repository.GameRepository;
import com.rtx.stour.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class GameService {
    @Autowired
    GameRepository gameRepository;

    @Autowired
    PublisherRepository publisherRepository;

    public List<GameDTO> retrieveGames() {
        return ((List<Game>) gameRepository.findAll()).stream().map(GameDTO::new).toList();
    }

    public GameDTO retrieveGameById(Long id) {
        Optional<Game> game = gameRepository.findById(id);
        return game.map(GameDTO::new).orElse(null);
    }

    public GameDTO retrieveGameByName(String name) {
        Optional<Game> game = gameRepository.findByName(name);
        return game.map(GameDTO::new).orElse(null);
    }

    public GameDTO addGame(GameDTO gameDTO) {
        if (gameRepository.findByName(gameDTO.getName()).isEmpty()) {
            Game newGame = new Game();
            newGame.setName(gameDTO.getName());
            newGame.setSeries(gameDTO.getSeries());
            newGame.setReleaseDate(new Date());
            newGame.setDescription(gameDTO.getDescription());
            newGame.setTags(gameDTO.getTags());
            newGame.setScreenshots(gameDTO.getScreenshots());
            Optional<Publisher> publisherGet = publisherRepository.findByName(gameDTO.getName());
            if (publisherGet.isPresent()) {
                newGame.setPublisher(publisherGet.get());
            }
            else {
                return null;
            }
            newGame.setOwners(new ArrayList<>());
            newGame.setCurrentlyPlaying(new ArrayList<>());
            Game insertedGame = gameRepository.save(newGame);
            return new GameDTO(insertedGame);
        }
        return null;
    }

    public GameDTO modifyGame(GameDTO gameDTO) {
        Optional<Game> oldGame = gameRepository.findById(gameDTO.getGameId());
        if(oldGame.isPresent()) {
            Game game = oldGame.get();
            if (gameDTO.getName() != null) {
                game.setName(gameDTO.getName());
            }
            if (gameDTO.getSeries() != null) {
                game.setSeries(gameDTO.getSeries());
            }
            if (gameDTO.getDescription() != null) {
                game.setDescription(gameDTO.getDescription());
            }
            if (gameDTO.getTags() != null) {
                game.setTags(gameDTO.getTags());
            }
            if (gameDTO.getScreenshots() != null) {
                game.setScreenshots(gameDTO.getScreenshots());
            }
            if (gameDTO.getPublisher() != null) {
                Optional<Publisher> publisherGet = publisherRepository.findByName(gameDTO.getPublisher());
                if (publisherGet.isPresent()) {
                    game.setPublisher(publisherGet.get());
                }
                else return null;
            }
            Game newGame = gameRepository.save(game);
            return new GameDTO(newGame);
        }
        return null;
    }

    public String deleteById(Long id) {
        Optional<Game> game = gameRepository.findById(id);
        if (game.isPresent()) {
            gameRepository.deleteById(id);
            return "Game deleted";
        } else {
            return "Game not found";
        }
    }

    public String deleteByName(String name) {
        Optional<Game> game = gameRepository.findByName(name);
        if (game.isPresent()) {
            gameRepository.deleteById(game.get().getId());
            return "Game deleted";
        } else {
            return "Game not found";
        }
    }
}
