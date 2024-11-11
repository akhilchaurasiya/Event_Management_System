package com.project5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.project5.model.User;
import com.project5.model.Event; // Import Event model
import com.project5.service.UserService;
import com.project5.service.EventService; // Assume you have this service for event operations
import com.project5.service.EmailService;
import jakarta.mail.MessagingException;

import java.util.List;

@Controller
@RequestMapping("/attendees")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private EventService eventService; // New service to manage events

    @Autowired
    private EmailService emailService;

    @GetMapping
    public String listAttendees(Model model) {
        model.addAttribute("attendees", userService.getAllUsers());
        return "attendees";
    }

    @GetMapping("/new")
    public String createAttendeeForm(Model model) {
        model.addAttribute("attendee", new User());
        List<Event> events = eventService.getAllEvents(); // Fetch all events
        model.addAttribute("events", events); // Pass events to the form
        return "attendee-form";
    }

    @PostMapping
    public String saveAttendee(@ModelAttribute User attendee, @RequestParam(required = false) Long eventId, Model model) {
        User existingAttendee = (attendee.getId() != null) ? userService.getUserById(attendee.getId()) : new User();

        for (Event event : existingAttendee.getEvents()) {
            event.getParticipants().remove(existingAttendee);
        }
        existingAttendee.getEvents().clear();

        existingAttendee.setUsername(attendee.getUsername());
        existingAttendee.setEmail(attendee.getEmail());

        if (eventId != null) {
            Event newEvent = eventService.getEventById(eventId);
            if (newEvent != null) {
                existingAttendee.getEvents().add(newEvent);
                newEvent.getParticipants().add(existingAttendee);

                // Send the email notification
                try {
                    emailService.sendRegistrationEmail(existingAttendee.getEmail(), existingAttendee.getUsername(), newEvent.getName());
                } catch (MessagingException e) {
                    model.addAttribute("error", "Failed to send confirmation email.");
                }
            }
        }

        userService.saveUser(existingAttendee);

        return "redirect:/attendees";
    }

    @GetMapping("/edit/{id}")
    public String editAttendeeForm(@PathVariable Long id, Model model) {
        User attendee = userService.getUserById(id);
        model.addAttribute("attendee", attendee);

        // Fetch all events
        List<Event> events = eventService.getAllEvents(); 
        model.addAttribute("events", events);

        return "attendee-form"; // Return the form to edit attendee
    }


    @GetMapping("/delete/{id}")
    public String deleteAttendee(@PathVariable Long id) {
        User attendee = userService.getUserById(id); // Fetch the attendee

        if (attendee != null) {
            // Remove the attendee from associated events
            for (Event event : attendee.getEvents()) {
                event.getParticipants().remove(attendee); // Remove attendee from the event's participants
            }

            // Clear the attendee's events to prevent orphaned associations
            attendee.getEvents().clear(); 

            userService.deleteUser(id); // Now delete the attendee
        }

        return "redirect:/attendees"; // Redirect to the attendees list
    }

}
