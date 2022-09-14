package kr.co.ictedu;

import java.util.List;


public interface CGVReserveDao {
	
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserveList(CGVReserveDto dto);
	
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
}
