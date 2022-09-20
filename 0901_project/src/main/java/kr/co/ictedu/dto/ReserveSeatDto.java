package kr.co.ictedu.dto;

public class ReserveSeatDto {
	
	private String reserve_date;
	private String theater_no;
	private String play_time;
	private String seat_cnt;
	private String seatreserve_date;
	
	
	@Override
	public String toString() {
		return reserve_date + " : " + theater_no + " : " + play_time + " : " + seat_cnt;
	}
	
	
	
	public String getSeatreserve_date() {
		return seatreserve_date;
	}
	public void setSeatreserve_date(String seatreserve_date) {
		this.seatreserve_date = seatreserve_date;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(String theater_no) {
		this.theater_no = theater_no;
	}
	public String getSeat_cnt() {
		return seat_cnt;
	}
	public void setSeat_cnt(String seat_cnt) {
		this.seat_cnt = seat_cnt;
	}
	public String getPlay_time() {
		return play_time;
	}
	public void setPlay_time(String play_time) {
		this.play_time = play_time;
	}
	
	

}
