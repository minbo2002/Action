package com.mycom.booking.domain;

public class Cinema {
	
	private String name; 	//영화관 이름
	private String title;
	
	public Cinema() {
		
	}

	public String getname() {
		return name;
	}

	public void setname(String name) {
		this.name = name;
	}


	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Cinema [name=" + name + ", title=" + title + "]";
	}


	
	
	
	
	
}
