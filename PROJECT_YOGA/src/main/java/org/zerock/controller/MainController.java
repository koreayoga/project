package org.zerock.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	@Setter(onMethod_ =@Autowired)
	private MemberService service;
	@GetMapping("/home")
	public void open(Principal principal, Model model) {		
		log.info("welcome homepage................");
		if(principal !=null) {
			String userid = principal.getName();
			MemberVO vo = service.getMem(userid);
			System.out.println(vo);
			model.addAttribute("user", vo);
			}
	}
		
	@GetMapping("/intro")
	public void intro() {
		log.info("intro................");
	}
}
