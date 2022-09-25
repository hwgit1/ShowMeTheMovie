package kr.co.ictedu.dto;

import java.io.Serializable;

public class CGVReserveDto implements Serializable {
	private String id;
	private int reserveSequence;
	private String title;
	private String runningTime;
	private String movieDate;
	private String reserve_date;
	private String ticketNumber;
	private String selectedSeat;
	private String selectedTheater;
	private String movieAge;
	private String reserveWhere;
	private String seatCnt;
	private String pay;
	private String order_no;
	
	

	private CGVPayDto cgvPayDto;
	
	public CGVReserveDto() {
		// TODO Auto-generated constructor stub
	}
	
	public String getOrder_no() {
		return order_no;
	}


	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(String seatCnt) {
		this.seatCnt = seatCnt;
	}
	public String getReserveWhere() {
		return reserveWhere;
	}

	public void setReserveWhere(String reserveWhere) {
		this.reserveWhere = reserveWhere;
	}

	public CGVPayDto getCgvPayDto() {
		return cgvPayDto;
	}

	public void setCgvPayDto(CGVPayDto cgvPayDto) {
		this.cgvPayDto = cgvPayDto;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReserveSequence() {
		return reserveSequence;
	}

	public void setReserveSequence(int reserveSequence) {
		this.reserveSequence = reserveSequence;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}

	public String getMovieDate() {
		return movieDate;
	}

	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}

	public String getreserve_date() {
		return reserve_date;
	}

	public void setreserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	public String getSelectedSeat() {
		return selectedSeat;
	}

	public void setSelectedSeat(String selectedSeat) {
		this.selectedSeat = selectedSeat;
	}

	public String getSelectedTheater() {
		return selectedTheater;
	}

	public void setSelectedTheater(String selectedTheater) {
		this.selectedTheater = selectedTheater;
	}

	public String getMovieAge() {
		return movieAge;
	}

	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}


	public CGVReserveDto(String id, int reserveSequence, String title, String runningTime, String movieDate,
			String ticketNumber, String selectedSeat, String selectedTheater, String movieAge, String reserve_date, String seatCnt, String pay) {
		super();
		this.id = id;
		this.reserveSequence = reserveSequence;
		this.title = title;
		this.runningTime = runningTime;
		this.movieDate = movieDate;
		this.reserve_date = reserve_date;
		this.ticketNumber = ticketNumber;
		this.selectedSeat = selectedSeat;
		this.selectedTheater = selectedTheater;
		this.movieAge = movieAge;
		this.movieAge = seatCnt;
		this.movieAge = pay;
	}

	public CGVReserveDto(String id, int reserveSequence, String title, String runningTime, String movieDate,
			String ticketNumber, String selectedSeat, String selectedTheater, String movieAge,
			CGVPayDto cgvPayDto, String reserve_date, String seatCnt, String pay) {
		super();
		this.id = id;
		this.reserveSequence = reserveSequence;
		this.title = title;
		this.runningTime = runningTime;
		this.movieDate = movieDate;
		this.reserve_date = reserve_date;
		this.ticketNumber = ticketNumber;
		this.selectedSeat = selectedSeat;
		this.selectedTheater = selectedTheater;
		this.movieAge = movieAge;
		this.cgvPayDto = cgvPayDto;
		this.movieAge = seatCnt;
		this.movieAge = pay;
	}

	@Override
	public String toString() {
		return "CGVReserveDto [id=" + id + ", reserveSequence=" + reserveSequence + ", title=" + title
				+ ", runningTime=" + runningTime + ", movieDate=" + movieDate 
				+ ", ticketNumber=" + ticketNumber + ", selectedSeat=" + selectedSeat + ", selectedTheater="
				+ selectedTheater + ", movieAge=" + movieAge + ", reserve_date=" + reserve_date + ", seatCnt=" + seatCnt + ", pay=" + pay + "]";
	}
	
	
	
	
}
