package com.mycom.booking.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;
import com.mycom.booking.domain.Cinema;

@Repository("bookingRepository")
public class BookingRepositoryImpl implements BookingRepository	 {
	
	
	@Autowired 
	private SqlSession sqlSession;  
	
	@Override
	public List<Movie> getMovieList() throws DataAccessException {
		return sqlSession.selectList("mapper.booking.getMovieList");
	}

	@Override
	public List<String> getTheaterList(String loc) throws DataAccessException {
		System.out.println("repo:"+loc);
		List<String> list = sqlSession.selectList("mapper.booking.getLocList", loc);
		System.out.println("repo:"+list);
		return list;
	}
	//영화 상영시간표 검색
	@Override
	public List<String> selectMovieTime(Cinema cinema) throws DataAccessException {
		System.out.println("repo:"+ cinema);
		List<String> list = sqlSession.selectList("mapper.booking.getTimeList", cinema);
		System.out.println("repo의 결과"+list);
		return list; 
	}
	//영화좌석검색
	@Override
	public List<String> selectSeat(Ticketing ticketing) throws DataAccessException {
		System.out.println("repo:"+ticketing);
		List<String> list = sqlSession.selectList("mapper.booking.getSeatList", ticketing);
		System.out.println("repo 리턴 값:"+list);
		return list;
	}
	//예매데이터 삽입
	@Override
	public int insertInfo(Ticketing ticket) throws DataAccessException{
		int cnt = sqlSession.insert("mapper.booking.insertInfo", ticket);
		System.out.println("영화데이터 리턴값:"+cnt);
		return cnt;
	}
	//좌석 상태값 변경 
	@Override
	public int updateSeat(Ticketing ticket) throws DataAccessException {
		System.out.println("좌석상태:"+ticket);
		int cnt = sqlSession.update("mapper.booking.updateSeat", ticket);
		System.out.println("좌석상태값 리턴값:"+cnt);
		return cnt;
	}
	
	
	
	
	
	
}
