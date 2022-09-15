package kr.co.ictedu.map.kakao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;

@Repository
public class KakaoMapDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<MemberDTO> selectAllMember() {
		List<MemberDTO> list = null;
		list = sqlSession.selectList("KakaoMapMapper.selectAllMember");
		return list;
	}//selectAllMember

}//class
