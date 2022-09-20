package kr.co.ictedu.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.dao.ReserveSeatDao;
import kr.co.ictedu.dto.CGVReserveDto;


@Service
public class CGVReserveService {

	@Autowired
	private ReserveSeatDao dao;
	
	public int CGVReserve(CGVReserveDto dto) {
		int isSuccess = 0;
		System.out.println(isSuccess + "DAO 넘어가기 전");
		isSuccess = dao.order(dto);
		System.out.println(isSuccess);
		
		return isSuccess;
	}
	
	
	
	
}
