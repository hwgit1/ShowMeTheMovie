package kr.co.ictedu.dao;

import java.util.List;

import kr.co.ictedu.dto.ReserveDto;


public interface ReserveDao {
	
	public boolean CGVReserve(ReserveDto dto);
	public List<ReserveDto> getCGVReserveList(ReserveDto dto);
	
	public List<ReserveDto> getPayJoinTable(ReserveDto dto);
}
