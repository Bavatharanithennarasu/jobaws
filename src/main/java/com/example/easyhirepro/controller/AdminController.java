package com.example.easyhirepro.controller;

import com.example.easyhirepro.entity.Job;
import org.springframework.transaction.annotation.Transactional;

import com.example.easyhirepro.entity.User;
import com.example.easyhirepro.repository.JobApplicationRepository;
import com.example.easyhirepro.repository.JobRepository;
import com.example.easyhirepro.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired private JobRepository jobRepo;
    @Autowired private JobApplicationRepository applicationRepo;
    @Autowired
    private JobApplicationRepository jobAppRepo;
    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/post-job")
    public String postJobForm(Model model) {
        model.addAttribute("job", new Job());
        return "admin/post-job";
    }

    @PostMapping("/save-job")
    public String saveJob(@ModelAttribute Job job) {
        job.setPostedDate(LocalDate.now());
        jobRepo.save(job);
        return "redirect:/admin/manage-jobs";
    }

    @GetMapping("/manage-jobs")
    public String manageJobs(Model model) {
        model.addAttribute("jobs", jobRepo.findAll());
        return "admin/manage-jobs";
    }

@GetMapping("/delete-job/{id}")
@Transactional
public String deleteJob(@PathVariable Long id) {
    jobAppRepo.deleteByJobId(id); // delete applications first
    jobRepo.deleteById(id);       // then delete the job
    return "redirect:/admin/manage-jobs";
}

    @GetMapping("/registered-users")
    public String viewRegisteredUsers(Model model) {
        model.addAttribute("applications", applicationRepo.findAll());
        return "admin/registered-users";
    }
}