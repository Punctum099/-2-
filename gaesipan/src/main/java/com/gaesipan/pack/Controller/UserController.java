package com.gaesipan.pack.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gaesipan.pack.DTO.LoginVO;
import com.gaesipan.pack.DTO.UserDTO;
import com.gaesipan.pack.mapper.Mapper;

@Controller
public class UserController {	
	
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
    private Mapper mapper;

	@GetMapping("/soft/login")	//SecurityConfig에서 경로 설정 가능
    public String login(@ModelAttribute("loginVO") LoginVO loginVO, Model model) {
        return "login";
    }

	@GetMapping("/soft/sign_up_view")
	public String sign_up_view(Model model){
		return "sign_up_view";
	}

	@GetMapping("/soft/userInfo")
	public String userInfo(Model model){
		return "userInfo";
	}
	@GetMapping("/normal/updateUser_view")
	public String updateUser_view(Model model){
		return "updateUser_view";
	}

	@PostMapping("/soft/IdOverlapCheck")
	public @ResponseBody String IdOverlapCheck(@RequestParam("id") String id){

		String check = "Unavailabled";
		
		logger.info("CheckID : " + id);
		int result = mapper.IdOverlapCheck(id);
		logger.info("Check Result : " + Integer.toString(result));
		
		if(result == 0) {
			check = "Availabled";
		}
		
		return check;
	}

	@PostMapping("/soft/PasswordOverlapCheck")
	public @ResponseBody String PasswordOverlapCheck(@RequestParam("pw") String password){

		String check = "Unavailabled";
		
		logger.info("CheckPassword : " + password);
		int result = mapper.PasswordOverlapCheck(password);
		logger.info("Check Result : " + Integer.toString(result));
		
		if(result == 0) {
			check = "Availabled";
		}
		
		return check;
	}

	@PostMapping("/soft/NicknameOverlapCheck")
	public @ResponseBody String NicknameOverlapCheck(@RequestParam("nickname") String nickname){

		String check = "Unavailabled";
		
		logger.info("CheckNickname : " + nickname);
		int result = mapper.NicknameOverlapCheck(nickname);
		logger.info("Check Result : " + Integer.toString(result));
		
		if(result == 0) {
			check = "Availabled";
		}
		
		return check;
	}

	@PostMapping("/soft/EmailOverlapCheck")
	public @ResponseBody String EmailOverlapCheck(@RequestParam("email") String email){

		String check = "Unavailabled";
		
		logger.info("CheckEmail : " + email);
		int result = mapper.EmailOverlapCheck(email);
		logger.info("Check Result : " + Integer.toString(result));
		
		if(result == 0) {
			check = "Availabled";
		}
		
		return check;
	}

	@PostMapping("/soft/TelOverlapCheck")
	public @ResponseBody String TelOverlapCheck(@RequestParam("tel") String tel){

		String check = "Unavailabled";
		
		logger.info("CheckTel : " + tel);
		int result = mapper.TelOverlapCheck(tel);
		logger.info("Check Result : " + Integer.toString(result));
		
		if(result == 0) {
			check = "Availabled";
		}
		
		return check;
	}

	@PostMapping("/soft/sign_up")
	public String sign_up(@ModelAttribute("userDTO") UserDTO userDTO, Model model){

		logger.info("userDTO : " + userDTO);
		logger.info("userDTO.getId() : " + userDTO.getId());
		logger.info("userDTO.getPassword() : " + userDTO.getPassword());
		
		mapper.sign_up(userDTO);
		
		LoginVO loginVO = new LoginVO();

		loginVO.setId(userDTO.getId());
		loginVO.setPassword(userDTO.getPassword());
		
		model.addAttribute("loginVO", loginVO);
		
		return "login";
	}

	@PostMapping("/normal/updateUser")
	public String updateUser(@ModelAttribute("loginVO") LoginVO loginVO, 
							 @RequestParam("id") String id,
							 @RequestParam("password") String password, 
							 @RequestParam("local_email") String local_email, 
							 @RequestParam("domain_email") String domain_email, Model model){

		logger.info("id : " + id);
		logger.info("password : " + password);
		logger.info("email : " + local_email + "@" + domain_email);
		
		UserDTO userDTO = new UserDTO();

		userDTO.setId(id);
		userDTO.setPassword(password);
		userDTO.setLocal_email(local_email);
		userDTO.setDomain_email(domain_email);
		
		mapper.updateUser(userDTO);
		
		SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false); 
		
		return "login";
	}

	@PostMapping("/normal/deleteUser")
	public String deleteUser(@ModelAttribute("loginVO") LoginVO loginVO, @RequestParam("seq") String seq, @RequestParam("password") String password, Model model){

		logger.info("userSeq : " + seq);
		logger.info("userPassword : " + password);
		
		UserDTO userDTO = mapper.userInfo(seq);
		
		if(userDTO.getPassword().equals(password)) {
			mapper.deleteUser(seq);
		}else {
			return "wrongPassword";
		}
		
		SecurityContextHolder.getContext().getAuthentication().setAuthenticated(false); 
		
		return "login";
	}
	
}
