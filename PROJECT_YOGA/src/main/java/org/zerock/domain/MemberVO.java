package org.zerock.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

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
	private int auth;
	
	private List<AuthVO> authList;
	

	 //auth에 지정된 숫자에 따른 custom권한 생성 public int getAuth() { return auth; }
	  
	  public Collection<? extends GrantedAuthority> getAuthorities() {
	  List<GrantedAuthority> authorities = new ArrayList<>();
	 
	  if (auth == 1) { authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN")); }
	  else if (auth == 2) { authorities.add(new
	  SimpleGrantedAuthority("ROLE_TUTOR")); } else if (auth == 3){
	  authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER")); } return
	  authorities; 
	  }
}
	
