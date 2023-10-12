package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException{
		MemberVO vo = memberMapper.read(userName);
		log.warn("------------------------Load User By UserName : "+userName);
		log.warn("----------------------Queried By MemberMapper : "+vo);
		/* return vo==null?null:new CustomUser(vo); */
		if (vo == null) {
			throw new UsernameNotFoundException("User not found");
		}
		return new CustomUser(vo);	        
	}
}
