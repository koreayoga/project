package org.zerock.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CourseVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.CourseService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ =@Autowired)
	private MemberService service;
	
	@Setter(onMethod_ =@Autowired)
	private CourseService Cservice;

	
	//회원가입
	@GetMapping("/insert")
	public void insertMem() {
		log.info("insert");
	}
 
	@PostMapping("/insert")
	public String insertMem(MemberVO member, RedirectAttributes rttr) {
			log.info("INSERT+++++++++++++++++" + member);
			member.setUserpw(pwencoder.encode(member.getUserpw()));
			log.info(member);
		service.insertMem(member);
		
		log.info("insertMember" + member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/main/home";
	}
	
	
	//회원정보출력-마이페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage")
    public void getMem(Principal principal, Model model) {  
		log.info("access mypage-----------");
		String userid = principal.getName();
		MemberVO vo = service.getMem(userid);
		CourseVO cvo = Cservice.getCourse(userid);
		model.addAttribute("user", vo);
		model.addAttribute("course", cvo);
		System.out.println(cvo);		
	}
	
	
	//회원정보수정
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/update")
	public void updateMem(Principal principal, Model model) {        
        log.info("access mypage-----------");
        String userid = principal.getName();
        MemberVO vo = service.getMem(userid);
        model.addAttribute("user", vo);
    }	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/update")
	public String updateMem(MemberVO vo, Model model, RedirectAttributes rttr) {
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		int result = service.updateMem(vo);		
        if(result>0) {        	
            rttr.addFlashAttribute("result","success");
        }
		return "redirect:/member/mypage";
	}
	
	
	//회원탈퇴
	@GetMapping("/delete")
	public void delete(Principal principal) {
		MemberVO vo = service.getMem(principal.getName());
		System.out.println("-------------------"+vo.getName()+"회원님 계정을 삭제하시겠습니까?");		
	};

	@ResponseBody
	@PostMapping("/delete")
	public String memberDelete(Principal principal, @RequestBody MemberVO vo, Model model) throws Exception {

		String inputPass = vo.getUserpw(); // 입력 비밀번호	
		MemberVO member = service.getMem(principal.getName()); // 암호화된 DB비밀번호를 가져오기 위해 MemberVO 객체 생성	
		String result = "";
		System.out.println("access success" + member);		
		
		if(principal.getName() != null && principal.getName() != "") {	
			BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
			System.out.println("pwencode success");
			if(pwencoder.matches(inputPass, member.getUserpw())) {
				System.out.println("matches success");
				service.deleteMem(principal.getName());
				 SecurityContextHolder.clearContext();
				System.out.println("delete success");
				result = "success";
			}
		}		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.POST)
	public int idChk(@RequestParam("userid")String userid) throws Exception {
		log.info(userid);
		int result = service.checkId(userid);
		return result;
	}

}	

	
