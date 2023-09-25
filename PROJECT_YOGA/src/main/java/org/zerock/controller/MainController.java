package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
public class MainController {
	
	@GetMapping("/home")
	public void open() {
		
		log.info("welcome................");
		
	}
	
	@GetMapping("/login")
	public void login() {
		
		log.info("login................");
		
	}
	
	@GetMapping("/member")
	public void member() {
		
		log.info("member................");
		
	}
	
	@GetMapping("/intro")
	public void intro() {
		
		log.info("intro................");
		
	}
	
	@GetMapping("/notice")
	public void notice() {
		
		log.info("intro................");
		
	}
	
	@GetMapping("/contect")
	public void contect() {
		
		log.info("contect................");
		
	}
	
//	
//	@GetMapping("/ex02")
//	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
//		
//		log.info("name: " + name);
//		log.info("age: "+ age);
//		
//		return "ex02";
//	}
//	
//	@GetMapping("/ex02List")
//	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
//		
//		log.info("ids: " + ids);
//		
//		return "ex02List";
//	}
//	
//	@GetMapping("/ex02Array")
//	public String ex02Array(@RequestParam("ids") String[] ids) {
//		
//		log.info("array ids: " + Arrays.toString(ids));
//		
//		return "ex02Array";
//	}
//	
//	@GetMapping("/ex02Bean")
//	public String ex02Bean(SampleDTOList list) {
//		
//		log.info("list dtos: " + list);
//		
//		return "ex02Bean";
//	}
//	
//	@GetMapping("/ex04")
//	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
//		
//		log.info("dto: " + dto);
//		log.info("page: " + page);
//		
//		return "/sample/ex04";
//	}
//
//	@GetMapping("/ex06")
//	public @ResponseBody SampleDTO ex06() {
//		
//		log.info("/ex06..........");
//		SampleDTO dto = new SampleDTO();
//		dto.setAge(10);
//		dto.setName("�솉湲몃룞");
//		
//		return dto;
//	}
//	
//	@GetMapping("/exUpload")
//	public void exUpload() {
//		log.info("/exUpload............");
//	}
//	
//	@PostMapping("/exUploadPost")
//	public void exUploadPost(ArrayList<MultipartFile> files) {
//		
//		files.forEach(file ->{
//			log.info("------------------");
//			log.info("name: "+file.getOriginalFilename());
//			log.info("size: "+file.getSize());
//		});
//	}
//	
}
