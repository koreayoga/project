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
	private BoardService service;
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

	@GetMapping("/list") // 글목록 가져오기
	public void list(Criteria cri, Model model) {		
		log.info("list  --  "+cri);
		int total = service.getTotal(cri);
		//model.addAttribute("pageMaker", new PageDTO(cri,151));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@PostMapping("/register") // 게시글 등록	
	@PreAuthorize("isAuthenticated()") // 인증된 사용자만 접근가능
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/register") // 게시글 등록화면 진입
	@PreAuthorize("isAuthenticated()") // 인증된 사용자만 접근가능
	public void register() {		
		
	}
	
	
	@GetMapping({"/get"}) // 해당 게시글 불러오기
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, Long hit) {
		log.info("/get");
		service.setHit(bno,hit);
		model.addAttribute("board", service.get(bno));
	}
	
	@GetMapping({"/modify"}) // 해당 게시글 불러오기
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.userid") // 로그인한 ID == 작성자 ID
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

	@PostMapping("/remove")
	@PreAuthorize("principal.username == #userid") // 로그인한 ID == 작성자 ID
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String userid) {
		log.info("remove : " + bno);
		/*
		// rttr.addAttribute 방식 (parameter를 계속 추가해줘야함.) 
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		//redirect시 가지고 넘어갈 정보들 
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("type",cri.getType());
		// redirect path
		return "redirect:/board/list";
		*/
		
		// 메서드 선언 후 링크 (리턴에서 리다이렉트경로 + 메서드)
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if (service.remove(bno)) {
			//delete attachList(files)
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}		
		return "redirect:/board/list"+cri.getListLink();
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("----------------getAttachList : "+bno);		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
}
