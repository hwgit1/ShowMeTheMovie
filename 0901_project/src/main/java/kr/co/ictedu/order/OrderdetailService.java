package kr.co.ictedu.order;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.dao.ReserveSeatDao;
import kr.co.ictedu.dto.CGVReserveDto;


@Service
public class OrderdetailService {

	@Autowired
	private OrderdetailDao dao;
	
	public int orderdetail(orderdetailDto dto) {
		int isSuccess = 0;
		System.out.println(isSuccess + "DAO 넘어가기 전");
		isSuccess = dao.orderdetail(dto);
		System.out.println(isSuccess);
		
		return isSuccess;
	}
	
	
	
	
}
