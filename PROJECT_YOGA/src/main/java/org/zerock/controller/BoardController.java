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

	@GetMapping("/list") 
	public void list(Criteria cri, Model model) {		
		log.info("list  --  "+cri);
		int total = service.getTotal(cri);
		//model.addAttribute("pageMaker", new PageDTO(cri,151));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	@PostMapping("/register") 
	@PreAuthorize("isAuthenticated()") 
	public String register(BoardVO board, RedirectAttributes rttr) {
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		service.register(board);

	    log.info("register : " + board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping("/register") 
	@PreAuthorize("isAuthenticated()") 
	public void register() {		
		
	}
	
	
	@GetMapping({"/get"}) 
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, Long hit) {
		log.info("/get");
		service.setHit(bno,hit);
		model.addAttribute("board", service.get(bno));
	}
	@GetMapping({"/get2"}) // 해당 게시글 불러오기
	public void get2(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, Long hit) {
		log.info("/get");
		service.setHit(bno,hit);
		model.addAttribute("board", service.get(bno));
	}
	
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

	@PostMapping("/remove")
	@PreAuthorize("principal.username == #userid") 
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String userid) {
		log.info("remove : " + bno);
		/*
		// rttr.addAttribute 諛⑹떇 (parameter瑜� 怨꾩냽 異붽��빐以섏빞�븿.) 
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		//redirect�떆 媛�吏�怨� �꽆�뼱媛� �젙蹂대뱾 
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("type",cri.getType());
		// redirect path
		return "redirect:/board/list";
		*/
		
		// 硫붿꽌�뱶 �꽑�뼵 �썑 留곹겕 (由ы꽩�뿉�꽌 由щ떎�씠�젆�듃寃쎈줈 + 硫붿꽌�뱶)
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
