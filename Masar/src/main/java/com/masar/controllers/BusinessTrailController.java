package com.masar.controllers;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.masar.models.BusinessTrail;
import com.masar.models.Comment;
import com.masar.models.Trail;
import com.masar.models.User;
import com.masar.services.BusinessTrailService;
import com.masar.services.TrailService;
import com.masar.services.UserService;

@Controller
public class BusinessTrailController {

	@Autowired
	private  BusinessTrailService businessTrailService;
	@Autowired
	private  UserService userService;
	@Autowired
	private TrailService trailService;
	
	
	
	public BusinessTrailController(BusinessTrailService businessTrailService, UserService userService,
			TrailService trailService) {
		this.businessTrailService = businessTrailService;
		this.userService = userService;
		this.trailService = trailService;
	}

	@RequestMapping("/client/businessTrails")
	public String allTrails(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<BusinessTrail> allBusinessTrails = businessTrailService.getAllTrailsByClient(userService.findByUsername(username));
		model.addAttribute("allBusinessTrails", allBusinessTrails);
		return "clientTrails.jsp";
	}
	
	@RequestMapping("/client/businessTrails/{id}")
	public String businessTrail(Model model ,@PathVariable ("id") Long id) {
		BusinessTrail businessTrail = businessTrailService.findbusinessTrailById(id);
		model.addAttribute("businessTrail", businessTrail);
		List<User> joinedUsers= businessTrail.getJoinedGuests();
		model.addAttribute("joinedUsers", joinedUsers);
		return "businessTrailsDet.jsp";
	}
	
	@RequestMapping("/client/businessTrails/new")
	public String cleintTrailForm(Model model,Principal principal,@ModelAttribute("trail") BusinessTrail trail,BindingResult result) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByUsername(username));
        List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "BusinessTrail.jsp";
	}
	
	@PostMapping("/client/businesstrails/new")
	public String NewBusinessTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") BusinessTrail trail,BindingResult result ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
		        return "BusinessTrail.jsp";
			}else {
				businessTrailService.creatBusinessTrail(trail);
				return "redirect:/masar/businessTrails";
			}

	}
	
	@RequestMapping("/client/businesstrails/{id}/edit")
	public String clientTrailEditForm(Model model,Principal principal,@PathVariable ("id") Long id) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        BusinessTrail trail = businessTrailService.findbusinessTrailById(id);
		model.addAttribute("trail", trail);
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		return "editBusinessTrail.jsp";
	}
	
	@PostMapping("/client/businesstrails/{id}/edit")
	public String adminEditTrail(Model model,Principal principal,@Valid @ModelAttribute("trail") BusinessTrail trail,BindingResult result,@PathVariable ("id") Long id ) {
			if (result.hasErrors()) {
				String username = principal.getName();
		        model.addAttribute("currentUser", userService.findByUsername(username));
				return "editBusinessTrail.jsp";
			}else {
				businessTrailService.updateBusinessTrail(trail);
				return "redirect:/client/businessTrails";
			}

	}
	
	@RequestMapping("/client/delete/{id}")
	public String delete(@PathVariable(value = "id") long id) {
		
		businessTrailService.deleteTrail(id);
			return "redirect:/client/businessTrails";
		}
	
}
