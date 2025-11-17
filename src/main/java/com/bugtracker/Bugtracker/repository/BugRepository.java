package com.bugtracker.Bugtracker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bugtracker.Bugtracker.model.Bug;

public interface BugRepository extends JpaRepository<Bug, Integer> {

}
