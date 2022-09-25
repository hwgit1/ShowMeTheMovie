package kr.co.ictedu.find;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ictedu.util.dto.MemberDTO;

@Repository
public class FindDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int updatePw(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("FindMapper.update_pw,", dto);
		return successCount;
	}//비밀번호 변경
	
	// 아이디 찾기
	public String find_id(String memail) throws Exception{
		memail = sqlSession.selectOne("FindMapper.find_id", memail);
		return memail;
	}//find_id
	
	// 아이디 찾기
		public String find_pw(String mid) throws Exception{
			mid = sqlSession.selectOne("FindMapper.find_pw", mid);
			return mid;
		}//find_pw

		public MemberDTO findPWD(MemberDTO dto) {
			dto = sqlSession.selectOne("FindMapper.findpwd", dto);
			return dto;
		}

		public int changePWD(MemberDTO dto) {
			int changeCount = 0;
			changeCount = sqlSession.update("FindMapper.changepwd", dto);
			return changeCount;
		}
}
