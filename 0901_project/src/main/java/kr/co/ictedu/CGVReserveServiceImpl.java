package kr.co.ictedu;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CGVReserveServiceImpl implements CGVReserveService {

	@Autowired
	CGVReserveDao cgvReserveDao;
	
	@Override
	public boolean CGVReserve(CGVReserveDto dto) {
		
		return cgvReserveDao.CGVReserve(dto);
	}

	@Override
	public List<CGVReserveDto> getCGVReserve(CGVReserveDto dto) {
		System.out.println("ㅋㅋㅋ");
		List<CGVReserveDto> list = new ArrayList<CGVReserveDto>();
		list = cgvReserveDao.getCGVReserveList(dto);
	
		return list;
	}

	@Override
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto) {
		
		return cgvReserveDao.getPayJoinTable(dto);
	}
}
