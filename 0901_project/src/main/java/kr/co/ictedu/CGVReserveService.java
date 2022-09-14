package kr.co.ictedu;

import java.util.List;


public interface CGVReserveService {
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
}
