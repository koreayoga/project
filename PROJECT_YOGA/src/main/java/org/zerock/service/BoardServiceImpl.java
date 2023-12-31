package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register.........."+board);
		mapper.insertSelectKey(board);

		//attach 처리
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Override // 해당게시글을 읽어야하므로 BoardMapper의 read()메서드 사용.
	public BoardVO get(Long bno) {
		log.info("get.........."+bno);
		return mapper.read(bno);
	}
	
	/*//리스트만
	@Override
	public List<BoardVO> getList(){
		log.info("get List-------");
		return mapper.getList();
	}
	*/
	
	//리스트에 페이지기능 구현
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("get List with Criteria : " + cri);
		/*
		cri.setPageNum(1); 
		cri.setAmount(10);
		*/
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public boolean modify(BoardVO board) {
		log.info("modeify.........."+board);
		
		attachMapper.deleteAll(board.getBno());
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size()>0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("delete.........."+bno);
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(Long bno){
		log.info("----------------get Attach list by bno : "+bno);
		return attachMapper.findBno(bno);
	}

	@Override
	public void setHit(Long bno,Long hit) {
		log.info("서비스 조회수 :"+hit+" bno:"+bno);
		mapper.updateHit(bno, 1);
	}
}
