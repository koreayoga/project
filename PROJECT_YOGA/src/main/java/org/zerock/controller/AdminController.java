package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.LessonVO;
import org.zerock.domain.MemberVO;
import org.zerock.service.LessonService;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private LessonService lessonService;
	
	@GetMapping("/list")
	public void getListMem(Model model) {
		log.info("list");
		model.addAttribute("list", service.getListMem());
	}
	
	/*
	 * @GetMapping("/lessonList") public void getLessonList(Model model , String
	 * code) { if( code == null||code.equals(""))code = "A1000";
	 * log.info("list-----"+ lessonService.getLessonCodeList(code));
	 * System.out.println(lessonService.getLessonCodeList(code));
	 * model.addAttribute("list", lessonService.getLessonCodeList(code)); }
	 */
	
	@GetMapping(value="/lessonList")
	public void getLessonList(Model model) {
		model.addAttribute("list",lessonService.getLessonCodeList("A1000"));
	}
	@ResponseBody
	@GetMapping(value="/lessonList2" ,produces = MediaType.APPLICATION_JSON_VALUE)
    public List<LessonVO> getLessonList(Model model,@RequestParam(name = "code", defaultValue = "A1000") String code) {
        List<LessonVO> lessonList = lessonService.getLessonCodeList(code);
        //model.addAttribute("list", lessonList);
        return lessonList;
    }
	
}
