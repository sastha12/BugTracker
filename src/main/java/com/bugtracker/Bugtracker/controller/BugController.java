package com.bugtracker.Bugtracker.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bugtracker.Bugtracker.model.Bug;
import com.bugtracker.Bugtracker.model.User;
import com.bugtracker.Bugtracker.repository.BugRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class BugController {

    @Autowired
    private BugRepository repo;

   
    private void addUserToModel(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
    }

    @GetMapping("/bug")
    public String home() {
        return "redirect:/bugs";
    }

    // ------------------- ADD PAGE -----------------------
    @GetMapping("/addBug")
    public String addBugPage(HttpSession session, Model model) {
        addUserToModel(session, model);
        return "bug-add";
    }

    // ------------------- SAVE NEW BUG -----------------------
    @PostMapping("/save")
    public String saveBug(@ModelAttribute Bug bug, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        String currentUsername = (loggedInUser != null) ? loggedInUser.getUsername() : "Anonymous";

        bug.setCreatedAt(LocalDateTime.now());
        bug.setUpdatedAt(LocalDateTime.now());
        bug.setCreatedBy(currentUsername);
        bug.setUpdatedBy(currentUsername);

        repo.save(bug);
        return "redirect:/bugs";
    }

    // ------------------- LIST ALL BUGS -----------------------
    @GetMapping("/bugs")
    public String listBugs(HttpSession session, Model model) {
        addUserToModel(session, model);
        model.addAttribute("buglist", repo.findAll());
        return "bug-list";
    }
    

    // ------------------- EDIT BUG -----------------------
    @GetMapping("/edit")
    public String editBug(@RequestParam int id, HttpSession session, Model model) {
        addUserToModel(session, model);
        Bug bug = repo.findById(id).orElse(null);
        model.addAttribute("bug", bug);
        return "edit";
    }

    // ------------------- UPDATE BUG -----------------------
 // ------------------- UPDATE BUG -----------------------
    @PostMapping("/update")
    public String updateBug(@ModelAttribute Bug updatedBug, HttpSession session) { 
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        String currentUsername = (loggedInUser != null) ? loggedInUser.getUsername() : "Anonymous";
        
        Optional<Bug> existingOpt = repo.findById(updatedBug.getId());
        Bug existing = existingOpt.orElse(null);

        if (existing != null) {
            // Preserve old createdAt and createdBy
            updatedBug.setCreatedAt(existing.getCreatedAt());
            updatedBug.setCreatedBy(existing.getCreatedBy());

            // Set new updatedAt and updatedBy
            updatedBug.setUpdatedAt(LocalDateTime.now());
            updatedBug.setUpdatedBy(currentUsername); 
        }

        repo.save(updatedBug);
        return "redirect:/bugs";
    }
    // ------------------- DELETE BUG -----------------------
    @GetMapping("/delete")
    public String deleteBug(@RequestParam int id) {
        repo.deleteById(id);
        return "redirect:/bugs";
    }

    // ------------------- HOME PAGE -----------------------
    @GetMapping("/home")
    public String homePage(HttpSession session, Model model) {
        addUserToModel(session, model);
        return "home";
    }

    // ------------------- LOGOUT -----------------------
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
