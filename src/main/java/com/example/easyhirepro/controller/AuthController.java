package com.example.easyhirepro.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.example.easyhirepro.entity.User;
import com.example.easyhirepro.repository.JobRepository;
import com.example.easyhirepro.repository.UserRepository;
@Controller
public class AuthController {
    @Autowired private UserRepository userRepo;
    @Autowired private JobRepository jobRepo;

    @GetMapping({"/", "/login"})
    public String loginPage() { return "auth/login"; }

    @GetMapping("/signup")
    public String signupPage() { return "auth/signup"; }

    @PostMapping("/signup")
    public String handleSignup(@RequestParam String email, @RequestParam String password, @RequestParam String name, HttpSession session) {
        if (userRepo.findByEmail(email) != null) {
            session.setAttribute("msg", "User already exists.");
            return "redirect:/login";
        }
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setName(name);
        user.setRole("USER");
        userRepo.save(user);
        session.setAttribute("user", user);
        return "redirect:/user/dashboard";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam String email, @RequestParam String password, HttpSession session) {
        User user = userRepo.findByEmail(email);
        if (user == null || !user.getPassword().equals(password)) {
            session.setAttribute("msg", "Invalid credentials");
            return "redirect:/login";
        }
        session.setAttribute("user", user);
        return user.getRole().equals("ADMIN") ? "redirect:/admin/dashboard" : "redirect:/user/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
