package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CourseVO;
import org.zerock.mapper.CourseMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CourseServiceImpl implements CourseService {
	@Setter(onMethod_=@Autowired)
	private CourseMapper mapper;
	
	//리스트에 페이지기능 구현
	@Override
	public List<CourseVO> getList(){
		log.info("Course getList");
		return mapper.getList();
	}
	
	@Override // 해당게시글을 읽어야하므로 BoardMapper의 read()메서드 사용.
	public CourseVO get(String ccode) {
		log.info("get.........."+ccode);
		return mapper.read(ccode);
	}
	
	@Override
	public boolean modify(CourseVO course) {
		log.info("modeify.........." + course);
		boolean modifyResult = mapper.update(course) == 1;
		
		return modifyResult;
	}
	
	
//	@Transactional
//	@Override
//	public void register(BoardVO board) {
//		log.info("register.........."+board);
//		mapper.insertSelectKey(board);
//
//		//attach 처리
//		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
//			return;
//		}
//		
//		board.getAttachList().forEach(attach -> {
//			attach.setBno(board.getBno());
//			attachMapper.insert(attach);
//		});
//	}
	
	/*//리스트만
	@Override
	public List<BoardVO> getList(){
		log.info("get List-------");
		return mapper.getList();
	}
	*/
	
//	@Override
//	public boolean modify(BoardVO board) {
//		log.info("modeify.........."+board);
//		
//		attachMapper.deleteAll(board.getBno());
//		boolean modifyResult = mapper.update(board) == 1;
//		
//		if(modifyResult && board.getAttachList() != null && board.getAttachList().size()>0) {
//			board.getAttachList().forEach(attach -> {
//				attach.setBno(board.getBno());
//				attachMapper.insert(attach);
//			});
//		}
//		
//		return modifyResult;
//	}
//	
//	@Transactional
//	@Override
//	public boolean remove(Long bno) {
//		log.info("delete.........."+bno);
//		attachMapper.deleteAll(bno);
//		return mapper.delete(bno) == 1;
//	}
//	
//	@Override
//	public int getTotal(Criteria cri) {
//		return mapper.getTotalCount(cri);
//	}
//	
//	@Override
//	public List<BoardAttachVO> getAttachList(Long bno){
//		log.info("----------------get Attach list by bno : "+bno);
//		return attachMapper.findBno(bno);
//	}
//
//	@Override
//	public void setHit(Long bno,Long hit) {
//		log.info("서비스 조회수 :"+hit+" bno:"+bno);
//		mapper.updateHit(bno, 1);
//	}
}
