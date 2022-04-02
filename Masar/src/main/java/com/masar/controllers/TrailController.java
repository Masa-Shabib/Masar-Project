package com.masar.controllers;

import java.security.Principal;
import java.util.ArrayList;
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

import com.masar.models.BusinessTrail;
import com.masar.models.Comment;
import com.masar.models.Trail;
import com.masar.models.User;
import com.masar.services.BusinessTrailService;
import com.masar.services.CommentService;
import com.masar.services.TrailService;
import com.masar.services.UserService;

@Controller
public class TrailController {
	public final TrailService trailService;
	private final UserService userService;
	public final CommentService commentService;
	public final BusinessTrailService businessTrailService;
	

	
	
	public TrailController(TrailService trailService, UserService userService, CommentService commentService,
			BusinessTrailService businessTrailService) {
		this.trailService = trailService;
		this.userService = userService;
		this.commentService = commentService;
		this.businessTrailService = businessTrailService;
	}


	//Public
	@RequestMapping("/masar")
	public String landing(Model model , Principal principal) {
        model.addAttribute("currentUser", principal);
        List<Trail> trails = trailService.top3();
		model.addAttribute("trails", trails);
			return "landingPage.jsp" ;
	}
	
	
	@RequestMapping("/masar/trails")
	public String allTrails(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		List <String> locations = new ArrayList<String>() ;
		for (Trail trail : allTrails) {
			if(!locations.contains(trail.getLocation())) {
				locations.add(trail.getLocation());
			}
		}
		model.addAttribute("locations", locations);
		return "allTrails.jsp";
	}
	
	@RequestMapping("/masar/trails/luckyHit")
	public String lucky(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        List<Trail> allTrails = trailService.allTrails();
		model.addAttribute("allTrails", allTrails);
		List <String> locations = new ArrayList<String>() ;
		for (Trail trail : allTrails) {
			if(!locations.contains(trail.getLocation())) {
				locations.add(trail.getLocation());
			}
		}
		model.addAttribute("locations", locations);
		int random_int = (int)Math.floor(Math.random()*(locations.size()-1-0+1)+0);
		String location= locations.get(random_int);
		model.addAttribute("location", location);
		List<Trail> searchTrails = trailService.findTrailsByLocation(location);
		model.addAttribute("trails", searchTrails);
		return "luckyLocation.jsp";
	}
	
	@RequestMapping("/masar/businessTrails")
	public String businessTrails(Model model,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<BusinessTrail> bTrails = businessTrailService.getAllBusinessTrail();
		model.addAttribute("bTrails", bTrails);
		List <String> locations = new ArrayList<String>() ;
		for (BusinessTrail trail : bTrails) {
			if(!locations.contains(trail.getLocation())) {
				locations.add(trail.getLocation());
			}
		}
		model.addAttribute("locations", locations);
		return "businessTrailsGuests.jsp";
	}
	
	@RequestMapping("/masar/businessTrails/{id}/join")
	public String joinTrail(Model model,@PathVariable ("id") Long id,Principal principal) {
		BusinessTrail trail = businessTrailService.findbusinessTrailById(id);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		businessTrailService.joinBusinessTrail(trail, user);
		return "redirect:/masar/businessTrails";
	}
	@RequestMapping("/masar/businessTrails/{id}/cancel")
	public String unJoinTrail(Model model,@PathVariable ("id") Long id,Principal principal) {
		BusinessTrail trail = businessTrailService.findbusinessTrailById(id);
		String username = principal.getName();
		User user = userService.findByUsername(username);
		businessTrailService.unJoinBusinessTrail(trail, user);
		return "redirect:/masar/businessTrails";
	}
	
	@RequestMapping("/masar/trails/search")
	public String searchTrails(Model model,@RequestParam("location") String location,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<Trail> searchTrails = trailService.findTrailsByLocation(location);
			model.addAttribute("trails", searchTrails);
			List<Trail> allTrails = trailService.allTrails();
			model.addAttribute("allTrails", allTrails);
			List <String> locations = new ArrayList<String>() ;
			for (Trail trail : allTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
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
			List <String> locations = new ArrayList<String>() ;
			for (Trail trail : allTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
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
			List <String> locations = new ArrayList<String>() ;
			for (Trail trail : allTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
			return "searchTrails.jsp";

	}
	
	@RequestMapping("/masar/businessTrails/search")
	public String searchBTrails(Model model,@RequestParam("location") String location,Principal principal) {
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		List<BusinessTrail> searchTrails = businessTrailService.findTrailsByLocation(location);
			model.addAttribute("trails", searchTrails);
			List<BusinessTrail> bTrails = businessTrailService.getAllBusinessTrail();
			model.addAttribute("bTrails", bTrails);
			List <String> locations = new ArrayList<String>() ;
			for (BusinessTrail trail : bTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
			return "searchBTrails.jsp";
	}
	@RequestMapping("/masar/businessTrails/filter_category")
	public String filter1BTrails(Model model,@RequestParam("t_category") String category,Principal principal) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
			List<BusinessTrail> searchTrails = businessTrailService.findTrailsByCategory(category);
			model.addAttribute("trails", searchTrails);
			List<BusinessTrail> bTrails = businessTrailService.getAllBusinessTrail();
			model.addAttribute("bTrails", bTrails);
			List <String> locations = new ArrayList<String>() ;
			for (BusinessTrail trail : bTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
			return "searchBTrails.jsp";
	}
	@RequestMapping("/masar/businessTrails/filter_location")
	public String filterBTrails(Model model,@RequestParam("t_location") String location,Principal principal) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
			List<BusinessTrail> searchTrails = businessTrailService.findTrailsByLocation(location);
			model.addAttribute("trails", searchTrails);
			List<BusinessTrail> bTrails = businessTrailService.getAllBusinessTrail();
			model.addAttribute("bTrails", bTrails);
			List <String> locations = new ArrayList<String>() ;
			for (BusinessTrail trail : bTrails) {
				if(!locations.contains(trail.getLocation())) {
					locations.add(trail.getLocation());
				}
			}
			model.addAttribute("locations", locations);
			return "searchBTrails.jsp";

	}
	
	@RequestMapping("/masar/trails/{id}")
	public String trailDetails(Model model,@ModelAttribute("comment") Comment comment,@PathVariable ("id") Long id,Principal principal) {
		Trail trail = trailService.findTrailById(id);
		model.addAttribute("trail", trail);
		String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
		return "trailsDetails.jsp";
	}
	
	
	@PostMapping("/masar/trails/{id}/comment")
	public String addComment(Model model,@Valid @ModelAttribute("comment") Comment comment,BindingResult result,@PathVariable ("id") Long id,Principal principal) {
		if (result.hasErrors()) {
			String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByUsername(username));
	        Trail trail = trailService.findTrailById(id);
			model.addAttribute("trail", trail);
			return "trailsDetails.jsp";
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
		return "adminTrails.jsp";
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
		return "redirect:/admin/trails/";
	}
	
	
}
