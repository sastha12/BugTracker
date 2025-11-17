package com.bugtracker.Bugtracker.service;

import java.time.LocalDateTime;
import java.util.Optional;

import com.bugtracker.Bugtracker.model.User;
import com.bugtracker.Bugtracker.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void save(User user) {
        userRepository.save(user);
    }
    // User registration save
    public User registerUser(User user) {
        // Encrypt password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    // User login check
    public Optional<User> login(String username, String password) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            // Check encrypted password match
            if (passwordEncoder.matches(password, user.getPassword())) {
                user.setLastLoginTime(LocalDateTime.now());
                userRepository.save(user);
                return Optional.of(user);
            }
        }
        return Optional.empty();
    }

    // Forgot password token save
    public void saveForgotPasswordToken(String email, String token) {
        Optional<User> userOpt = userRepository.findByEmail(email);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            user.setForgotPasswordToken(token);
            userRepository.save(user);
        }
    }

    // Get user by forgot password token
    public Optional<User> getUserByForgotPasswordToken(String token) {
        return userRepository.findByForgotPasswordToken(token);
    }

    // Reset password
    public void resetPassword(User user, String newPassword) {
        user.setPassword(passwordEncoder.encode(newPassword));
        user.setForgotPasswordToken(null);
        userRepository.save(user);
    }
}
