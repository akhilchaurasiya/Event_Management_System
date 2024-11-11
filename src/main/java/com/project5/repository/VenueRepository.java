package com.project5.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project5.model.Venue;

public interface VenueRepository extends JpaRepository<Venue, Long> {}

