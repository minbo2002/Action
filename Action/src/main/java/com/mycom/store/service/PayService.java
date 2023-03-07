package com.mycom.store.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.mycom.store.model.KakaoPayVO;
import com.mycom.store.model.PayInfoVO;


@Service
public class PayService {

	private static final String HOST = "https://kapi.kakao.com";
	private String partner_order_id;
	private String partner_user_id;
	private KakaoPayVO kakaoPayVO;
	private PayInfoVO payInfoVO;

	public PayInfoVO marketPayApprove(String pg_token) {

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 13bc2e071a43a36efe1322608d445c2f");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("cid", "TC0ONETIME");
		map.add("tid", kakaoPayVO.getTid());
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		try {
			payInfoVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), request, PayInfoVO.class);
			return payInfoVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public String marketPayReady(String[] sname, String[] camount, String[] sprice,HttpSession session) {
		String total_name = null;
		int total_amount = 0;
		int total_price = 0;
		session.setAttribute("sname", sname);
		session.setAttribute("camount",camount);
		session.setAttribute("sprice", sprice);
		for(int i = 0; i < sname.length; i++) {
			if(i == 0)
				total_name = sname[i];
			else {
				total_name = total_name + ", " + sname[i];
			}
			total_amount = total_amount + Integer.parseInt(camount[i]);
			total_price = total_price + Integer.parseInt(sprice[i]);
		}
		RestTemplate restTemplate = new RestTemplate();
		partner_order_id = "1234";
		partner_user_id = "Action";

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 13bc2e071a43a36efe1322608d445c2f");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();

		map.add("cid", "TC0ONETIME");
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("item_name", total_name); // 상품명
		map.add("quantity", Integer.toString(total_amount)); // 수량
		map.add("total_amount",  Integer.toString(total_price)); // 금액
		session.setAttribute("total_amount", total_price);
		map.add("tax_free_amount", "0"); // 세금
		map.add("approval_url", "https://localhost/pay/marketPaySuccess");
		map.add("cancel_url", "https://localhost/pay/kakaoPayCancel");
		map.add("fail_url", "https://localhost/pay/kakaoPayFail");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		try {
			kakaoPayVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, KakaoPayVO.class);
			return kakaoPayVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return "/pay";

	}
	
	
	
	public PayInfoVO KakaoPayApprove(String pg_token) {

		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 13bc2e071a43a36efe1322608d445c2f");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("cid", "TC0ONETIME");
		map.add("tid", kakaoPayVO.getTid());
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("pg_token", pg_token);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		try {
			payInfoVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), request, PayInfoVO.class);
			return payInfoVO;

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	public String KakaoPayReady(String total_amount, String quatity) {

		RestTemplate restTemplate = new RestTemplate();
		partner_order_id = "1234";
		partner_user_id = "Action";

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 13bc2e071a43a36efe1322608d445c2f");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();

		map.add("cid", "TC0ONETIME");
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("item_name", "버라이어티 콤보팩"); // 상품명
		map.add("quantity", quatity); // 수량
		map.add("total_amount", total_amount); // 금액
		map.add("tax_free_amount", "0"); // 세금
		map.add("approval_url", "https://localhost/pay/marketPaySuccess");
		map.add("cancel_url", "https://localhost/pay/kakaoPayCancel");
		map.add("fail_url", "https://localhost/pay/kakaoPayFail");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);
		try {
			kakaoPayVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), request, KakaoPayVO.class);
			return kakaoPayVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return "/pay";

	}
	
}