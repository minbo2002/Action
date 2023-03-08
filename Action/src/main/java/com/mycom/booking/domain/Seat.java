package com.mycom.booking.domain;

public class Seat {
	
	private String seat_no;	//seatno Seq
	private String seat_status;	//좌석 상태
	private String r_seat_no;
	private String schedule_no;
	
	public Seat() {
		
	}

	public String getSeat_no() {
		return seat_no;
	}

	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}

	public String getSeat_status() {
		return seat_status;
	}

	public void setSeat_status(String seat_status) {
		this.seat_status = seat_status;
	}

	public String getR_seat_no() {
		return r_seat_no;
	}

	public void setR_seat_no(String r_seat_no) {
		this.r_seat_no = r_seat_no;
	}

	public String getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}

	@Override
	public String toString() {
		return "Seat [seat_no=" + seat_no + ", seat_status=" + seat_status + ", r_seat_no=" + r_seat_no
				+ ", schedule_no=" + schedule_no + "]";
	}


	
	
	
	

}
