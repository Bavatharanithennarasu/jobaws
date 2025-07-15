package com.example.easyhirepro.controller;

import com.example.easyhirepro.entity.Job;
import com.example.easyhirepro.entity.JobApplication;
import com.example.easyhirepro.entity.User;
import com.example.easyhirepro.repository.JobApplicationRepository;
import com.example.easyhirepro.repository.JobRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired private JobRepository jobRepo;
    @Autowired private JobApplicationRepository jobAppRepo;

    @GetMapping("/dashboard")
    public String userDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        model.addAttribute("jobs", jobRepo.findAll());
        return "user/dashboard";
    }

    @GetMapping("/available-jobs")
    public String availableJobs(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        model.addAttribute("jobs", jobRepo.findAll());
        return "user/jobs";
    }

    @GetMapping("/apply-job/{jobId}")
    public String applyJobForm(@PathVariable Long jobId, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Job job = jobRepo.findById(jobId).orElse(null);
        if (job == null) return "redirect:/user/dashboard?error=notfound";

        model.addAttribute("job", job);
        return "user/apply-job";
    }

    @PostMapping("/apply-job/{jobId}")
    public String applyToJob(@PathVariable Long jobId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Job job = jobRepo.findById(jobId).orElse(null);
        if (job != null) {
            JobApplication app = new JobApplication();
            app.setUser(user);
            app.setJob(job);
            app.setAppliedDate(LocalDate.now());
            jobAppRepo.save(app);
            model.addAttribute("success", "Applied successfully");
        }

        model.addAttribute("job", job);
        return "user/apply-job";
    }

    @GetMapping("/my-applications")
    public String myApplications(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        List<JobApplication> applications = jobAppRepo.findByUserId(user.getId());
        model.addAttribute("applications", applications);

        return "user/my-applications";
    }
}
