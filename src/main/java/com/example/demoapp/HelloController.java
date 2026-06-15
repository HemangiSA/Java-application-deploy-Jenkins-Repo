package com.example.demoapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "Java application deployed successfully using Jenkins on AWS!";
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello from Jenkins CI/CD pipeline!";
    }
}
