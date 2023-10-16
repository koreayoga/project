package org.zerock.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //사용자정보 조회
    	MemberVO member = mapper.read(username);

        if (member == null) {
            throw new UsernameNotFoundException("User not found: " + username);            
        }

        // MemberVO 클래스에서 정의한 권한 조회 >> 권한 목록 생성
        int auth = member.getAuth();
        List<GrantedAuthority> authorities = new ArrayList<>();

        switch (auth) {
        	case 1: authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN")); break;
        	case 2: authorities.add(new SimpleGrantedAuthority("ROLE_TUTOR")); break;
        	case 3: authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER")); break;
        }

        return new User(member.getUserid(), member.getUserpw(), authorities); 
    }
}
