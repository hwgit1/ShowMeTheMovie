package kr.co.ictedu.dto;

public class SelectedDto {
	
	
	private String selectedSeat;
	
	
	@Override
	public String toString() {
		return selectedSeat;
	}
	
	public String getSelectedSeat() {
		return selectedSeat;
	}
	public void setSelectedSeat(String selectedSeat) {
		this.selectedSeat = selectedSeat;
	}
	

}
