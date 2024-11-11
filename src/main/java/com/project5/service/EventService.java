package com.project5.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project5.model.Event;
import com.project5.repository.EventRepository;

import java.time.LocalDate;
import java.util.List;

@Service
public class EventService {
    
    @Autowired
    private EventRepository eventRepository;

    public List<Event> getAllEvents() {
        return eventRepository.findAll();
    }

    public Event getEventById(Long id) {
        return eventRepository.findById(id).orElse(null);
    }

    public Event saveEvent(Event event) {
        return eventRepository.save(event);
    }

    public void deleteEvent(Long id) {
        eventRepository.deleteById(id);
    }

    public List<Event> getUpcomingEvents() {
        return eventRepository.findByDateAfter(LocalDate.now());
    }

    public List<Event> getUpcomingEventsInNext5Days() {
        LocalDate today = LocalDate.now();
        LocalDate next5Days = today.plusDays(5);
        return eventRepository.findByDateBetween(today, next5Days);
    }
}

