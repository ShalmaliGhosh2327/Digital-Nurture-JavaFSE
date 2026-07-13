package com.cognizant.spring_learn.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.cognizant.spring_learn.model.Country;
import com.cognizant.spring_learn.service.CountryService;

@RestController
public class CountryController {

    CountryService service = new CountryService();

    @GetMapping("/country")
    public Country getCountry() {
        return service.getCountry("IN");
    }

    @GetMapping("/country/{code}")
    public Country getCountry(@PathVariable String code) {
        return service.getCountry(code);
    }
}