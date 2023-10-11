package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CourseVO;
import org.zerock.domain.LessonVO;
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
	
	@GetMapping("/course")
	public void getListCourse(Model model) {
		log.info("course list");
		model.addAttribute("courseList", courseService.getList());
	}
	
	@GetMapping("/ccontext")   //이게 modify
	public void ccontext(String ccode, Model model) {
		log.info("courseContext");
		model.addAttribute("course", courseService.get(ccode));
	}
	
	@PostMapping("/ccontext")  //이게 modify
	public String ccontext(CourseVO course, RedirectAttributes rttr) {
		log.info("modify : " + course);
		if (courseService.modify(course)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/course";
	}
	
}
