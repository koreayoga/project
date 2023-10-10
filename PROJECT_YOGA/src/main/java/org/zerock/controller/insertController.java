package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Controller
@RequestMapping("/insert/*")
public class insertController {
	
	private MemberService service;
	
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.POST)
	public int idChk(@RequestParam("userid")String userid) throws Exception {
		log.info(userid);
		int result = service.checkId(userid);
		return result;
	}
}