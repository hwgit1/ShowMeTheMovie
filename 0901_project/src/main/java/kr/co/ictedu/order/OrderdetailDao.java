package kr.co.ictedu.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.dto.CGVReserveDto;

@Repository
public class OrderdetailDao {
	
	@Autowired
	SqlSession sqlSession;
	

	public int orderdetail(orderdetailDto dto) {
		int isSuccess = 0;
		System.out.println(isSuccess + "Mapper 들어갑니다");
		isSuccess = sqlSession.insert("OrderMapper.order_detail", dto);
		System.out.println(isSuccess);
		
		
		return isSuccess;
	}
	

}
