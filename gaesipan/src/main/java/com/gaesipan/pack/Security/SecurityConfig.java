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
	
	//Ŀ���� ������ �����ϴ� Ŭ����
	@Autowired
    private UserAuthenticationProvider authenticationProvider;
 
	//Spring Security�� ������ �����ϴ� �޼ҵ�. �ʼ� �޼ҵ�. �� ���� ���� ����
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	
    	//SE2�� ����ϱ� ���� ������ ���ȿɼ��� �����.
    	http.headers().frameOptions().sameOrigin();
    	
    	//������ �ʿ����� ���� ��ο� ������ �ʿ��� ��θ� ����
    	//���⼭�� ������ �߿�. �տ������� �˻��ؼ� ��Ī�� �Ͼ�� �ٷ� ��Ģ�� ����Ǿ� �� ���� ��Ģ�� ���õǹǷ� �켱������ ����Ͽ� ������ ���ؾ� �� 
        http.authorizeRequests()
        		//'/soft/**' ��ο� ���� �ڿ��� ���ؼ��� ���� ���� ������ �����ϵ��� ������ ���
                .antMatchers("/css/**", "/js/**", "/img/**","/soft/**", "/list").permitAll()
                
                //"/normal/**" ��ο� ���ؼ� ROLE_ADMIN, ROLE_USER �߿� ��� �ϳ��� ������ �־�� ������ ����
                //�������� ��Ģ�� ���⿡ �ش������� ���� ����Ǿ��ֱ� ������ �� ��Ģ�� �켱 ����� ���� ����.
                .antMatchers("/normal/**", "/write_view", "/modify_view").hasAnyRole("ADMIN", "USER") // ���������� ���ξ� "ROLE_"�� �ٴ´�.
                
                //'/hard/**' ��ο� ���ؼ��� "ROLE_ADMIN" ������ �־�� ������ ����
                .antMatchers("/hard/**").hasRole("ADMIN") // ���������� ���ξ� "ROLE_"�� �ٴ´�.
                
                //��Ÿ ������ ��û�� ���ؼ��� ������ ����ڸ� ������ �ǵ��� ����
                .anyRequest().authenticated();
 
        //�α��� ���� ���õ� ����
        http.formLogin()
        		//�α��� UI�� �����ϴ� �������� ��θ� ���� 
        		//���⼭ ������ ��ΰ� Controller�� GET ��û���� ����
                .loginPage("/soft/login") // default
                
                //������ ó���ϴ� ��θ� ����. ��, �α��� �������� form �±׿��� action �Ӽ��� ������ URL 
                //�� ��δ� Controller�� ������ ��û�� �ƴϰ� Spring Security���� ��û�� ����ä�� ���� ��ƾ�� ��������. 
                .loginProcessingUrl("/authenticate")
                
                //���� ���� �� ���ư� ��θ� ����
                .failureUrl("/soft/login?error") // default
                
                //������ �����ϸ� ���� �����Ϸ��� �ߴ� ��η� ���ư��� �� �⺻ ����
                //ó������ �α��� �������� ��û�� ����� ���ư� ��ΰ� �����Ƿ� �� ���� ���⼭ ������ URL�� �̵�
                .defaultSuccessUrl("/list")
                
                //�α��� ���������� �����ϴ� username �Ķ������ �̸��� �������� ����
                .usernameParameter("id")
                
                //�α��� ���������� �����ϴ� password �Ķ������ �̸��� �������� ����
                .passwordParameter("password")
                
                //�α��� �������� ������ ���� ����ϵ��� ����
                .permitAll();
 
        //�α׾ƿ� ���õ� ����. �⺻ �α׾ƿ� URL�� "/logout"
        http.logout()
        		//�α׾ƿ� ��θ� ����
                .logoutUrl("/logout") // default
                
                //�α׾ƿ� �Ŀ� �̵��� ��θ� ����
                .logoutSuccessUrl("/list")
                
                //�α׾ƿ� ����� ������ ���� ���
                .permitAll();
    }
 
    //Ŀ���� ������ ������ (16 ���ο��� Autowired�� ���Ե�) authenticationProvider�� AuthenticationManagerBuilder�� AuthenticationProvider�μ� �߰�
    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider);
    }
}
