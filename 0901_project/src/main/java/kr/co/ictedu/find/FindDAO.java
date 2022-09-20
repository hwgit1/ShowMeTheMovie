package kr.co.ictedu.find;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;

@Repository
public class FindDAO {
	
	private SqlSession sqlSession;
	
	public MemberDTO findID( MemberDTO dto ) {
		
	}
	
}
