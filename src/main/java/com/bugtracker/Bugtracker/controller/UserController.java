package com.bugtracker.Bugtracker.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bugtracker.Bugtracker.model.User;
import com.bugtracker.Bugtracker.service.EmailService;
import com.bugtracker.Bugtracker.service.UserService;

import jakarta.servlet.http.HttpSession;

import java.security.Principal;
import java.util.Optional;
import java.util.UUID;

@Controller
public class UserController {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @GetMapping("/")
    public String root() {
        return "redirect:/login";
    }
   

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // login.jsp
    }
    @GetMapping("/user")
    public String defaultPage() {
        return "login"; // redirect to login page
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        Optional<User> userOpt = userService.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (encoder.matches(password, user.getPassword())) {
                session.setAttribute("loggedInUser", user);  
                model.addAttribute("user", user);
                return "home"; 
            }
        }
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }



    @GetMapping("/register")
    public String registerPage() {
        return "register"; // register.jsp
    }

    @PostMapping("/register")
    public String registerUser(User user, Model model) {
        String hashedPassword = encoder.encode(user.getPassword());
        user.setPassword(hashedPassword);
        userService.save(user);
        model.addAttribute("message", "Registration successful. Please login.");
        return "login";
    }
 // com.bugtracker.Bugtracker.controller.UserController.java 
  //  @GetMapping("/home")
 //   public String homePage(Model model, Principal principal) {
   //     if (principal != null) {
     //       String username = principal.getName(); 
       //     Optional<User> userOpt = userService.findByUsername(username);
         //   if (userOpt.isPresent()) {
           //     model.addAttribute("user", userOpt.get());
           // }
        //}
      //  return "home"; 
    // }



    @GetMapping("/forgot-password")
    public String forgotPasswordPage() {
        return "forgot-password"; // forgot-password.jsp
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam String email, Model model) {
        Optional<User> userOpt = userService.findByEmail(email);
        if (userOpt.isPresent()) {
            String token = UUID.randomUUID().toString();
            userService.saveForgotPasswordToken(email, token);
            emailService.sendResetPasswordEmail(email, token);
            model.addAttribute("message", "Password reset link sent to your email.");
        } else {
            model.addAttribute("error", "Email not found.");
        }
        return "forgot-password";
    }

    @GetMapping("/reset-password")
    public String resetPasswordPage(@RequestParam String token, Model model) {
        Optional<User> userOpt = userService.getUserByForgotPasswordToken(token);
        if (userOpt.isPresent()) {
            model.addAttribute("token", token);
            return "reset-password"; // reset-password.jsp
        } else {
            model.addAttribute("error", "Invalid or expired token");
            return "error"; // error.jsp
        }
    }

 
    @PostMapping("/reset-password")
    public String resetPassword(@RequestParam String token, 
                               @RequestParam String newPassword, 
                               @RequestParam String confirmPassword, 
                               Model model) {
        
        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New passwords do not match!");
            model.addAttribute("token", token); 
            return "reset-password";
        }

        Optional<User> userOpt = userService.getUserByForgotPasswordToken(token);
        if (userOpt.isPresent()) {
            userService.resetPassword(userOpt.get(), newPassword);
            model.addAttribute("message", "Password reset successful. Please login.");
            return "login";
        } else {
            model.addAttribute("error", "Invalid or expired token");
            return "error";
        }
    }
    }


