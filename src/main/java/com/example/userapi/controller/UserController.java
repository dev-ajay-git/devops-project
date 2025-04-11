package com.example.userapi.controller;

import com.example.userapi.model.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    // Sample endpoint to fetch a user (GET request)
    @GetMapping("/user")
    public User getUser() {
        return new User("John Doe", "john.doe@example.com");
    }

    // Sample endpoint to create a user (POST request)
    @PostMapping("/user")
    public User createUser(@RequestBody User user) {
        // Here we would typically save the user to a database
        return user;  // Return the user that was sent in the POST request
    }
}
