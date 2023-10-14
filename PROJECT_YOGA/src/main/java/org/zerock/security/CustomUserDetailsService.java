package org.zerock.security;
 
 /* import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.security.core.userdetails.UserDetails; import
 * org.springframework.security.core.userdetails.UserDetailsService; import
 * org.springframework.security.core.userdetails.UsernameNotFoundException;
 * import org.zerock.domain.MemberVO; import org.zerock.mapper.MemberMapper;
 * import org.zerock.security.domain.CustomUser;
 * 
 * import lombok.Setter; import lombok.extern.log4j.Log4j;
 * 
 * @Log4j public class CustomUserDetailsService implements UserDetailsService{
 * 
 * @Setter(onMethod_ = @Autowired) private MemberMapper memberMapper;
 * 
 * @Override public UserDetails loadUserByUsername(String userName) throws
 * UsernameNotFoundException{ MemberVO vo = memberMapper.read(userName);
 * log.warn("------------------------Load User By UserName : "+userName);
 * log.warn("----------------------Queried By MemberMapper : "+vo); return
 * vo==null?null:new CustomUser(vo); if (vo == null) { throw new
 * UsernameNotFoundException("User not found"); } else {
 * System.out.println("login------------------"); return new CustomUser(vo); } }
 * }
 */

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
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberVO member = memberMapper.read(username);

        if (member == null) {
            throw new UsernameNotFoundException("User not found: " + username);
        }

        // MemberVO 클래스에서 정의한 권한 가져오기
        int auth = member.getAuth();
        List<GrantedAuthority> authorities = new ArrayList<>();

        if (auth == 1) {
            authorities.add(new SimpleGrantedAuthority("ADMIN"));
        } else if (auth == 2) {
            authorities.add(new SimpleGrantedAuthority("TUTOR"));
        } else {
            authorities.add(new SimpleGrantedAuthority("MEMBER"));
        }
        
        UserDetails userDetails = new User(username, member.getUserpw(), authorities);

        return userDetails;
    }
}
