package org.zerock.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	
	
	@GetMapping("/list")
	public void getListMem(Model model) {
		log.info("list");
		model.addAttribute("list", service.getListMem());
	}
	
	@GetMapping("/insert")
	public void insertMem() {
		log.info("insert");
	}
 
	
	

	
	
	/*@ResponseBody
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public int checkId(@RequestParam("userid") String userid) throws Exception {
	    int result = service.checkId(userid);
	    return result;
	}*/
	@PostMapping("/insert")
	public String insertMem(MemberVO member, RedirectAttributes rttr) {
			log.info("INSERT+++++++++++++++++" + member);
			//MemberVO insertMember = new MemberVO();
			member.setUserpw(pwencoder.encode(member.getUserpw()));
			log.info(member);
		service.insertMem(member);
		
		log.info("insertMember" + member);
		rttr.addFlashAttribute("result", member.getUserid());
		return "redirect:/main/home";
	}
	
	
	
	/*
	 * @GetMapping("/userID")
	 * 
	 * @ResponseBody public String currentUserName(Principal principal) { return
	 * principal.getName(); }
	 * 
	 * @GetMapping("/mypage")
	 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage")
    public void getMem(Principal principal, Model model) {  
		log.info("access mypage-----------");
		String userid = principal.getName();
		MemberVO vo = service.getMem(userid);
		model.addAttribute("user", vo);
		System.out.println(vo.getGender());		
	}
	
	
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
	@PostMapping("/delete")
	public String deleteMem(@RequestParam("userid") String userid, RedirectAttributes rttr) {
		log.info("delete" + userid);
		if (service.deleteMem(userid)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/member/list";
	}
	
	
	
	/*
	//탈퇴
	@PreAuthorize("isAuthenticated() and principal.username = #{userid}")
	@RequestMapping("/deleteMember.do")
	public String deleteMember (@RequestParam("userid") String userid,
								RedirectAttributes redirectAttr, 
	                            SessionStatus sessionStatus) {
	                            
		boolean result = service.deleteMem(userid);

		if(result) {
			redirectAttr.addFlashAttribute("msg", "성공적으로 회원정보를 삭제했습니다.");
			SecurityContextHolder.clearContext();
		}
		else 
			redirectAttr.addFlashAttribute("msg", "회원정보삭제에 실패했습니다.");

		return "redirect:/";
	}
	*/
	
	/*
	//탈퇴 페이지 요청
	@GetMapping("/quit")
	public void remove() {
		
	}
	*/
	/*
	@PostMapping("/withdrawal")
	public String withdrawal(@RequestBody MemberVO vo, HttpSession session) throws Exception {
		
		//비밀번호 맞는지 확인
		String result = checkPw(vo.getUserpw(), session);
		
		if(result.equals("pwConfirmOK")) {
			//탈퇴 시키고
			service.deleteMem(vo);
			
			//로그인세션 삭제
			Object object = session.getAttribute("login");
			if(object != null) {
				session.removeAttribute("login");
				session.invalidate();
			}
			
			result = "Success";
		} else {
			//비번 틀림
			result ="Fail";
		}
		
		return result;	
	}
	*/


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
	
	

	
}	

	
