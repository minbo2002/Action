package com.mycom.booking.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mycom.booking.domain.Cinema;
import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;


public interface BookingRepository {
	
	public List<Movie> getMovieList() throws DataAccessException;
	
	public List<String> getTheaterList(String loc) throws DataAccessException;
	
	//영화 상영시간표 검색
	public List<String> selectMovieTime(Cinema cineam) throws DataAccessException;
	//좌석 검색
	public List<String> selectSeat(Ticketing ticketing) throws DataAccessException;
	//예매 데이터 삽입 
	public int insertInfo(Ticketing ticket) throws DataAccessException;
	//좌석 상태값 변경
	public int updateSeat(Ticketing ticket) throws DataAccessException;

}
