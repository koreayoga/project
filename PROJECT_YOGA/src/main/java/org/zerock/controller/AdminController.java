package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CourseVO;
import org.zerock.service.CourseService;
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
	
	@Autowired
	private CourseService courseService;
	
	@GetMapping("/list")
	@PreAuthorize("hasRole('ADMIN')")
	public void getListMem(Model model) {
		log.info("list");
		model.addAttribute("list", service.getListMem());
	}
	
	@GetMapping(value="/lessonList")
	@PreAuthorize("hasRole('ADMIN')")
	public void getLessonList(Model model) {
		model.addAttribute("list",lessonService.getLessonCodeList("A1000"));
	}

	@GetMapping("/course")
	@PreAuthorize("hasRole('ADMIN')")
	public void getListCourse(Model model) {
		log.info("course list");
		model.addAttribute("courseList", courseService.getList());
	}
	
	@GetMapping("/ccontext")   //�씠寃� modify	
	@PreAuthorize("hasRole('ADMIN')")
	public void ccontext(String ccode, Model model) {
		System.out.println("ccontext" + ccode);
		log.info("courseContext");
		model.addAttribute("course", courseService.get(ccode));
		model.addAttribute("teacher", courseService.teacher());
	}
	
	@PostMapping("/ccontext")  //�씠寃� modify
	@PreAuthorize("hasRole('ADMIN')")
	public String ccontext(CourseVO course, RedirectAttributes rttr) {
		System.out.println("course" + course);
		log.info("modify : " + course);
		if (courseService.modify(course)) {
			log.info("성공");
		}
		return "redirect:/admin/course";
	}
}
