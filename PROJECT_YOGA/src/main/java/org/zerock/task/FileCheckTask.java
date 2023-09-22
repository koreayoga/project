package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.zerock.domain.BoardAttachVO;
import org.zerock.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper;
	
	private String getFolderYesterday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);  // 하루전
		String str = sdf.format(cal.getTime()); // 하루전 날짜 포맷
		return str.replace("-", File.separator); // "-"기준으로 쪼개기
	}
	
	//@Scheduled(cron="0 * * * * *")
	public void checkFiles() throws Exception{
		log.warn("File Check Task run..............");
		
		log.warn(new Date());
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();  
		
		//DB에 있는 파일목록을 리스트화
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("C\\upload\\", vo.getUploadPath(), vo.getUuid()+"_"+vo.getFileName())).collect(Collectors.toList());
		
		//image파일의 썸네일도 함께 처리
		fileList.stream().filter(vo->vo.isFileType()==true).map(vo -> Paths.get("C\\upload\\", vo.getUploadPath(), "thumbnail_"+vo.getUuid()+"_"+vo.getFileName())).forEach(p->fileListPaths.add(p));
		
		log.warn("=================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		//어제파일경로
		File targetDir = Paths.get("C:\\upload\\"+getFolderYesterday()).toFile();
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		log.warn("---------------------------------");
		
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}		
	}
}
