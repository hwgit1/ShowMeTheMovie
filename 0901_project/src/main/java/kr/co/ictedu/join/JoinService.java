package kr.co.ictedu.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class JoinService {

	@Autowired
	private JoinDAO dao;

	public int join( MemberDTO dto ) {
		int successCount = 0;

		if( dto.getMtel1() != null && !dto.getMtel1().equals("")
			&& dto.getMtel2() != null && !dto.getMtel2().equals("")
			&& dto.getMtel3() != null && !dto.getMtel3().equals("") ) {
			dto.setMtel( dto.getMtel1() + "-" + dto.getMtel2() + "-" + dto.getMtel3() );
		}

		if( dto.getMemail() != null && !dto.getMemail().equals("")) {
			dto.setMemail( dto.getMemail() );
		}

		successCount = dao.join( dto );
		return successCount;
	}//join

	public int idCheck( String mid ) {
		int isYN = 0;
		isYN = dao.idCheck( mid );
		return isYN;
	}//idCheck
	
	public int emailValidate( String memail ) {
		int emYN = 0;
		emYN = dao.emailValidate( memail );
		return emYN;
	}//emailValidate
	
	 

}//class
