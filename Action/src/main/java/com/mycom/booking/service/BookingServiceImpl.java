package com.mycom.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.booking.domain.Cinema;
import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;
import com.mycom.booking.repository.BookingRepository;




@Service("bookingService")
public class BookingServiceImpl implements BookingService{

	@Autowired
	BookingRepository bookingRepository;
	
	//영화목록 불러오기
	@Override
	public List<Movie> getMovieList() throws Exception{
		return bookingRepository.getMovieList();
	}
	//영화관 불러오기
	@Override
	public List<String> getTheaterList(String loc) throws Exception {
		List<String> list = bookingRepository.getTheaterList(loc);
		return list;
	}
	//영화상영시간 검색
	@Override
	public List<String> selectMovieTime(Cinema cinema) throws Exception {
		return bookingRepository.selectMovieTime(cinema);
	}
	//좌석검색
	@Override
	public List<String> selectSeat(Ticketing ticketing) throws Exception {
		return bookingRepository.selectSeat(ticketing);
	}
	
	//예매 데이터 삽입
	@Override
	public int insertInfo(Ticketing ticket) throws Exception {
		int cnt = bookingRepository.insertInfo(ticket);
		return cnt;
	}
	
	//좌석상태값변경
	@Override
	public int updateSeat(Ticketing ticket) throws Exception {
		int cnt =  bookingRepository.updateSeat(ticket);
		return cnt; 
	}
	
	

	
}
