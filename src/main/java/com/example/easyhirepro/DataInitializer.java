package com.example.easyhirepro;



import com.example.easyhirepro.entity.User;
import com.example.easyhirepro.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepo;

    public DataInitializer(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public void run(String... args) {
        String adminEmail = "admin@123.com";

        if (userRepo.findByEmail(adminEmail) == null) {
            User admin = new User();
            admin.setEmail(adminEmail);
            admin.setPassword("admin123"); // later use BCrypt
            admin.setRole("ADMIN");
            userRepo.save(admin);

            System.out.println("✅ Admin user created: " + adminEmail);
        }
    }
}
