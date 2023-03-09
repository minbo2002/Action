package com.mycom.booking.service;

import java.util.List;

import com.mycom.booking.domain.Cinema;
import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;



public interface BookingService {
	
	public List<Movie> getMovieList() throws Exception;
	
	public List<String> getTheaterList(String loc) throws Exception; 
	
	//영화 상영 시간표 검색
	public List<String> selectMovieTime(Cinema cinema) throws Exception;
	//좌석 불러오기
	public List<String> selectSeat(Ticketing ticketing) throws Exception;
	//예매정보 추가 
	public int insertInfo(Ticketing ticket) throws Exception;
	//좌석 상태 변경 
	public int updateSeat(Ticketing ticket) throws Exception;

}
