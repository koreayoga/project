package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	//BoardService
	private BoardService service;
	// 첨부파일 삭제
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files--------------------------");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\thumbnail_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});
	}
		
	//게시글 목록 조회 : 로그인된 회원
	@GetMapping("/list")
	@PreAuthorize("isAuthenticated()") 
	public void list(Criteria cri, Model model) {		
		log.info("list  --  "+cri);
		int total = service.getTotal(cri);
		//model.addAttribute("pageMaker", new PageDTO(cri,151));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	//게시글 등록 : 강사, 관리자 등급만 가능
	@GetMapping("/register")
	@PreAuthorize("hasAnyRole('ADMIN','TUTOR')")
	public void register() {}
	
	@PostMapping("/register") 
	@PreAuthorize("hasAnyRole('ADMIN','TUTOR')") 
	public String register(BoardVO board, RedirectAttributes rttr) {
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(board);


		log.info("register : " + board);

	    log.info("register : " + board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	//게시글 불러오기 : 로그인된 회원 가능 
	@GetMapping({"/get"}) 
	@PreAuthorize("isAuthenticated()") 
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, Long hit) {
		log.info("/get");
		service.setHit(bno,hit);
		model.addAttribute("board", service.get(bno));
	}
	@GetMapping({"/get2"}) // ??????
	public void get2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, Long hit) {
		log.info("/get");
		service.setHit(bno,hit);
		model.addAttribute("board", service.get(bno));
	}
	
	//게시글 수정하기 : 글 작성자 본인
	@GetMapping({"/modify"})	
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.userid") 
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("type",cri.getType());
		return "redirect:/board/list";
	}
	
	//게시글 삭제하기 : 글 작성자 본인 or 관리자
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #userid || hasRole('ADMIN')") 
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String userid) {
		log.info("remove : " + bno);		
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if (service.remove(bno)) {			
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}		
		return "redirect:/board/list"+cri.getListLink();
	}
	
	//첨부파일목록 불러오기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("----------------getAttachList : "+bno);		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
}
