package org.zerock.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.zerock.domain.MemberVO;

public class CustomUserDetails implements UserDetails {
	/*세션정보*/
	private static final long serialVersionUID = 1L;
	
	private String username;
    private String password;
    private MemberVO vo;
    
    // 아이디 리턴
    @Override
    public String getUsername() {
        return username;
    }

    // 비밀번호 리턴
    @Override
    public String getPassword() {
    	return password;
    }  
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
		/* String auth = String.valueOf(user.getAuth()); */// int >> String
        String auth = Integer.toString(vo.getAuth());
        authorities.add(new SimpleGrantedAuthority(auth));
        return authorities;
    }

    
	// 계정이 만료가 되었는지 확인한다.
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

	// 계정이 잠겼는지 확인한다.
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

	// 비밀번호가 만료됐는지 확인한다.
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

	// 계정이 활성화 되었는지 확인한다.
    @Override
    public boolean isEnabled() {

        // 만약 우리 사이트에서 1년동안 회원이 로그인을 안하면 휴면 계정으로 하기로 함.
        // 현재시간 - 로그인시간 => 1년을 초과하면 false;
        // User에 로그인 시간 필드를 만들어주면 된다.
        return true;
    }
    
}
