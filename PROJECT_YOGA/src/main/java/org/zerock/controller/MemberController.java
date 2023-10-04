package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService service;
	
	
	@GetMapping("/list")
	public void getListMem(Model model) {
		log.info("list");
		model.addAttribute("list", service.getListMem());
	}
	
	
	@PostMapping("/insert")
	public String insertMem(MemberVO member, RedirectAttributes rttr) {
		log.info("insertMember" + member);
		service.insertMem(member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/member/list";
	}
	
	
	@GetMapping("/get")
	public void getMem(@RequestParam("userid") String userid, Model model) {
		log.info("/get");
		model.addAttribute("member", service.getMem(userid));
	}
	

	@PostMapping("/update")
	public String updateMem(MemberVO member, RedirectAttributes rttr) {
		log.info("updateMember" + member);
		if (service.updateMem(member)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/list";
	}

	
	@PostMapping("/delete")
	public String deleteMem(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		log.info("delete" + userid);
		if (service.deleteMem(userid)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/list";
	}
}
