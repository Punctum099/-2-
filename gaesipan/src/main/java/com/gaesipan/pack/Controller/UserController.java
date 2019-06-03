package com.gaesipan.pack.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.gaesipan.pack.DTO.LoginVO;

@Controller
public class UserController {

	@GetMapping("/login")	//SecurityConfig���� ��� ���� ����
    public String login(@ModelAttribute("loginVO") LoginVO loginVO, Model model) {
        return "login";
    }
	
}
