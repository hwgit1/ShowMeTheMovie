package kr.co.ictedu.find;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ictedu.util.dto.MemberDTO;


@Controller
public class FindController {
	
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@Autowired
	private FindService service;
	
	@Autowired JavaMailSender mailSender;
	
	@RequestMapping(value = "/findPWD", method = RequestMethod.POST)
	@ResponseBody
	public String findPWD(@RequestParam("memail") String memail, String mid, MemberDTO dto) throws Exception{
		System.out.println(memail + "이메일 넘어왔니?");
		System.out.println(mid + "아이디 넘어왔나");
		
		dto.setMid(mid);
		dto.setMemail(memail);
		dto = service.findPWD(dto);
		
		System.out.println(dto.getMno());
		//화면에서 보낸 ID, Email로 회원정보를 확인한다.(회원번호를 가져와야함)
		//회원정보가 일치하지 않으면, 오류 메세지를 출력하는 화면으로  리턴.
		int mno = Integer.parseInt(dto.getMno());
		int serti = (int)((Math.random() * (99999 - 10000 + 1)) + 10000);
		//회원번호와 만들어진 난수를 회원정보테이블에 업데이트 후 저장시킨다.
	    
	    if(mno >= 1) {
	    	
	    	dto.setSerti(serti);
	    	int changeCount = 0;
	    	changeCount = service.changePWD(dto);
	    	
	    	
	    	String from = "showmethemv@naver.com";//보내는 이 메일주소
		    String to = memail;
		    String title = "쇼미더 무비 임시 비밀번호입니다.";
		    String content = "[임시비밀번호는] "+ serti +" 입니다. <br/> 임시비밀번호로 로그인해주십시오.";
		    String num = "";
		    try {
		    	MimeMessage mail = mailSender.createMimeMessage();
		        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
		        
		        mailHelper.setFrom(from);
		        mailHelper.setTo(to);
		        mailHelper.setSubject(title);
		        mailHelper.setText(content, true);       
		        
		        mailSender.send(mail);
		        num = Integer.toString(serti);
		        
		    } catch(Exception e) {
		        num = "error";
		    }
		    return num;
		}//
		return "/login/login_form";
	    
	    }//findPWD
	    
	
	@RequestMapping( value = "/find_id_form.do" )
	public String find_id_form() throws Exception{
		return "/find/find_id_form";
	}//find_id_form
	
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("memail") String memail, Model model) throws Exception{
		model.addAttribute("mid", service.find_id(response, memail));
		return "/find/find_id";
	}//find_id.do
		
	 //비밀번호 찾기 폼
	@RequestMapping(value = "/find_pw_form.do")
	public String find_pw_form() throws Exception{
		return "/find/find_pw_form";
	}//find_pw_form.do
	
	// 비밀번호 찾기
		@RequestMapping(value = "/find_pw.do", method = RequestMethod.POST)
		public String find_pw(HttpServletResponse response, @RequestParam("mid") String mid, Model model, PrintWriter out) throws Exception{
			model.addAttribute("mpwd", service.find_pw(response, mid));
			out.println("<script>");
	         out.println("alert('메일로 임시 비밀번호를 전송하였습니다. 임시 비밀번호로 로그인 해주세요.');");
	         out.println("history.go(-1);");
	         out.println("</script>");
	         out.close();
			return "/login/login_form";
		}//find_pw.do
		
		
		
}//class
