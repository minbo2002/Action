package com.mycom.booking.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.booking.domain.Cinema;
import com.mycom.booking.domain.Movie;
import com.mycom.booking.domain.Ticketing;
import com.mycom.booking.service.BookingService;



@Controller
public class BookingController {
	
	private final Logger logger = LoggerFactory.getLogger( BookingController.class );
	private HttpSession hSession;
	
	
	@Autowired
	BookingService bookingService;
	
	 //초기화면
	//영화리스트 불러오기
	@GetMapping("/booking")
	public ModelAndView getMovieList(ModelAndView mv, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		if(request.getAttribute("memNo")== null) {
			mv.setViewName("redirect:/member/login.do");
			return mv;
		}
		List<Movie> movieList = bookingService.getMovieList();
		int memNo = (int) session.getAttribute("memNo");
		System.out.println("회원번호:"+memNo);
		
		mv.addObject("movieList", movieList);
		mv.setViewName("booking/ticket");
		return mv;
	}
	//영화관 지역 
	@GetMapping(value="/theaterloc", produces = "application/json; charset=utf8")
	public @ResponseBody List<String> getMovieLoc(@RequestParam("t_loc") String loc,Model model) throws Exception {
		List<String> list = bookingService.getTheaterList(loc);
		System.out.println(loc);
		
		return list;
		
	}
	//영화관 시간 불러오기 
	@GetMapping(value="/getTime", produces = "application/json; charset=utf8")
	public @ResponseBody Object getMovieTile(Cinema cinema, Model model) throws Exception {
		List<String> cinemaList = bookingService.selectMovieTime(cinema);
		System.out.println(cinemaList);
		
		//JSON Object객체생성
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("list", cinemaList);
//		String jsonInfo = jsonObject.toString();
		return cinemaList;
		
	}
	
//	//좌석 불러오기 
//	@GetMapping(value="/getSeat", produces = "application/json;charset=utf8")
//	public @ResponseBody Object getSeat(String time) throws Exception {
//		System.out.println("time값:"+time);
//		List<String> seatList = bookingService.selectSeat(time);
//	
//		
//		return seatList;
//	}
	
	//좌석 불러오기 
		@GetMapping(value="/getSeat", produces = "application/json;charset=utf8")
		public @ResponseBody Object getSeat(Ticketing ticketing) throws Exception {
			System.out.println("ticketing값:"+ticketing);
			List<String> seatList = bookingService.selectSeat(ticketing);
		
			
			return seatList;
		}
	
	//예매 데이터 전송 
	@GetMapping(value="/ticket")
	public String submitMovieInfo(Ticketing ticket, HttpServletRequest request) throws Exception {
		//int men_no = 1;
		HttpSession session = request.getSession();
		int memNo = (int) session.getAttribute("memNo");
		
		ticket.setMon_no(memNo);
		//데이터 추가
		int cnt1 = bookingService.insertInfo(ticket);
		System.out.println("cnt1:"+cnt1);
		if(cnt1==1) {
			int cnt2 = bookingService.updateSeat(ticket);
		} else {
			return "redirect:/";
		}
		//좌석 상태 변경 
		
		
		
		System.out.println("ticket값:"+ticket);
		return "redirect:/";
	}
}
