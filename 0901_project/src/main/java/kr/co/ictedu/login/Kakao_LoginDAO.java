package kr.co.ictedu.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.Kakao_MemberDTO;
import kr.co.ictedu.util.dto.MemberDTO;



@Repository
public class Kakao_LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
//	public int join( Naver_MemberDTO dto ) {
//		int successCount = 0;
//		successCount = sqlSession.insert("JoinMapper.naver_join", dto);
//		return successCount;
//	}//join

	
	public MemberDTO login( Kakao_MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = sqlSession.selectOne("LoginMapper.kakao_login", dto);
		return dtoFromDB;
	}//login
	

	
	
}//class
