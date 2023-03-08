package com.mycom.store.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.store.model.StoreVO;
import com.mycom.store.service.StoreService;


@Controller
@RequestMapping("/admin/**")
public class AdminController {
	
	
	 @Autowired
	 private StoreService storeService;

	 
	//관리자 : 상품 삭제
	 @ResponseBody
		@PostMapping("admin_storeDelete")
		public int admin_storeDelete(@RequestParam(value="list[]") List<String> list, StoreVO storeVO, HttpServletRequest request) throws Exception {
			
			int result = 0;
			int store_num = 0;
			
				
				for(String i : list) {
					store_num = Integer.parseInt(i);
					
					storeVO.setStore_num(store_num);
					
					result = storeService.storeDelete(storeVO, request);
				}
			return result;

		}
	 // 상품 수정 폼
	@GetMapping("admin_storeUpdate")
	public void storeUpdate(StoreVO storeVO, Model model) throws Exception {
		storeVO = storeService.storeSelect(storeVO);
		
		model.addAttribute("update", storeVO);
		
	}

	@RequestMapping("admin_storeInsert")
	public void admin_storeInsert() throws Exception {
	}
	
	//관리자  : 스토어관리
	@RequestMapping("admin_storeList")
	public void admin_storeList(StoreVO storeVO, Model model) throws Exception {
		if(storeVO.getStore_package() == 0) {
			storeVO.setStore_package(1);
		}
		List<StoreVO> list = storeService.storeList(storeVO);
		
		model.addAttribute("storeList", list);
	}

}