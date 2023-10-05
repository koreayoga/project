package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/insert")
	public void insertMem() {
		log.info("insert");
	}
	@PostMapping("/insert")
	public String insertMem(MemberVO member, 
			@RequestParam("userid") String userid,
			@RequestParam("name") String name,
			@RequestParam("userpw") String userpw,
			@RequestParam("gender") String gender,
			@RequestParam("phone") String phone,
			@RequestParam("birth") String birth,
			@RequestParam("address") String address,
			@RequestParam("email") String email,
			
	RedirectAttributes rttr) {
			log.info("INSERT+++++++++++++++++");	
			member.setName(userid);
			member.setName(name);
			member.setName(userpw);
			member.setName(gender);
			member.setName(phone);
			member.setName(birth);
			member.setAddress(address);
			member.setName(email);
		service.insertMem(member);
		
		log.info("insertMember" + member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/main/login";
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
	

/*
 * @GetMapping("/checkId") public String checkId(@RequestParam("userid") String
 * userid, RedirectAttributes rttr) { if (service.checkId(userid) == 1) {
 * rttr.addFlashAttribute("message", "아이디가 이미 존재합니다."); return "1"; } else {
 * rttr.addFlashAttribute("message", "아이디 사용이 가능합니다."); return "0"; } }
 * 
 * 
 * @RequestMapping(value = "/member", method = RequestMethod.POST) public void
 * postRegister(MemberVO vo, RedirectAttributes rttr) throws Exception {
 * log.info(""); int result = service.checkId(vo.getUserid()); try { if (result
 * == 1) { rttr.addFlashAttribute("message", "중복된 아이디입니다.");
 * 
 * } else if (result == 0) { // 중복 아이디가 없을 경우 회원가입 로직을 수행 service.insertMem(vo);
 * // 예시: service.insertMem 메서드는 회원가입을 처리하는 메서드입니다.
 * rttr.addFlashAttribute("message", "회원가입이 완료되었습니다."); // 추가적인 메시지 설정 } } catch
 * (Exception e) { throw new RuntimeException(e); }
 * 
 * }
 */
	/*
	 * 
	 * @GetMapping("checkId")
	 * 
	 * @ResponseBody public Map<String, String> checkId(@RequestParam("userid")
	 * String userid) { Map<String, String> resultMap = new HashMap<>(); if
	 * (service.checkId(userid) == 1) { resultMap.put("result", "duplicate"); } else
	 * { resultMap.put("result", "available"); } return resultMap; }
	 */
	
	
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.POST)
	public int idChk(String member) throws Exception {
		int result = service.checkId(member);
		return result;
	}
	
}	

	
