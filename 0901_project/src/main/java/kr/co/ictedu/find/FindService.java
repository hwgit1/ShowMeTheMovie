package kr.co.ictedu.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class FindService {

	@Autowired
	private FindDAO dao;
	
	public MemberDTO findID( MemberDTO dto ) {
		
	}
	
}
