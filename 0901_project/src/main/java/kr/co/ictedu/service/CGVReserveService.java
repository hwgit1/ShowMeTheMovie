package kr.co.ictedu.service;

import java.util.List;

import kr.co.ictedu.dto.CGVReserveDto;


public interface CGVReserveService {
	public boolean CGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getCGVReserve(CGVReserveDto dto);
	public List<CGVReserveDto> getPayJoinTable(CGVReserveDto dto);
}
