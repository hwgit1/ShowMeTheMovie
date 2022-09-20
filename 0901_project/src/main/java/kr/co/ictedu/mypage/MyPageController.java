package kr.co.ictedu.mypage;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;


import kr.co.ictedu.util.dto.MemberDTO;


@Controller
@RequestMapping(value = "/mypage")
public class MyPageController {
	private final static Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	MyPageService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMno();
		
		return "/mypage/mypage";
	}
	
	
	@RequestMapping(value = "/memdelete", method = RequestMethod.GET)
	public void memdelete( MemberDTO dto, HttpSession session, PrintWriter out ) {
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int deleteYn = 0;
		
		deleteYn = service.memDelete(dto);
	
		System.out.println(dto.toString());
		out.print(deleteYn);
		out.close();
	};
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myInfo(Model model, HttpSession session) {
		MemberDTO dto = null;
		String mem_no = ((MemberDTO)session.getAttribute("login_info")).getMno();
		
			dto = service.infoSelect(mem_no);
		
		logger.info(dto.toString());
		
		model.addAttribute("myinfo", dto);
		
		return "/mypage/myinfo";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
	
	public void infoUpdate( MemberDTO dto, HttpSession session, PrintWriter out) throws IOException {
		
		String mem_no = ((MemberDTO) session.getAttribute("login_info")).getMno();
		
		int updateYn = 0;
		
		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		
			updateYn = service.infoUpdate(dto);
			session.setAttribute("login_info", dto);
		
		System.out.println(dto.toString());
		out.print(updateYn);
		out.close();
	}
}
