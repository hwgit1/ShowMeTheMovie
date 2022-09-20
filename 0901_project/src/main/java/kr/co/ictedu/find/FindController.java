package kr.co.ictedu.find;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
public class FindController {
	
	private static final Logger logger = LoggerFactory.getLogger(FindController.class);
	
	@Autowired
	private FindService service;
	
	public void findID(MemberDTO dto, PrintWriter out, HttpSession session) {
		
	}
}
