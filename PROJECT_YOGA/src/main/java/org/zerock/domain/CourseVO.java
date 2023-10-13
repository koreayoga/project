package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class CourseVO {
	private String ccode;
	private String cname;
	private int camount;
	private String ccontext;
	private String croom;
	private String ctime;
	private String cteacher;
	
	private List<LessonVO> lessonList;
}
