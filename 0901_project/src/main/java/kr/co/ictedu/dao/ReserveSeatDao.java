package kr.co.ictedu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.dto.CGVReserveDto;
import kr.co.ictedu.dto.ReserveSeatDto;

@Repository
public class ReserveSeatDao {
	
	@Autowired
	SqlSession sqlSession;
	

	public List<ReserveSeatDto> seat(String seatreserve_date) {
		
		List<ReserveSeatDto> list = null;
		list = sqlSession.selectList("SeatMapper.seat", seatreserve_date);
		System.out.println(list);
		return list;
	}//seat


	public int order(CGVReserveDto dto) {
		int isSuccess = 0;
		System.out.println(isSuccess + "Mapper 들어갑니다");
		isSuccess = sqlSession.insert("SeatMapper.order", dto);
		System.out.println(isSuccess);
		
		
		return isSuccess;
	}
	

}