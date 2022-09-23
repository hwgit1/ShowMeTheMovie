package kr.co.ictedu.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class MemberBoardService {

	@Autowired
	private MemberBoardDAO dao;

	public int update( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public int delete( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public MemberBoardDTO detail( String board_no ) {
		dao.incrementViewCnt( board_no );

		MemberBoardDTO dto = null;
		dto = dao.detail( board_no );
		return dto;
	}//detail

	public int write( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.write( dto );
		return successCount;
	}//write

	public List<MemberBoardDTO> searchList( SearchDTO dto ) {
		List<MemberBoardDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

}//class






