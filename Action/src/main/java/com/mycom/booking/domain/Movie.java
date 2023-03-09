package com.mycom.booking.domain;

import java.util.Date;

public class Movie {
	
	private int movie_no;
	private String movie_title;
	private String movie_running_time;
	private String movie_grade;
	private Date movie_opening;
	private String movie_status;
	
	public Movie() {
		
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_running_time() {
		return movie_running_time;
	}

	public void setMovie_running_time(String movie_running_time) {
		this.movie_running_time = movie_running_time;
	}

	public String getMovie_grade() {
		return movie_grade;
	}

	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}

	public Date getMovie_opening() {
		return movie_opening;
	}

	public void setMovie_opening(Date movie_opening) {
		this.movie_opening = movie_opening;
	}

	public String getMovie_status() {
		return movie_status;
	}

	public void setMovie_status(String movie_status) {
		this.movie_status = movie_status;
	}

	@Override
	public String toString() {
		return "Movie [movie_no=" + movie_no + ", movie_title=" + movie_title + ", movie_running_time="
				+ movie_running_time + ", movie_grade=" + movie_grade + ", movie_opening=" + movie_opening
				+ ", movie_status=" + movie_status + "]";
	}

	
	
	
	
	
}
