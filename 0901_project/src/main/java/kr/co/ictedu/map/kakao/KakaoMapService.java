package kr.co.ictedu.map.kakao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class KakaoMapService {

	@Autowired
	private KakaoMapDAO dao;

	public List<MemberDTO> selectAllMember() {
		List<MemberDTO> list = null;
		list = dao.selectAllMember();
		return list;
	}//selectAllMember

}//class
