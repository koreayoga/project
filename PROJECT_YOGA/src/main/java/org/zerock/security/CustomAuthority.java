package org.zerock.security;

import org.springframework.security.core.GrantedAuthority;

//Custom 권한 생성
public class CustomAuthority implements GrantedAuthority {

	private String authority;

    public CustomAuthority(String authority) {
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return authority;
    }
}