package com.mycom.store.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.store.dao.StoreDAO;
import com.mycom.store.model.StoreVO;
import com.mycom.store.storecommon.FileSaver;


@Service
public class StoreService {

	@Autowired
	private StoreDAO storeDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
/////* 스토어 */////////////////////////////////////////////////
	//상품삭제
	public int storeDelete(StoreVO storeVO, HttpServletRequest request) throws Exception {
		
		String realPath = request.getSession().getServletContext().getRealPath("resources/upload/store");
		StoreVO storeVO2 = storeDAO.storeSelect(storeVO);
		
		fileSaver.fileDelete(realPath, storeVO2.getStore_img());

		return storeDAO.storeDelete(storeVO);
	}
	
	//상품수정
	public int storeUpdate(StoreVO storeVO, MultipartFile file, HttpServletRequest request) throws Exception {
		
		String realPath = request.getSession().getServletContext().getRealPath("resources/upload/store");
		//새로운 파일이 등록되었는지 확인
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			//기존 파일을 삭제
			fileSaver.fileDelete(realPath, request.getParameter("store_img"));
		
			//새로 첨부한 파일을 등록
			String fileName = fileSaver.save(realPath, file);
			
			storeVO.setStore_img(fileName);
			storeVO.setStore_thumbimg("th_"+fileName);
		}else { //새로운 파일이 등록되지 않았다면
			//기존 이미지를 그대로 사용
			storeVO.setStore_img(request.getParameter("store_img"));
			storeVO.setStore_thumbimg(request.getParameter("store_thumbimg"));
		}
		
		return storeDAO.storeUpdate(storeVO);
	}
	
	//상품등록
	public int storeWrite(StoreVO storeVO, MultipartFile file, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/upload/store");
		String fileName = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = fileSaver.save(realPath, file);
		} else {
			fileName = realPath + File.separator + "images" + File.separator + "none.png";
		}
		storeVO.setStore_img(fileName);
		storeVO.setStore_thumbimg("th_"+fileName);
		
		return storeDAO.storeWrite(storeVO);
	}
	
	//상품조회
	public StoreVO storeSelect(StoreVO storeVO) throws Exception {
		return storeDAO.storeSelect(storeVO);
	}
	
	//상품목록
	public List<StoreVO> storeList(StoreVO storeVO) throws Exception {
		return storeDAO.storeList(storeVO);
	}
}
