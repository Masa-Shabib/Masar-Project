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
import org.springframework.web.bind.annotation.RequestParam;

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
	@RequestMapping(value ="/masar")
	public String landing(Model model) {
			return "Landing.jsp";
	}
	@RequestMapping(value = "/")
	public String landing2(Model model) {
			return "redirect:/masar";
	}
	
	//Guest
	@RequestMapping("/masar/trails")
	public String allTrails(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "allTrails.jsp";
	}
	
	@RequestMapping("/masar/businessTrails")
	public String businessTrails(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "businessTrailsGuests.jsp";
	}
	
	@RequestMapping("/masar/trails/search")
	public String searchTrails(Model model,@RequestParam("location") String location,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<Trail> searchTrails = trailService.findTrailsByLocation(location);
			model.addAttribute("trails", searchTrails);
			List<Trail> allTrails = trailService.allTrails();
			model.addAttribute("allTrails", allTrails);
			return "searchTrails.jsp";
	}
	@RequestMapping("/masar/trails/filter_category")
	public String filter1Trails(Model model,@RequestParam("t_category") String category,Principal principal) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
			List<Trail> searchTrails = trailService.findTrailsByCategory(category);
			model.addAttribute("trails", searchTrails);
			List<Trail> allTrails = trailService.allTrails();
			model.addAttribute("allTrails", allTrails);
			return "searchTrails.jsp";
	}
	@RequestMapping("/masar/trails/filter_location")
	public String filterTrails(Model model,@RequestParam("t_location") String location,Principal principal) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
			List<Trail> searchTrails = trailService.findTrailsByLocation(location);
			model.addAttribute("trails", searchTrails);
			List<Trail> allTrails = trailService.allTrails();
			model.addAttribute("allTrails", allTrails);
			return "searchTrails.jsp";

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
		return "newTrail.jsp";
	}
	
	@PostMapping("/admin/trails/new")
	public String adminNewTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") Trail trail,BindingResult result ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
				return "newTrail.jsp";
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
		return "editTrail.jsp";
	}
	
	@PostMapping("/admin/trails/{id}/edit")
	public String adminEditTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") Trail trail,BindingResult result,@PathVariable ("id") Long id ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
				return "editTrail.jsp";
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
