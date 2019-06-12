package com.gaesipan.pack.Security;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.gaesipan.pack.DTO.LoginVO;
import com.gaesipan.pack.DTO.UserDTO;
import com.gaesipan.pack.mapper.Mapper;

//AuthenticationProvider를 상속하는 클래스
//Autowired로 주입할 것이므로 scan이 될 수 있도록 @Component Annotation을 붙여줌
@Component
public class UserAuthenticationProvider implements AuthenticationProvider {
 
	//실질적으로 인증 로직을 구현하는 service 객체
    @Autowired
    Mapper mapper;
 
    //Spring Security가 인증을 수행하기 위해서 호출을 해주는 메소드
    //이 메소드로 넘겨지는 authentication 인자를 이용해서 사용자의 입력값을 얻고 인증을 수행
    //인증이 성공적인 경우 Authentication 인터페이스를 구현한 객체를 반환하고 실패한 경우 예외를 발생
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //로그인 페이지에서 username 파라메터로 전송한 값을 얻어옴
    	//설정쪽 코드에서 usernameParameter의 이름을 "id"로 설정했으므로 로그인 페이지에서 id 파라메터로 전송된 값이 여기서 얻어짐
    	String id = authentication.getName();
    	
    	//로그인 페이지에서 password 파라메터로 전송한 값을 얻어옴
        String password = (String) authentication.getCredentials();
        
        LoginVO loginVO = new LoginVO();
        loginVO.setId(id);
        loginVO.setPassword(password);
 
        //service.authenticate()가 인증을 수행한 후 인증이 성공적인 경우 등록된 사용자의 정보를 UserVO 객체에 담아서 반환 
        //인증이 실패한 경우에는 null을 반환
        UserDTO userDTO = mapper.authenticate(loginVO);
        if (userDTO == null) {
        	//인증 실패 시 AuthenticationException 예외를 발생
        	//AuthenticationException을 상속하는 여러 Exception 중 BadCredentialsException을 사용
            throw new BadCredentialsException("Login Error !!");
        }
        //반환된 UserVO 객체를 함수 마지막에 반환할 Authentication 객체의 pincipal 파라메터로 전달할 계획이므로 password 같은 민감한 정보는 삭제
        //이 객체는 다른 코드에서도 Security Context를 통해서 접근이 가능하기때문에 민감한 정보는 미리 삭제해 두는 것
        userDTO.setPassword(null);
 
        //사용자 권한(authority) 정보를 만들어서 설정
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + userDTO.getGrade()));

        //System.out.println(authorities.get(0));
        //System.out.println("ROLE_" + userDTO.getGrade());

        /* Authentication 인터페이스를 구현한 UsernamePasswordAuthenticationToken 클래스를 생성해서 반환
         * 이 클래스는 Spring Security에서 제공되는 클래스인데 대부분의 경우에 사용하기 적당
         * UsernamePasswordAuthenticationToken을 생성할 때 첫 번째 인자(principal)로 userVO를 직접 설정
         * (16 라인에서 password 정보를 삭제한 이유가 여기서 파라메터로 전달하하면 다른 코드에서 접근이 가능하기 때문) 
         * 흔히 principal 파라메터에 사용자 이름을 지정하는데 문자열 말고도 원하는 객체를 지정할 수 있으므로 참고
         * 두 번째 인자(credential)도 역시 인증이 완료된 후에는 지정하지 않는 게 보안상 안전하므로 null로 지정
         * 세 번째 인자는 51~52라인에서 생성한 authority list를 넘겨주면 됨*/
        return new UsernamePasswordAuthenticationToken(userDTO, null, authorities);
    }
 
    //이 AuthenticationProvider가 지원하는 클래스를 판단하는 메소드
    //boilerplate 같은 코드. 그대로 사용하면 됨
    @Override
    public boolean supports(Class authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}