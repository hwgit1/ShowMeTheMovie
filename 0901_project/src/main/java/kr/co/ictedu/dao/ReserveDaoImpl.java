package kr.co.ictedu.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.dto.ReserveDto;


@Repository
public class ReserveDaoImpl implements ReserveDao {

	@Autowired
	SqlSession session;

	@Override
	public boolean CGVReserve(ReserveDto dto) {
		int count = session.insert("CGVReserve", dto);

		return count > 0 ? true : false;
	}

	@Override
	public List<ReserveDto> getCGVReserveList(ReserveDto dto) {
		// TODO Auto-generated method stub
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		list = session.selectList("getCGVReserveList", dto);
		return list;
	}

	@Override
	public List<ReserveDto> getPayJoinTable(ReserveDto dto) {
		List<ReserveDto> list = new ArrayList<ReserveDto>();
		list = session.selectList("selectMapping", dto);
		return list;
	}
	
	

}
