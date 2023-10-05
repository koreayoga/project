package org.zerock.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails {
	/*세션정보*/
	private static final long serialVersionUID = 1L;
	
	private String username;
    private String password;
    private Collection<? extends GrantedAuthority> authorities;
    
    // 아이디
    @Override
    public String getUsername() {
        return username;
    }

    // 비밀번호
    @Override
    public String getPassword() {
    	return password;
    }
    
    // 권한
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }
    
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub		
		return false;					
	}
    
}
