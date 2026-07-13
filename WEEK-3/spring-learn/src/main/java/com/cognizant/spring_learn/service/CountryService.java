package com.cognizant.spring_learn.service;

import com.cognizant.spring_learn.model.Country;

public class CountryService {

    public Country getCountry(String code) {

        Country country = new Country();

        if (code.equalsIgnoreCase("IN")) {
            country.setCode("IN");
            country.setName("India");
        } else if (code.equalsIgnoreCase("US")) {
            country.setCode("US");
            country.setName("United States");
        } else if (code.equalsIgnoreCase("JP")) {
            country.setCode("JP");
            country.setName("Japan");
        } else {
            country.setCode(code.toUpperCase());
            country.setName("Country Not Found");
        }

        return country;
    }
}