package com.masar.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.masar.models.Comment;
import com.masar.models.Trail;
import com.masar.services.CommentService;
import com.masar.services.TrailService;
import com.masar.services.UserService;

@Controller
public class TrailController {
	public final TrailService trailService;
	private final UserService userService;
	public final CommentService commentService;
	
	

	public TrailController(TrailService trailService, UserService userService, CommentService commentService) {
		this.trailService = trailService;
		this.userService = userService;
		this.commentService = commentService;
	}
	
	//Public
	@RequestMapping("/masar")
	public String landing(Model model) {
			return "Landing.jsp";
	}
	
	//Guest
	@RequestMapping("/masar/trails")
	public String allTrails(Model model) {
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "AllTrails.jsp";
	}
	
	@RequestMapping("/masar/trails/{id}")
	public String trailDetails(Model model,@ModelAttribute("comment") Comment comment,@PathVariable ("id") Long id,Principal principal) {
		Trail trail = trailService.findTrailById(id);
		model.addAttribute("trail", trail);
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		return "TrailDetails.jsp";
	}
	
	@PostMapping("/masar/trails/{id}")
	public String addComment(Model model,@Valid @ModelAttribute("comment") Comment comment,BindingResult result,@PathVariable ("id") Long id,Principal principal) {
		if (result.hasErrors()) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        Trail trail = trailService.findTrailById(id);
			model.addAttribute("trail", trail);
			return "TrailDetails.jsp";
		}else {
			commentService.creatComment(comment);
			return "redirect:/masar/trails/"+id;
		}
	}
	
	//Admins
	
	@RequestMapping("/admin/trails")
	public String allAdminTrails(Model model) {
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "AdminTrails.jsp";
	}
	
	@RequestMapping("/admin/trails/new")
	public String adminTrailForm(Model model,Principal principal,@ModelAttribute("trail") Trail trail,BindingResult result) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		return "CreateTrail.jsp";
	}
	
	@PostMapping("/admin/trails/new")
	public String adminNewTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") Trail trail,BindingResult result ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
				return "CreateTrail.jsp";
			}else {
				trailService.creatTrail(trail);
				return "redirect:/admin/trails";
			}

	}
	
	@RequestMapping("/admin/trails/{id}/edit")
	public String adminTrailEditForm(Model model,Principal principal,@PathVariable ("id") Long id) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        Trail trail = trailService.findTrailById(id);
		model.addAttribute("trail", trail);
		return "EditTrail.jsp";
	}
	
	@PostMapping("/admin/trails/{id}/edit")
	public String adminEditTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") Trail trail,BindingResult result,@PathVariable ("id") Long id ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
				return "EditTrail.jsp";
			}else {
				trailService.updateTrail(trail);
				return "redirect:/admin/trails";
			}

	}
	
	@RequestMapping("/admin/trails/{id}/delete")
	public String deleteEvent(@PathVariable("id")Long id) {
		trailService.delete(id);
		return "redirect:/admin/trails/"+id;
	}
	
	
	
}
