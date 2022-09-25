package kr.co.ictedu.find;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class FindService {
	
	@Autowired
	private FindDAO dao;
	
	// 아이디 찾기
		public String find_id(HttpServletResponse response, String memail) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String mid = dao.find_id(memail);
			
			if (mid == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return mid;
			}
		}//find_id
		
		
		// 비밀번호 찾기
				public String find_pw(HttpServletResponse response, String mid) throws Exception {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					String mpwd = dao.find_pw(mid);
					
					if (mpwd == null) {
						out.println("<script>");
						out.println("alert('가입된 아이디가 없습니다.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return mpwd;
					}
				}//find_pw


				public MemberDTO findPWD(MemberDTO dto) {
					dto = dao.findPWD(dto);
					return dto;
				}


				public int changePWD(MemberDTO dto) {
					int changeCount = 0;
					changeCount = dao.changePWD(dto);
					return changeCount;
				}
		
}//class
