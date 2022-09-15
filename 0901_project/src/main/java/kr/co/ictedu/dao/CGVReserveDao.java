package kr.co.ictedu.dao;

import java.util.List;

import kr.co.ictedu.dto.CGVReserveDto;


public interface CGVReserveDao {
	
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserveList(CGVReserveDto dto);
	
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
}
