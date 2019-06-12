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

//AuthenticationProvider�� ����ϴ� Ŭ����
//Autowired�� ������ ���̹Ƿ� scan�� �� �� �ֵ��� @Component Annotation�� �ٿ���
@Component
public class UserAuthenticationProvider implements AuthenticationProvider {
 
	//���������� ���� ������ �����ϴ� service ��ü
    @Autowired
    Mapper mapper;
 
    //Spring Security�� ������ �����ϱ� ���ؼ� ȣ���� ���ִ� �޼ҵ�
    //�� �޼ҵ�� �Ѱ����� authentication ���ڸ� �̿��ؼ� ������� �Է°��� ��� ������ ����
    //������ �������� ��� Authentication �������̽��� ������ ��ü�� ��ȯ�ϰ� ������ ��� ���ܸ� �߻�
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //�α��� ���������� username �Ķ���ͷ� ������ ���� ����
    	//������ �ڵ忡�� usernameParameter�� �̸��� "id"�� ���������Ƿ� �α��� ���������� id �Ķ���ͷ� ���۵� ���� ���⼭ �����
    	String id = authentication.getName();
    	
    	//�α��� ���������� password �Ķ���ͷ� ������ ���� ����
        String password = (String) authentication.getCredentials();
        
        LoginVO loginVO = new LoginVO();
        loginVO.setId(id);
        loginVO.setPassword(password);
 
        //service.authenticate()�� ������ ������ �� ������ �������� ��� ��ϵ� ������� ������ UserVO ��ü�� ��Ƽ� ��ȯ 
        //������ ������ ��쿡�� null�� ��ȯ
        UserDTO userDTO = mapper.authenticate(loginVO);
        if (userDTO == null) {
        	//���� ���� �� AuthenticationException ���ܸ� �߻�
        	//AuthenticationException�� ����ϴ� ���� Exception �� BadCredentialsException�� ���
            throw new BadCredentialsException("Login Error !!");
        }
        //��ȯ�� UserVO ��ü�� �Լ� �������� ��ȯ�� Authentication ��ü�� pincipal �Ķ���ͷ� ������ ��ȹ�̹Ƿ� password ���� �ΰ��� ������ ����
        //�� ��ü�� �ٸ� �ڵ忡���� Security Context�� ���ؼ� ������ �����ϱ⶧���� �ΰ��� ������ �̸� ������ �δ� ��
        userDTO.setPassword(null);
 
        //����� ����(authority) ������ ���� ����
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + userDTO.getGrade()));

        //System.out.println(authorities.get(0));
        //System.out.println("ROLE_" + userDTO.getGrade());

        /* Authentication �������̽��� ������ UsernamePasswordAuthenticationToken Ŭ������ �����ؼ� ��ȯ
         * �� Ŭ������ Spring Security���� �����Ǵ� Ŭ�����ε� ��κ��� ��쿡 ����ϱ� ����
         * UsernamePasswordAuthenticationToken�� ������ �� ù ��° ����(principal)�� userVO�� ���� ����
         * (16 ���ο��� password ������ ������ ������ ���⼭ �Ķ���ͷ� �������ϸ� �ٸ� �ڵ忡�� ������ �����ϱ� ����) 
         * ���� principal �Ķ���Ϳ� ����� �̸��� �����ϴµ� ���ڿ� ���� ���ϴ� ��ü�� ������ �� �����Ƿ� ����
         * �� ��° ����(credential)�� ���� ������ �Ϸ�� �Ŀ��� �������� �ʴ� �� ���Ȼ� �����ϹǷ� null�� ����
         * �� ��° ���ڴ� 51~52���ο��� ������ authority list�� �Ѱ��ָ� ��*/
        return new UsernamePasswordAuthenticationToken(userDTO, null, authorities);
    }
 
    //�� AuthenticationProvider�� �����ϴ� Ŭ������ �Ǵ��ϴ� �޼ҵ�
    //boilerplate ���� �ڵ�. �״�� ����ϸ� ��
    @Override
    public boolean supports(Class authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}