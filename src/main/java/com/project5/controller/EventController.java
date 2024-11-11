package com.project5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project5.model.Event;
import com.project5.model.Venue;
import com.project5.service.EventService;
import com.project5.service.UserService;
import com.project5.service.VenueService;

import java.util.List;

@Controller
@RequestMapping("/events")
public class EventController {

    @Autowired
    private EventService eventService;

    @Autowired
    private VenueService venueService;

    @Autowired
    private UserService userService;

    @GetMapping
    public String listEvents(Model model) {
        model.addAttribute("events", eventService.getAllEvents());
        return "events";
    }

    @GetMapping("/new")
    public String createEventForm(Model model) {
        model.addAttribute("event", new Event());
        model.addAttribute("venues", venueService.getAllVenues());
        return "event-form";
    }

    @PostMapping
    public String saveEvent(@ModelAttribute Event event, @RequestParam("venue.id") Long venueId) {
        if (venueId != null) {
            Venue venue = venueService.getVenueById(venueId);
            event.setVenue(venue);
        }
        eventService.saveEvent(event);
        return "redirect:/events";
    }


    @GetMapping("/edit/{id}")
    public String editEventForm(@PathVariable Long id, Model model) {
        model.addAttribute("event", eventService.getEventById(id));
        model.addAttribute("venues", venueService.getAllVenues());
        return "event-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteEvent(@PathVariable Long id) {
        eventService.deleteEvent(id);
        return "redirect:/events";
    }

    @GetMapping("/calendar")
    public String viewCalendar(Model model) {
        model.addAttribute("upcomingEvents", eventService.getUpcomingEventsInNext5Days());
        return "calendar";
    }
}

