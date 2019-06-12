package com.gaesipan.pack.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	//커스텀 인증을 구현하는 클래스
	@Autowired
    private UserAuthenticationProvider authenticationProvider;
 
	//Spring Security의 설정을 구현하는 메소드. 필수 메소드. 더 많은 설정 가능
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
    	//SE2를 사용하기 위해 프레임 보안옵션을 꺼줬다.
    	http.headers().frameOptions().sameOrigin();
    	
    	//인증이 필요하지 않은 경로와 인증이 필요한 경로를 설정
    	//여기서는 순서가 중요. 앞에서부터 검사해서 매칭이 일어나면 바로 규칙이 적용되어 그 뒤의 규칙은 무시되므로 우선순위를 고려하여 순서를 정해야 함 
        http.authorizeRequests()
        		//'/soft/**' 경로와 정적 자원에 대해서는 인증 없이 접근이 가능하도록 완전히 허용
                .antMatchers("/css/**", "/js/**", "/img/**","/soft/**", "/list").permitAll()
                
                //"/normal/**" 경로에 대해서 ROLE_ADMIN, ROLE_USER 중에 어느 하나라도 권한이 있어야 접근이 가능
                //위라인의 규칙도 여기에 해당하지만 먼저 선언되어있기 때문에 이 규칙이 우선 적용될 일은 없다.
                .antMatchers("/normal/**", "/write_view", "/modify_view").hasAnyRole("ADMIN", "USER") // 내부적으로 접두어 "ROLE_"가 붙는다.
                
                //'/hard/**' 경로에 대해서는 "ROLE_ADMIN" 권한이 있어야 접근이 가능
                .antMatchers("/hard/**").hasRole("ADMIN") // 내부적으로 접두어 "ROLE_"가 붙는다.
                
                //기타 나머지 요청에 대해서는 인증된 사용자만 접근이 되도록 설정
                .anyRequest().authenticated();
 
        //로그인 폼에 관련된 설정
        http.formLogin()
        		//로그인 UI를 제공하는 페이지의 경로를 설정 
        		//여기서 지정된 경로가 Controller에 GET 요청으로 들어옴
                .loginPage("/soft/login") // default
                
                //인증을 처리하는 경로를 지정. 즉, 로그인 페이지의 form 태그에서 action 속성에 지정할 URL 
                //이 경로는 Controller로 들어오는 요청은 아니고 Spring Security에서 요청을 가로채서 인증 루틴을 실행해줌. 
                .loginProcessingUrl("/authenticate")
                
                //인증 실패 시 돌아갈 경로를 설정
                .failureUrl("/soft/login?error") // default
                
                //인증이 성공하면 원래 접근하려고 했던 경로로 돌아가는 게 기본 동작
                //처음부터 로그인 페이지를 요청한 경우라면 돌아갈 경로가 없으므로 이 때는 여기서 지정된 URL로 이동
                .defaultSuccessUrl("/list")
                
                //로그인 페이지에서 제공하는 username 파라메터의 이름이 무엇인지 지정
                .usernameParameter("id")
                
                //로그인 페이지에서 제공하는 password 파라메터의 이름이 무엇인지 지정
                .passwordParameter("password")
                
                //로그인 페이지의 접근을 완전 허용하도록 설정
                .permitAll();
 
        //로그아웃 관련된 설정. 기본 로그아웃 URL은 "/logout"
        http.logout()
        		//로그아웃 경로를 지정
                .logoutUrl("/logout") // default
                
                //로그아웃 후에 이동할 경로를 지정
                .logoutSuccessUrl("/list")
                
                //로그아웃 경로의 접근을 완전 허용
                .permitAll();
    }
 
    //커스텀 인증을 구현한 (16 라인에서 Autowired로 주입된) authenticationProvider를 AuthenticationManagerBuilder에 AuthenticationProvider로서 추가
    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider);
    }
}
