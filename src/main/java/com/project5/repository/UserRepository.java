package com.project5.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project5.model.User;

public interface UserRepository extends JpaRepository<User, Long> {}

