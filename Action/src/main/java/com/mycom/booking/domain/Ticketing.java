package com.mycom.booking.domain;

public class Ticketing {
	
	
	private String ticketing_no;			//티켓번호 시퀀스 
	private String cinema_name;				//영화관 이름
	private String seat_number;				//예약좌석번호
	private String person;					//예약인원
	private String movie_title;				//영화제목
	private String movie_time;				//상영시간 
	private int mon_no;						//회원번호 
	
	public Ticketing() { }

	public String getTicketing_no() {
		return ticketing_no;
	}

	public void setTicketing_no(String ticketing_no) {
		this.ticketing_no = ticketing_no;
	}

	public String getCinema_name() {
		return cinema_name;
	}

	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}

	public String getSeat_number() {
		return seat_number;
	}

	public void setSeat_number(String seat_number) {
		this.seat_number = seat_number;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}

	public int getMon_no() {
		return mon_no;
	}

	public void setMon_no(int mon_no) {
		this.mon_no = mon_no;
	}

	@Override
	public String toString() {
		return "Ticketing [ticketing_no=" + ticketing_no + ", cinema_name=" + cinema_name + ", seat_number="
				+ seat_number + ", person=" + person + ", movie_title=" + movie_title + ", movie_time=" + movie_time
				+ ", mon_no=" + mon_no + "]";
	}

	

	

	
	
	
	
}
