package com.mycom.store.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.store.model.PayInfoVO;
import com.mycom.store.service.PayService;


@Controller
@RequestMapping("/pay/**")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@GetMapping(value = "marketPaySuccess")
	public ModelAndView marketPayGet(HttpServletRequest request) throws Exception {
		
		PayInfoVO payInfoVO = new PayInfoVO();
		String pg_token = request.getParameter("pg_token");
		ModelAndView mv = new ModelAndView();
		payInfoVO = payService.KakaoPayApprove(pg_token);
		mv.addObject("pay", payInfoVO);
		
		return mv;
	}
	@GetMapping(value = "marketSuccess")
	public void marketPaySuccess(HttpServletRequest request, HttpSession session) throws Exception {
		
	}
	
	@PostMapping(value = "marketPay")
	public String marketPayPost(String[] sname, String[] sprice, String[] camount, HttpSession session) throws Exception {
		return "redirect:" + payService.marketPayReady(sname, camount, sprice, session);
	}

	
	@GetMapping(value = "kakaoPay")
	public void KakaoPayGet() throws Exception {

	}

	@PostMapping(value = "kakaoPay")
	public String KakaoPayPost(String total_amount, String quantity) throws Exception {
		System.out.println(total_amount);
		System.out.println(quantity);
		return "redirect:" + payService.KakaoPayReady(total_amount, quantity);
	}

	/*
	 * @GetMapping("/kakaoPaySuccess") public ModelAndView
	 * kakaoPaySuccess(HttpServletRequest request, HttpSession session) throws
	 * Exception { String pg_token = request.getParameter("pg_token"); PayInfoVO
	 * payInfoVO = new PayInfoVO(); ModelAndView mv = new ModelAndView(); payInfoVO
	 * = payService.KakaoPayApprove(pg_token); mv.addObject("pay", payInfoVO);
	 * return mv; }
	 */
}