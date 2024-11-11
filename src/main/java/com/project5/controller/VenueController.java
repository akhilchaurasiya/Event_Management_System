package com.project5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project5.model.Venue;
import com.project5.service.VenueService;

@Controller
@RequestMapping("/venues")
public class VenueController {

    @Autowired
    private VenueService venueService;

    @GetMapping
    public String listVenues(Model model) {
        model.addAttribute("venues", venueService.getAllVenues());
        return "venues";
    }

    @GetMapping("/new")
    public String createVenueForm(Model model) {
        model.addAttribute("venue", new Venue());
        return "venue-form";
    }

    @PostMapping
    public String saveVenue(@ModelAttribute Venue venue) {
        venueService.saveVenue(venue);
        return "redirect:/venues";
    }

    @GetMapping("/edit/{id}")
    public String editVenueForm(@PathVariable Long id, Model model) {
        model.addAttribute("venue", venueService.getVenueById(id));
        return "venue-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteVenue(@PathVariable Long id) {
        venueService.deleteVenue(id);
        return "redirect:/venues";
    }
}

