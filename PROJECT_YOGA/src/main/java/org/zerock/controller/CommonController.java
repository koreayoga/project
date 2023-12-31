package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberVO;
import org.zerock.service.SearchService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/loginout/*")
public class CommonController {

	@Autowired
	private SearchService service;

	@Autowired
	private PasswordEncoder encodePw;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("--------------------------Access Denied : " + auth);
		model.addAttribute("msg", "접근권한이 없습니다.");
	}

	@GetMapping("/login")
	public String loginInput(String error, String logout, Model model) {
		System.out.println("-------------------------Error : " + error);
		log.info("------------------------Logout : " + logout);

		if (error != null) {
			model.addAttribute("error", error);
			log.info(error);
		}

		if (logout != null) {
			model.addAttribute("logout", "로그아웃하였습니다.");
			log.info(logout);
		}

		return "/loginout/login";
	}

	@GetMapping("/logout")
	public void logoutGet() {		
	}

	@GetMapping("/searchID")
	public void searchId(HttpServletRequest request, Model model, MemberVO vo) {
	}

	@GetMapping("/resetPW")
	public void resetPw(HttpServletRequest request, Model model, MemberVO vo) {
	}

	@PostMapping("/searchID")
	public String searchID(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "name") String name,
			@RequestParam(required = true, value = "email") String email, MemberVO vo) {
		try {
			vo.setName(name);
			vo.setEmail(email);
			MemberVO member = service.searchId(vo);
			model.addAttribute("vo", member);
		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생했습니다.");
		}
		return "/loginout/searchID_result";
	}

	@PostMapping(value = "/resetPW")
	public String resetPW(Model model, MemberVO vo,
			@RequestParam(required = true, value = "id") String id,
			@RequestParam(required = true, value = "name") String name,
			@RequestParam(required = true, value = "email") String email ) {

		try {
			vo.setUserid(id);
			vo.setName(name);
			vo.setEmail(email);			

			String newPwd = RandomStringUtils.randomAlphanumeric(10);
			String enpassword = encodePw.encode(newPwd);
			vo.setUserpw(enpassword);

			service.passwordUpdate(vo);
			model.addAttribute("newPwd", newPwd);
		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생했습니다.");
		}

		return "/loginout/resetPW_result";
	}

}