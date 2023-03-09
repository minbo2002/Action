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
	
	//영화리스트 불러오기
	@Override
	public List<Movie> getMovieList() throws DataAccessException {
		return sqlSession.selectList("mapper.booking.getMovieList");
	}
	//영화관 리스트 불러오기
	@Override
	public List<String> getTheaterList(String loc) throws DataAccessException {
		List<String> list = sqlSession.selectList("mapper.booking.getLocList", loc);
		return list;
	}
	//영화 상영시간표 검색
	@Override
	public List<String> selectMovieTime(Cinema cinema) throws DataAccessException {
		List<String> list = sqlSession.selectList("mapper.booking.getTimeList", cinema);
		return list; 
	}
	//영화좌석검색
	@Override
	public List<String> selectSeat(Ticketing ticketing) throws DataAccessException {
		List<String> list = sqlSession.selectList("mapper.booking.getSeatList", ticketing);
		return list;
	}
	//예매데이터 삽입
	@Override
	public int insertInfo(Ticketing ticket) throws DataAccessException{
		int cnt = sqlSession.insert("mapper.booking.insertInfo", ticket);
		return cnt;
	}
	//좌석 상태값 변경 
	@Override
	public int updateSeat(Ticketing ticket) throws DataAccessException {
		int cnt = sqlSession.update("mapper.booking.updateSeat", ticket);
		return cnt;
	}
}
