package com.rtx.stour.controller;

import com.rtx.stour.dto.PublisherDTO;
import com.rtx.stour.entity.Publisher;
import com.rtx.stour.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/publishers")
@CrossOrigin
public class PublisherController {
    @Autowired
    PublisherService publisherService;

    @PostMapping("/insertPublisher")
    @ResponseBody
    public PublisherDTO insertPublisher(@RequestBody Publisher publisher) {
        return publisherService.addPublisher(publisher);
    }

    @GetMapping("/getAll")
    @ResponseBody
    public List<PublisherDTO> getAllPublishers() {
        return publisherService.retrievePublishers();
    }

    @GetMapping("/getById/{id}")
    @ResponseBody
    public PublisherDTO getPublisherById(@PathVariable Long id) {
        return publisherService.retrievePublisherById(id);
    }

    @GetMapping("/getByName/{name}")
    @ResponseBody
    public PublisherDTO getPublisherByName(@PathVariable String name) {
        return publisherService.retrievePublisherByName(name);
    }

    @PutMapping("/updatePublisher/{name}")
    @ResponseBody
    public PublisherDTO updatePublisher(@RequestBody Publisher publisher) {
        return publisherService.modifyPublisher(publisher);
    }

    @DeleteMapping("/deleteById/{id}")
    @ResponseBody
    public String deleteById(@PathVariable Long id) {
        return publisherService.deleteById(id);
    }

    @DeleteMapping("/deleteByName/{name}")
    @ResponseBody
    public String deleteByName(@PathVariable String name) {
        return publisherService.deleteByName(name);
    }
}
