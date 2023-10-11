package org.zerock.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.CourseVO;
import org.zerock.service.BoardService;
import org.zerock.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/Lesson/*")
public class LessonController {
	
	private LessonService service;
	
	@GetMapping("/lesson") 
	//@PreAuthorize("isAuthenticated()") 
	public void lesson(Model model) {		
		model.addAttribute("list", service.getList());
	}
	
	
	
}
