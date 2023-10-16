package org.zerock.controller;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberVO;
import org.zerock.service.CourseService;
import org.zerock.service.MemberService;

import lombok.Setter;


@Controller
public class HomeController {
	@Setter(onMethod_ =@Autowired)
	private MemberService service;
	
	@Autowired
	private CourseService courseService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,Principal principal, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if(principal !=null) {
		String userid = principal.getName();
		MemberVO vo = service.getMem(userid);
		System.out.println(vo);
		model.addAttribute("user", vo);
		}
		
		model.addAttribute("courseList", courseService.getList());
		
		return "main/home";
	}
}
