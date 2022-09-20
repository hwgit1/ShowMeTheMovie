package kr.co.ictedu.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.ictedu.util.dto.MemberDTO;


@Service
public class MyPageService {

	@Autowired
	MyPageDAO dao;
	
	public MemberDTO infoSelect(String mem_no) {
		MemberDTO dto = null;
		dto = dao.infoSelect(mem_no);
		
		return dto;
	}

	public int infoUpdate(MemberDTO dto) {
		int updateYN = 0;
		updateYN = dao.infoUpdate(dto);
		
		return updateYN;
	}

	public int memDelete(MemberDTO dto) {
		int deleteYn = 0;
		deleteYn = dao.memDelete(dto);
		return deleteYn;
	}

}
