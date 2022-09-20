package kr.co.ictedu.login;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ictedu.util.dto.Kakao_MemberDTO;
import kr.co.ictedu.util.dto.MemberDTO;

import java.io.IOException;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService service;
	@Autowired
	private Kakao_LoginService k_service;

	@RequestMapping( value = "/test2", method = RequestMethod.GET )
	public String test2( HttpSession session ) {//카카오 페이지 test용
		return "/join/join_form_kakao";//jsp file name
	}//test2

/*<============== Kakao 로그인  시작 ==============> */
	
	@RequestMapping(value="/login/kakao_login", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Kakao_MemberDTO dto, HttpSession session) throws Exception {
		try {
			
			System.out.println("#########" + code);
			String access_Token = k_service.getAccessToken(code);
			//Kakao_LoginService에서 access_Token을 받아옴 
			System.out.println( "check" + access_Token);
			HashMap<String, Object> userInfo = k_service.getUserInfo(access_Token);
			//Kakao_LoginService에서 받아온 access_Token을 이용하여 userInfo(유저정보를 받아옴)
			System.out.println("###access_Token#### : " + access_Token);
			System.out.println("###nickname#### : " + userInfo.get("nickname"));
			System.out.println("###email#### : " + userInfo.get("email"));
			
			//받아온 유저정보를 Kakao_MemberDTO에 넣음
			dto.setNickname((String) userInfo.get("nickname"));
			dto.setEmail((String) userInfo.get("email"));
			
			// Kakao_MemberDTO에 담긴 값을 확인
			logger.info( dto.toString() );
			
			MemberDTO dtoFromDB = null;
			System.out.println("시작 전 dto : " + dtoFromDB);
			dtoFromDB = k_service.login( dto ); //k_service.login를 통해 로그인 여부 확인
			
			if( dtoFromDB == null ) {//회원 가입 이력이 없는 사용자
				session.setAttribute("kakao_login_info", dto); 
				// 미가입의 경우 api에서 전달 받은 값을 넣은 dto를 회원가입 페이지에서 로딩하기위해 kakao_login_info 세션에 정보 탑재
				return "/join/join_form_kakao";//카카오 회원가입 페이지로 이동 
			
			} else if ( dtoFromDB != null && dtoFromDB.getMname() != null && dtoFromDB.getMname() != "") {
				// 회원가입 이력이 있을경우
				session.setAttribute("login_info", dtoFromDB);
				
			}//login
			
			
			return "home";
			
		} catch (Exception e) {
			return "/login/login_form";
		}
		
		
		
		
		
	}//kakaoLogin
	
	/*<============== Kakao 로그인  끝==============> */
	

	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String logout( HttpSession session ) {
		session.invalidate();
		return "home";//jsp file name
	}//logout

	@RequestMapping( value = "/login", method = RequestMethod.POST )
	public void login( MemberDTO dto, PrintWriter out, HttpSession session ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = service.login( dto );
		if( dtoFromDB == null ) {
			out.print(0);//아이디 없는 사용자 또는 패스워드 오류 사용자.
		} else if( dtoFromDB != null && dtoFromDB.getMno() != null && dtoFromDB.getMno() != "" ) {
			out.print(1);//아이디, 패스워드 모두 OK
			session.setAttribute("login_info", dtoFromDB);
		}
		out.close();

	}//login
	
	

	@RequestMapping( value = "/login_form", method = RequestMethod.GET )
	public String loginForm() {
		return "/login/login_form";//jsp file name
	}//loginForm
	
	
}//class

/*
drop table member;

create table member (
  mno int not null auto_increment,
  mid varchar(20) not null,
  mpwd varchar(20) not null,
  tel varchar(15) default null,
  email varchar(50) default null,
  mdate datetime not null,
  service_agree varchar(5) not null default 'true',
  info_agree varchar(5) not null default 'true',
  sms_agree varchar(5) not null default 'false',
  email_agree varchar(5) not null default 'false',
  post_code varchar(10) default null,
  addr1 varchar(150) default null,
  addr2 varchar(150) default null,
  primary key (mno)
);
*/
