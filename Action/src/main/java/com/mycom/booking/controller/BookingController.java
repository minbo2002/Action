package com.mycom.booking.controller;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.booking.domain.Cinema;
import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;
import com.mycom.booking.service.BookingService;



@Controller
public class BookingController {
	
	private final Logger logger = LoggerFactory.getLogger( BookingController.class );
	@Autowired
	BookingService bookingService;
	
	 //초기화면
	//영화리스트폼 불러오기
	@GetMapping("/booking")
	public String getMovieList(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		List<Movie> movieList = bookingService.getMovieList();
		logger.info("영화리스트 불러오기:"+ movieList);
		//int memNo = (int) session.getAttribute("memNo");
		//System.out.println("회원번호:"+memNo);
		model.addAttribute("movieList", movieList);
		//mv.setViewName("booking/ticket");
		
			return "booking/ticket";
		
	}
	
	//영화관 지역 
	@GetMapping(value="/theaterloc", produces = "application/json; charset=utf8")
	public @ResponseBody List<String> getMovieLoc(@RequestParam("t_loc") String loc,Model model) throws Exception {
		List<String> list = bookingService.getTheaterList(loc);
		logger.info("영화관리스트 불러오기:"+ list);
		return list;
		
	}
	//영화관 시간 불러오기 
	@GetMapping(value="/getTime", produces = "application/json; charset=utf8")
	public @ResponseBody Object getMovieTile(Cinema cinema, Model model) throws Exception {
		List<String> cinemaList = bookingService.selectMovieTime(cinema);
		logger.info("상영시간 불러오기:"+ cinemaList);
		//JSON Object객체생성
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("list", cinemaList);
//		String jsonInfo = jsonObject.toString();
		return cinemaList;
		
	}
	

	
	//좌석 불러오기 
		@GetMapping(value="/getSeat", produces = "application/json;charset=utf8")
		public @ResponseBody Object getSeat(Ticketing ticketing) throws Exception {
			List<String> seatList = bookingService.selectSeat(ticketing);
			logger.info("좌석 불러오기:"+ seatList);
			return seatList;
		}
	
	//예매 데이터 전송 
	@PostMapping(value="/ticket")
	public String submitMovieInfo(Ticketing ticket, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset:utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int memNo = (int) session.getAttribute("memNo");
		
		ticket.setMon_no(memNo);
		//데이터 추가
		int cnt1 = bookingService.insertInfo(ticket);
		
		System.out.println("cnt1:"+cnt1);
		if(cnt1==1) {
			bookingService.updateSeat(ticket);
			out.println("<script>");
			out.println("location.href='/'");
			out.println("alert('예매 성공');");
			out.println("</script>");
			out.close();
	
		} else {
			out.println("<script>");
			out.println("location.href='/'");
			out.println("alert('예매실패 관리자 문의바람!!');");
			out.println("</script>");
			out.close();
		}
		
		return "home";
		
	}
	
}
