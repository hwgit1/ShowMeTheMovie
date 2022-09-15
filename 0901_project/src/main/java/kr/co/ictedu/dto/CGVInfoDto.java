package kr.co.ictedu.dto;

public class CGVInfoDto {

	String rank;
	String img;
	String movieTitle;
	String movieRate; //예매율
	String movieOpenDate; //개봉일
	int seq;
	
	public CGVInfoDto() {
		// TODO Auto-generated constructor stub
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}


	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public String getMovieRate() {
		return movieRate;
	}

	public void setMovieRate(String movieRate) {
		this.movieRate = movieRate;
	}

	public String getMovieOpenDate() {
		return movieOpenDate;
	}

	public void setMovieOpenDate(String movieOpenDate) {
		this.movieOpenDate = movieOpenDate;
	}


	public CGVInfoDto(String rank, String img, String movieTitle, String movieRate,
			String movieOpenDate, int seq) {
		super();
		this.rank = rank;
		this.img = img;
		this.movieTitle = movieTitle;
		this.movieRate = movieRate;
		this.movieOpenDate = movieOpenDate;
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "CGVInfoDto [rank=" + rank + ", img=" + img +  ", movieTitle=" + movieTitle
				+ ", movieRate=" + movieRate + ", movieOpenDate=" + movieOpenDate + ", seq=" + seq
				+ "]";
	}

	
}
	