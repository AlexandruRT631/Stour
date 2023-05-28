package com.rtx.stour.service;

import com.rtx.stour.dto.PublisherDTO;
import com.rtx.stour.entity.Game;
import com.rtx.stour.entity.Publisher;
import com.rtx.stour.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PublisherService {
    @Autowired
    PublisherRepository publisherRepository;

    public List<PublisherDTO> retrievePublishers() {
        return ((List<Publisher>)publisherRepository.findAll()).stream().map(PublisherDTO::new).toList();
    }

    public PublisherDTO retrievePublisherById(Long id) {
        Optional<Publisher> publisher = publisherRepository.findById(id);
        return publisher.map(PublisherDTO::new).orElse(null);
    }

    public PublisherDTO retrievePublisherByName(String name) {
        Optional<Publisher> publisher = publisherRepository.findByName(name);
        return publisher.map(PublisherDTO::new).orElse(null);
    }

    public PublisherDTO addPublisher(Publisher publisher) {
        if (publisherRepository.findByName(publisher.getName()).isEmpty()) {
            publisher.setGames(new ArrayList<>());
            Publisher newPublisher = publisherRepository.save(publisher);
            return new PublisherDTO(newPublisher);
        }
        return null;
    }

    public PublisherDTO modifyPublisher(Publisher modifiedPublisher) {
        Optional<Publisher> oldPublisher = publisherRepository.findById(modifiedPublisher.getId());
        if(oldPublisher.isPresent()) {
            Publisher publisher = oldPublisher.get();
            if (modifiedPublisher.getEmail() != null) {
                publisher.setEmail(modifiedPublisher.getEmail());
            }
            if (modifiedPublisher.getPass() != null) {
                publisher.setPass(modifiedPublisher.getPass());
            }
            if (modifiedPublisher.getName() != null) {
                publisher.setName(modifiedPublisher.getName());
            }
            if (modifiedPublisher.getPicture() != null) {
                publisher.setPicture(modifiedPublisher.getPicture());
            }
            if (modifiedPublisher.getDescription() != null) {
                publisher.setDescription(modifiedPublisher.getDescription());
            }
            Publisher newPublisher = publisherRepository.save(publisher);
            return new PublisherDTO(newPublisher);
        }
        return null;
    }

    public String deleteById (Long id) {
        Optional<Publisher> publisher = publisherRepository.findById(id);
        if (publisher.isPresent()) {
            publisherRepository.deleteById(id);
            return "Publisher deleted";
        }
        return "Publisher not found";
    }

    public String deleteByName (String name) {
        Optional<Publisher> publisher = publisherRepository.findByName(name);
        if (publisher.isPresent()) {
            publisherRepository.deleteById(publisher.get().getId());
            return "Publisher deleted";
        }
        return "Publisher not found";
    }
}
