package com.example.easyhirepro.repository;

import com.example.easyhirepro.entity.Job;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobRepository extends JpaRepository<Job, Long> {
}
