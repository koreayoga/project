package org.zerock.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MemberVO;
import org.zerock.service.SearchService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/loginout/")
@Log4j
public class SearchController {
	@Autowired
	private SearchService service;
	
	//아이디찾기
	@GetMapping("/searchID")
    public void searchID() {
		log.info("access searchID page Stage1--------");
    }
	
	@PostMapping("/searchID")
	public String doSearchID(MemberVO vo, Model model) {
		MemberVO member = service.searchId(vo);
		
		if(vo == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", member.getUserid());
		}
		
		return "/loginout/searchID2";
	}
	@GetMapping("/searchID2")
    public void searchID2() {
		log.info("access searchID page Stage2--------");
    }
	
	// 비밀번호 초기화
    @GetMapping("/resetPW")
    public void resetPW() {
    	log.info("access resetPW page Stage1--------");
    }
    
    @PostMapping("/resetPW")
	public String doResetPW(@RequestParam(value="updateid", defaultValue="", required=false) String id,	MemberVO vo) {
		vo.setUserid(id);
		System.out.println(vo);
		service.resetPw1(vo);
		return "/loginout/resetPW2";
	}
    
    @GetMapping("/resetPW2")
    public void resetPW2() {
    	log.info("access resetPW page Stage2--------");
    }
    
    // 비밀번호 바꾸기 성공시 업데이트 페이지 이동
 	@PostMapping("/updatePW")
 	public String checkPasswordForModify(HttpSession session, Model model) {
 		//사용자 세션정보 객채
 		Authentication user = SecurityContextHolder.getContext().getAuthentication();

 	    if (user == null || !user.isAuthenticated()) {
 	        return "/loginout/login"; // 로그인되지 않은 경우 로그인 페이지로 이동
 	    } else { 	        
 	        return "/loginout/updatePW"; // 로그인된 경우 마이페이지로 이동, 현재경로(loginout/updatePW)는 임시용.
 	    }
 	}
}
