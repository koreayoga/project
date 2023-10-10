package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
@RequestMapping("/loginout/*")
@Log4j
public class SearchController {

	@Autowired
	private SearchService service;
	/*
	 * @Inject private JavaMailSender mailSender;
	 */
	
	@GetMapping("/searchID")
	public void searchId(HttpServletRequest request, Model model, MemberVO vo) {       
	}
	 
	 
	@GetMapping("/resetPW")
	public void resetPw(HttpServletRequest request, Model model, MemberVO vo) {  
	}
	
	//아이디찾기
	/*
	 * @GetMapping("/searchID") public void searchID() {
	 * System.out.println("access searchID page Stage1--------"); }
	 */
	
	@PostMapping("/searchID")
	public String dosearchID(HttpServletRequest request, Model model, @RequestParam(required = true, value = "name") String name, @RequestParam(required = true, value = "email") String email, MemberVO vo) {
		try {	    
			vo.setName(name);
			vo.setEmail(email);
			MemberVO ID = service.searchId(vo);		    
			model.addAttribute("vo", ID);		 
		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생되었습니다.");
		}		 
		return "/loginout/searchID_result";
	}

	@GetMapping("/searchID_result")
    public void searchID_result() {
		System.out.println("result of searchID--------");
    }
	
	
	// 비밀번호 초기화
	/*
	 * @GetMapping("/resetPW") public void resetPW() {
	 * System.out.println("access resetPW page Stage1--------"); }
	 */
    
    @PostMapping(value = "/resetPW")
    public String resetPW(HttpServletRequest request, Model model,
    						@RequestParam(required=true, value="id") String id, 
						    @RequestParam(required=true, value="name") String name, 
						    @RequestParam(required=true, value="email") String email, 
						    MemberVO vo) {
    
	    try {    
		    vo.setName(name);
		    vo.setEmail(email);
		    vo.setUserid(id);
		    int memberSearch = service.memberPwdCheck(vo);
		
		    if(memberSearch == 0) {
		        model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
		        return "/loginout/resetPW";
		    }
		    BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		    
		    String newPwd = RandomStringUtils.randomAlphanumeric(10);
		    String enpassword = bcrypt.encode(newPwd);		    
		    vo.setUserpw(enpassword);		
		    
		    service.passwordUpdate(vo);		
		    model.addAttribute("newPwd", newPwd);	     
	    } catch (Exception e) {
	        System.out.println(e.toString());
	        model.addAttribute("msg", "오류가 발생했습니다.");
	    }
	     
	     
	    return "/loginout/resetPW_result";
    }
    
   
 	//이메일 인증
	/*
	 * @RequestMapping("/cert") public String certMem(MemberVO vo) throws
	 * MessagingException, UnsupportedEncodingException { log.info("이메일 발송"); }
	 */
 	
}
