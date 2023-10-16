package org.zerock.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	//paging	
	@PreAuthorize("principal.username == 'admin'")
	@GetMapping("/list")
	public void getListMem(Criteria cri, Model model) {
		log.info("list");
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getListMemPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		//model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	
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
		
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/update")
	public void updateMem(Principal principal, Model model) {        
        log.info("access mypage-----------");
        String userid = principal.getName();
        MemberVO vo = service.getMem(userid);
        model.addAttribute("user", vo);
    }
	
	@Transactional
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
		
	//나중에 ADMINCONTROLLER로 옮길 예정
	@PreAuthorize("isAuthenticated() and principal.username=='admin'")
	@PostMapping("/updateAdmin")
	public String updateAdmin(MemberVO vo, Model model, RedirectAttributes rttr) {
		/* vo.setUserpw(pwencoder.encode(vo.getUserpw())); */
		int result = service.updateAdmin(vo);
		if (result>0) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/list";
	}

	//나중에 ADMINCONTROLLER로 옮길 예정
	@PreAuthorize("isAuthenticated() and principal.username=='admin'")
	@PostMapping("/deleteAdmin")	 
	public String deleteAdmin(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		int result = service.deleteAdmin(userid);
		System.out.println(result);
		if(result>0) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}
	
	@GetMapping("/delete")
	public void delete(Principal principal) {
		MemberVO vo = service.getMem(principal.getName());
		System.out.println("-------------------"+vo.getName()+"회원님 계정을 삭제하시겠습니까?");		
	};
	
	@PostMapping("/delete")	 
	public String delete(Principal principal, @RequestParam("userpw") String userpw, RedirectAttributes rttr) {
		
		MemberVO vo = service.getMem(principal.getName());
		System.out.println(vo);
	    vo.setUserpw(pwencoder.encode(userpw));
	    
	    if (pwencoder.matches(userpw, vo.getUserpw())) {
	    	
	    	// 비밀번호 확인이 맞으면 탈퇴
	        service.deleteMem(vo.getUserid());
	        // 로그아웃 처리(세션만료)
	        SecurityContextHolder.clearContext();
	        rttr.addFlashAttribute("result", "success");	        
	        return "redirect:/";
	    } else {
	        // 비밀번호가 틀렸을 때
	    	rttr.addFlashAttribute("result", "fail");
	        return "redirect:/member/delete";
	    }
	}
}	

	
