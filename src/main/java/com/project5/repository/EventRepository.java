package com.project5.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project5.model.Event;

public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByDateAfter(LocalDate date); // For calendar view
    List<Event> findByDateBetween(LocalDate startDate, LocalDate endDate);
}
