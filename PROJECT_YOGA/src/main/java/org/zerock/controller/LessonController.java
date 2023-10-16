package org.zerock.controller;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.LessonVO;
import org.zerock.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/Lesson/*")
public class LessonController {
	
	@Autowired
	private LessonService service;
		
	@GetMapping("/lesson") 
	@PreAuthorize("isAuthenticated()") 
	public void lesson(Model model) {
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 String username = authentication.getName();
		model.addAttribute("list", service.getList());
		model.addAttribute("username", username);
		List<LessonVO> LessonList = service.getLessonList(username);
		String result = "";
		
		  for(LessonVO lesson : LessonList) { 
			  if(lesson.getUserid().equals(username)) {
				  result = lesson.getUserid();
			  } 
			 
		  }
		model.addAttribute("result", result);
		log.info(username);
	}
	
	@GetMapping("/insert") 
	@PreAuthorize("isAuthenticated()") 
	public ResponseEntity<String> lessonInsert(@Param("ccode")String ccode, @Param("userid")String userid) {
		log.info(ccode + userid);
		int result = service.lessonInsert(ccode, userid);
		if(result ==1) {
			return ResponseEntity.ok("Success");
		}else {
			return ResponseEntity.ok("Fail");
		}
	}
	
	@PostMapping("/deleteLesson")
	@PreAuthorize("hasRole('ADMIN')")
	public String DeleteLesson(String input) {
		Long lnum = Long.parseLong(input);
		if(service.deleteLesson(lnum)) return "redirect:/admin/lessonList"; else return "Fail";
	}	
}
