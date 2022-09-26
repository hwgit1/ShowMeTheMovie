package kr.co.ictedu.join;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
@RequestMapping( value = "/join" )
public class JoinController {

	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;
	
	@Autowired JavaMailSender mailSender;
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("memail") String memail) throws Exception{
		//화면에서 보낸 ID, Email로 회원정보를 확인한다.(회원번호를 가져와야함)
		//회원정보가 일치하지 않으면, 오류 메세지를 출력하는 화면으로  리턴.
	    int serti = (int)((Math.random() * (99999 - 10000 + 1)) + 10000);
	    //회원번호와 만들어진 난수를 회원정보테이블에 업데이트 후 저장시킨다.
	    
	    
	    String from = "showmethemv@naver.com";//보내는 이 메일주소
	    String to = memail;
	    String title = "쇼미더 무비 회원가입 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
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
	}//mailCheck

	@RequestMapping( value = "/", method = RequestMethod.POST )
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join

	@RequestMapping( value = "/id_chk", method = RequestMethod.GET )
	public void idCheck( String mid, PrintWriter out ) {
		int isYN = 0;
		isYN = service.idCheck( mid );
		out.print(isYN);
		out.close();
	}//idCheck
	
	@RequestMapping ( value = "/email_validate", method = RequestMethod.GET )
	public void emailValidate( String memail, PrintWriter out ) {
		int emYN = 0;
		emYN = service.emailValidate( memail );
		out.print(emYN);
		out.close();
	}//emailValidate

	@RequestMapping( value = "/form", method = RequestMethod.GET )
	public String joinForm() {
		return "/join/join_form";//jsp file name
	}//joinForm

}//class
