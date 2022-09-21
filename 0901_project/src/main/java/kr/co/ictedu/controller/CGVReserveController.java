package kr.co.ictedu.controller;

import java.awt.Window;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.mysql.cj.Session;

import kr.co.ictedu.dto.CGVPayDto;
import kr.co.ictedu.dto.CGVReserveDto;
import kr.co.ictedu.dto.ReserveSeatDto;
import kr.co.ictedu.service.ReserveService;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.service.CGVReserveService;


@Controller
public class CGVReserveController {

	@Autowired
	ReserveService service;
	CGVReserveService cgvReserveService;
	
	
	private static Logger logger = LoggerFactory.getLogger(CGVReserveController.class);
	
	@RequestMapping(value="moveReserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveReserve(String seatreserve_date, Model model,CGVReserveDto dtoo, ReserveSeatDto dto, HttpSession session) {
		logger.info("moveReserve");
		MemberDTO login =(MemberDTO)session.getAttribute("login_info");
		
		List<ReserveSeatDto> list = null;
		System.out.println(seatreserve_date);
		list = service.seat(seatreserve_date);
		model.addAttribute("list", list);
//		dto = null;
//		dto = service.seat(reverve_date);
//		model.addAttribute("seat", dto);
//		System.out.println(dto.toString());
//		System.out.println(dto.getReverve_date());
//		System.out.println(seatreserve_date+"seatreserve_date 컨트롤러");
//		System.out.println(list.size()+"list.size컨트롤러");
		return "reserve";
	}
	
//	@RequestMapping(value="seatReserve.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public String seatReserve(String seatreserve_date, Model model,CGVReserveDto dtoo, ReserveSeatDto dto, HttpSession session) {
//		logger.info("seatReserve");
//		
//		return "reserve";
//	}
	
	
	@RequestMapping(value="moveSeat.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveSeat(Model model, CGVReserveDto dto, HttpSession session) {
		MemberDTO login =(MemberDTO)session.getAttribute("login_info");
		                                                                                                                                                                                                                                                                                                                            
		logger.info(login.getMid());
		String id = login.getMid();
		dto.setId(id);
		System.out.println(dto.toString());
		logger.info("moveSeat");
		model.addAttribute("reserve", dto);
		
		return "seat";
	}
	

	@RequestMapping(value="moveKakao.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveKakao(Model model, CGVReserveDto dto, CGVPayDto payDto, HttpSession session) {	
		MemberDTO login =(MemberDTO)session.getAttribute("login_info");
		logger.info(login.getMid());
		String id = login.getMid();
		dto.setId(id);
		System.out.println(dto.toString());
		logger.info("moveKakao");
		int isSuccess = 0;
		System.out.println(isSuccess + "서비스 들어가기 전");
		isSuccess = service.CGVReserve(dto);
		System.out.println(isSuccess);
//		model.addAttribute("reserve", dtoo);
//		model.addAttribute("pay", payDto);
//		if(isSuccess == false) {
//			System.out.println("오류가 났어요...");
//			return "redirect:/moveMain.do";
//		}
		return "main";
	}

//	
//	@RequestMapping(value="payKakao.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public String payKakao(Model model, CGVReserveDto dto, CGVPayDto payDto, HttpSession session) {	
//		
//		logger.info("moveKakao");
////		CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
//	
////		 dto.setId(login.getId());
//		 System.out.println(dto.toString() +"이것이 dto다");
//		 List<CGVReserveDto> list = cgvReserveService.getCGVReserve(dto);
//		/* CGVReserveDto cgvReserveDto = cgvReserveService.getCGVReserve(dto); */
////		if(cgvReserveDto != null) {
//			System.out.println("여기있다");
////			System.out.println(cgvReserveDto.toString());
////		}
//		payDto.setId(list.get(0).getId());
//		payDto.setReserveSequence(list.get(0).getReserveSequence());
//		System.out.println("문제찾기");
////		System.out.println(payDto.toString());
////		boolean isSuccess = cgvPayService.payTicket(payDto);
////		System.out.println(isSuccess);
////		if(isSuccess == false) {
////			System.out.println("오류가 났어요...");
////			return "redirect:/moveMain.do";
////		}
//		model.addAttribute("type", "reserve");
////		model.addAttribute("isSuccess", isSuccess);
//		/*
//		 * model.addAttribute("reserve", dto); model.addAttribute("pay", payDto);
//		 */
//		
//		return "process";
//	}
//	
//	@RequestMapping(value="moveMypage.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public String moveMain(Model model, CGVReserveDto reserveDto, CGVPayDto payDto, HttpSession session) {
////		CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
//		
//		 
////		reserveDto.setId(login.getId());
//		List<CGVReserveDto> list = cgvReserveService.getPayJoinTable(reserveDto);
//		
//		if(list != null) {
//			for(CGVReserveDto dto : list) {
//				System.out.println(dto.toString());
//				model.addAttribute("reserveList", list);
//			}
//		}else {
//			System.out.println("이것이 오류다");
//		}
//		
//		return "myPage";
//	}
}







