/*
package com.example.easyhirepro.controller;

import com.example.easyhirepro.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobSeekerController {

    @Autowired
    private JobRepository jobRepo;

    @GetMapping("/jobs")
    public String viewAllJobs(Model model) {
        model.addAttribute("jobs", jobRepo.findAll());
        return "user/jobs";  // return the JSP page
    }
}
*/