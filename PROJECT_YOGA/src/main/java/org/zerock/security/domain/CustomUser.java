package org.zerock.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.toString())).collect(Collectors.toList()));
		this.member = vo;
	}
}
