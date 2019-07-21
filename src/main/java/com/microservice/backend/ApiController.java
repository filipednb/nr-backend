package com.microservice.backend;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ApiController {

    @GetMapping("/")
    public String helloFromBackend() throws InterruptedException{

        Thread.sleep(100 + new Random().nextInt(500));

        return "Olá mundo from docker";
    }


}
