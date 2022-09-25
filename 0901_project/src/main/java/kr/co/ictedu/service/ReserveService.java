package kr.co.ictedu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.dao.ReserveSeatDao;
import kr.co.ictedu.dto.CGVReserveDto;
import kr.co.ictedu.dto.ReserveSeatDto;
import kr.co.ictedu.dto.SelectedDto;
import kr.co.ictedu.login.LoginDAO;
import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class ReserveService {

	@Autowired
	private ReserveSeatDao dao;
	
	@Autowired
	private LoginDAO daoo;
	
	public List<ReserveSeatDto> seat(String seatreserve_date) {
		
		List<ReserveSeatDto> list = null;
		list = dao.seat(seatreserve_date);
		
		return list;
	}

	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = daoo.login( dto );
		return dtoFromDB;
	}//login
	
	public int CGVReserve(CGVReserveDto dto) {
		int isSuccess = 0;
		System.out.println(isSuccess + "DAO 넘어가기 전");
		isSuccess = dao.order(dto);
		System.out.println(isSuccess);
		
		return isSuccess;
	}
	
	public ReserveSeatDto seatcnt(CGVReserveDto dto) {
		ReserveSeatDto dtoo = null;
		dtoo = dao.seatcnt(dto);
		
		return dtoo;
	}

	public List<SelectedDto> selectedseat(CGVReserveDto dto) {
		List<SelectedDto> list = null;
		list = dao.selectedseat(dto);
		
		return list;
	}

	
}
