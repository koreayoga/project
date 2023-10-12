package org.zerock.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
private String userid;
private String userpw;
private String name;
private String gender;
private String phone;
private Date birth;
private String address;
private String email;
private boolean enabled;
private Date regDate;
private Date updateDate;
private String auth;

private List<AuthVO> authList;

}