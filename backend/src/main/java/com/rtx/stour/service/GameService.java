package com.rtx.stour.service;

import com.rtx.stour.dto.GameDTO;
import com.rtx.stour.entity.Game;
import com.rtx.stour.repository.GameRepository;
import com.rtx.stour.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GameService {
    @Autowired
    GameRepository gameRepository;

    @Autowired
    PublisherRepository publisherRepository;

    public List<GameDTO> retrieveGames() {
        return ((List<Game>) gameRepository.findAll()).stream().map(game -> new GameDTO(game.getName(), game.getSeries(), game.getReleaseDate(), game.getDescription(), game.getTags(), game.getScreenshots(), game.getPublisher().getName())).toList();
    }

    public GameDTO retrieveGameById(Long id) {
        Optional<Game> game = gameRepository.findById(id);
        if (game.isPresent()) {
            return new GameDTO(game.get().getName(), game.get().getSeries(), game.get().getReleaseDate(), game.get().getDescription(), game.get().getTags(), game.get().getScreenshots(), game.get().getPublisher().getName());
        } else {
            return null;
        }
    }

    public GameDTO retrieveGameByName(String name) {
        Optional<Game> game = gameRepository.findByName(name);
        if (game.isPresent()) {
            return new GameDTO(game.get().getName(), game.get().getSeries(), game.get().getReleaseDate(), game.get().getDescription(), game.get().getTags(), game.get().getScreenshots(), game.get().getPublisher().getName());
        } else {
            return null;
        }
    }

    public GameDTO addGame(GameDTO gameDTO) {
        if (gameRepository.findByName(gameDTO.getName()).isEmpty()) {
            Game insertedGame = gameRepository.save(new Game(gameDTO.getName(), gameDTO.getSeries(), gameDTO.getReleaseDate(), gameDTO.getDescription(), gameDTO.getTags(), gameDTO.getScreenshots(), publisherRepository.findByName(gameDTO.getPublisher()).get()));
            return new GameDTO(insertedGame.getName(), insertedGame.getSeries(), insertedGame.getReleaseDate(), insertedGame.getDescription(), insertedGame.getTags(), insertedGame.getScreenshots(), insertedGame.getPublisher().getName());
        }
        return null;
    }

    public GameDTO modifyGame(GameDTO gameDTO, String name) {
        Optional<Game> oldGame = gameRepository.findByName(name);
        if(oldGame.isPresent()) {
            Game game = oldGame.get();
            if (gameDTO.getName() != null) {
                game.setName(gameDTO.getName());
            }
            if (gameDTO.getSeries() != null) {
                game.setSeries(gameDTO.getSeries());
            }
            if (gameDTO.getReleaseDate() != null) {
                game.setReleaseDate(gameDTO.getReleaseDate());
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
                game.setPublisher(publisherRepository.findByName(gameDTO.getPublisher()).get());
            }
            Game newGame = gameRepository.save(game);
            return new GameDTO(newGame.getName(), newGame.getSeries(), newGame.getReleaseDate(), newGame.getDescription(), newGame.getTags(), newGame.getScreenshots(), newGame.getPublisher().getName());
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
