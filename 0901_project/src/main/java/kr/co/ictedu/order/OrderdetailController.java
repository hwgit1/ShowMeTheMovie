package kr.co.ictedu.order;

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

import kr.co.ictedu.board.MemberBoardDTO;

//import com.mysql.cj.Session;

import kr.co.ictedu.dto.ReserveSeatDto;
import kr.co.ictedu.order.orderdetailDto;
import kr.co.ictedu.service.ReserveService;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.service.CGVReserveService;


@Controller
@RequestMapping( value = "/order" )
public class OrderdetailController {

	@Autowired
	OrderdetailService service;
	CGVReserveService cgvReserveService;
	
	
	private static Logger logger = LoggerFactory.getLogger(OrderdetailController.class);
	
	@RequestMapping( value = "/paySuccess", method = RequestMethod.GET )
	public String paySuccess() {
		return "paySuccess";
	}
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert(Model model, orderdetailDto dto, HttpSession session, PrintWriter out) {
		MemberDTO login =(MemberDTO)session.getAttribute("login_info");
		logger.info(login.getMid());
		System.out.println(">>>>>>>>>>" + dto.getDetailorder_id());
		System.out.println(">>>>>>>>>>" + dto.getDetailorder_title());
		System.out.println(">>>>>>>>>>" + dto.getDetailorder_no());
		System.out.println(">>>>>>>>>>" + dto.getDetailorder_pay());
		System.out.println(">>>>>>>>>>" + dto.getDetailorder_ticketNumber());
		String id = login.getMid();
		System.out.println(dto.toString());
		int isSuccess = 0;
		isSuccess = service.orderdetail(dto);
		System.out.println(isSuccess);
		model.addAttribute("orderdetail", dto);
		out.print(isSuccess);
		out.close();
		
	}//insert

	
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







