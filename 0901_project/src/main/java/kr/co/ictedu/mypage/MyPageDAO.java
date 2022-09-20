package kr.co.ictedu.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.dto.CGVReserveDto;
import kr.co.ictedu.util.dto.MemberDTO;


@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;

	public MemberDTO infoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = sqlSession.selectOne("MyPageMapper.infoSelect", mem_no);
		
		return dto;
	}

	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = sqlSession.update("MyPageMapper.infoUpdate", dto);
		
		return updateYN;
	}

	public int memDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = sqlSession.delete("MyPageMapper.memDelete", dto);
		return deleteYn;
	}

	public List<CGVReserveDto> orderList(String mem_no) {
		List<CGVReserveDto> list = null;
		list = sqlSession.selectList("MyPageMapper.orderList", mem_no);
		
		return list;
	}

	public List<CGVReserveDto> recentOrder(String mem_no) {
		List<CGVReserveDto> list = null;
		list = sqlSession.selectList("MyPageMapper.recentOrder", mem_no);
		
		return list;
	}

}
