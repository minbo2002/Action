package com.mycom.booking.domain;

import java.util.Date;

public class Schedule {

	private int schedule_no;
	private Date schedule_date;
	private String time_code;
	private String cinema_no;
	private String movie_no;
	
	public Schedule() {
		
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public Date getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}

	public String getTime_code() {
		return time_code;
	}

	public void setTime_code(String time_code) {
		this.time_code = time_code;
	}

	public String getCinema_no() {
		return cinema_no;
	}

	public void setCinema_no(String cinema_no) {
		this.cinema_no = cinema_no;
	}

	public String getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(String movie_no) {
		this.movie_no = movie_no;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_no=" + schedule_no + ", schedule_date=" + schedule_date + ", time_code=" + time_code
				+ ", cinema_no=" + cinema_no + ", movie_no=" + movie_no + "]";
	}
	
	
}
