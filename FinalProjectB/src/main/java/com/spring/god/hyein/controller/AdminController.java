package com.spring.god.hyein.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.FileManager;
import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.PhotoVO;
import com.spring.god.hyein.service.InterAdminService;

@Controller
public class AdminController {

	@Autowired 
	private InterAdminService service;
	
	// === #2. 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private FileManager fileManager;
	
	// 숙소 등록 뷰단 보여주기
	@RequestMapping(value="/roomrg.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg.tiles1");
		
		return mv;
	}
	
	
	// 숙소 등록하기
	@RequestMapping(value="/roomrgEnd.go", method={RequestMethod.POST} )
	public String roomRegistrationEnd(HotelRoomVO hotelroomvo, MultipartHttpServletRequest mrequest) {
		
		System.out.println(hotelroomvo.getRegDay());
		
		
//		========= !!첨부파일이 있는지 없는지 알아오기 시작!! =========
		MultipartFile attach = hotelroomvo.getAttach();
		System.out.println("attach확인: "+attach);
		
		if(!attach.isEmpty()) {
			
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
//			path = root + "resources" + File.separator + "files";
			String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\webapp\\resources\\images\\hotel";
//			String path = root + "resources" + File.separator + "images" + File.separator + "hotel"; 
			
//			String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\webapp\\resources" + File.separator + "images\\hotel";
			
			System.out.println(">>> 확인용 path ==> " + path);
			
			String newFileName = "";
			// WAS(톰캣)의 디스크에 저장될 파일명
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣)의 디스크에 저장할 때 사용되는 용도
			
			long fileSize = 0;
			// 파일크기를 읽어오기 위한 용도
			
			try {
				bytes = attach.getBytes();
				// getBytes() 메소드는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다.
				// 예를 들어, 첨부한 파일이 "강아지".png 이라면
				// 이 파일을 WAS(톰캣) 디스크에 저장시키기 위해 byte[] 타입으로 변경해서 올린다.
				
				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
				// 이제 파일 올리기를 한다.
				// attach.getOriginalFilename() 은 첨부된 파일의 파일명(강아지.png)이다.
				
				System.out.println(">>> 확인용 : newFileName ==> " + newFileName);
				// >>> 확인용 : newFileName ==> 201907251244161722498031530800.jpg
				
				// == 3. BoardVO hotelroomvo 에 fileName 과 picture 값과 fileSize 값을 넣어주기
				hotelroomvo.setImg(attach.getOriginalFilename());
				// WAS(톰캣)에 저장된 파일명(201907251244161722498031530800.jpg)
				
				hotelroomvo.setOrgFileName(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일의 파일명(강아지.png)을 보여줄 때 및
				// 사용자가 파일을 다운로드 할 때 사용되어지는 파일명
				
				fileSize = attach.getSize();
				hotelroomvo.setFileSize(String.valueOf(fileSize));
				// 게시판 페이지에서 첨부한 파일의 크기를 보여줄 때 String 타입으로 변경해서 저장함.
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! ========= */
		
		
		int n = 0;
		if(attach.isEmpty()) {
// 		첨부파일이 없는 경우이라면
/*
			String msg = "이미지를 첨부해주세요!";
			String loc = "javascript:history.back()";
			
		return "hyein/roomRg/msg.tiles1";
*/	
		} else {
			
// 		첨부파일이 있는 경우이라면	
//		=== 호텔 등록 ===
			n = service.hotelAdd(hotelroomvo);
		
		}
		
		mrequest.setAttribute("n", n);
		
		return "hyein/roomRg/roomrgEnd.tiles1";
		
	}
	
	// 객실 등록 폼의 숙소명 검색어 자동완성하기 3
	@RequestMapping(value="/wordSearch.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String wordSearch(HttpServletRequest request) {
		
		String searchWord = request.getParameter("searchWord");
		
		List<String> wordNameList = null;
		
		if(searchWord!="") {
			
			// 객실 등록 폼의 숙소명 검색어 자동완성하기
			wordNameList = service.wordNameSearchView(searchWord);
		}
		
		JSONArray jsonArr = new JSONArray();

		if(wordNameList != null) {
			for(String name : wordNameList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("name", name);
				
				jsonArr.put(jsonObj);
			}
		}

		String result = jsonArr.toString();
		
		return result;
	}
	
	// 룸 등록 뷰단 보여주기
	@RequestMapping(value="/roomrg2.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration2(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg2.tiles1");
		
		return mv;
	}
	
	
	// 자동완성 검색어 클릭했을 때 대분류 카테고리 넘버 가져오기
	@RequestMapping(value="/largeCodeSearch.go", method={RequestMethod.GET}, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String largeCodeSearch(ModelAndView mv, HttpServletRequest request) { 
		
		String clickWord = request.getParameter("searchWord");
		System.out.println(clickWord);
		String largeCodeList = null;
		String largeCategoryList = null;
		
		if(clickWord!="" && clickWord!=null) {
			
			// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
			largeCodeList = service.getLargeCodeNum(clickWord);
			largeCategoryList = service.getLargeCategoryNum(clickWord);
			
		}
			JSONArray jsonArr = new JSONArray();

			if(largeCodeList != null) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("largeCategoryontionCode", largeCodeList);
					jsonObj.put("fk_LargeCategoryCode", largeCategoryList);
					
					jsonArr.put(jsonObj);
			}

			String result = jsonArr.toString();
			
			return result;
		}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 룸 등록 하기 (Register 버튼을 눌렀을 때)
		@RequestMapping(value="/roomrg2End.go", method={RequestMethod.POST} )
		public String roomRegistration2End(MultipartHttpServletRequest mrequest, HttpServletResponse response) throws Exception {

			String fk_LargeCategoryCode = mrequest.getParameter("fk_LargeCategoryCode");
			
			HashMap<String,String> hashMap = new HashMap<String,String>();
			hashMap.put("fk_LargeCategoryCode", fk_LargeCategoryCode);
			
			String productid = String.valueOf(service.getProdseq(hashMap)); // 새로이 입력할 제품번호(시퀀스) 가져오기 
			
			String[] roomOptionArr = mrequest.getParameterValues("roomOption");
			String roomOption = "";
			for(int i=0; i<roomOptionArr.length; i++) {
				String comma = (i < roomOptionArr.length-1)?",":"";
				roomOption += roomOptionArr[i]+comma;
			}
			
			String productName  = mrequest.getParameter("productName");
			String weekPrice = mrequest.getParameter("weekPrice");
			String weekenPrice = mrequest.getParameter("weekenPrice");
			String roomInfo = mrequest.getParameter("roomInfo");
			String productPeriod1 = mrequest.getParameter("productPeriod1");
			String productPeriod2 = mrequest.getParameter("productPeriod2");
			
			String largeCategoryontionCode = mrequest.getParameter("largeCategoryontionCode");
			String bedCnt = mrequest.getParameter("bedCnt");
			String peopleCnt = mrequest.getParameter("peopleCnt");
			
			String roomType = largeCategoryontionCode.substring(0, 1); // largeCategoryontionCode의 맨 앞 숫자 뽑아와서 roomType에 넣어주기
			roomType += bedCnt += peopleCnt; // roomType에 침대갯수(bedCnt)와 수용인원(peopleCnt) 더해주기
			
			List<MultipartFile> attachList = mrequest.getFiles("attach");  //  !!! 이미지첨부 다중 파일 !!!
			
			HashMap<String,String> productMap = new HashMap<String,String>();  // 제품(숙소)1개
			productMap.put("productid", productid);
			productMap.put("largeCategoryontionCode", largeCategoryontionCode);
			productMap.put("roomOption", roomOption);
			productMap.put("productName", productName);
			productMap.put("weekPrice", weekPrice);
			productMap.put("weekenPrice", weekenPrice);
			productMap.put("roomInfo", roomInfo);
			productMap.put("productPeriod1", productPeriod1);
			productMap.put("productPeriod2", productPeriod2);
			productMap.put("roomType", roomType);
			
			/////////////////////////////////////////다중 파일 업로드//////////////////////////////////////////////////////
			List<HashMap<String, String>> roomImageMapList = new ArrayList<HashMap<String, String>>();
	        
	        if(attachList != null) {  // 이미지첨부 다중파일을 받아왔다라면 
	        	// 이미지첨부 다중파일을 업로드할 WAS 의 webapp 의 절대경로를 알아와야 한다. 
				HttpSession session = mrequest.getSession();
				String root = session.getServletContext().getRealPath("/"); 
//				String path = root + "resources" + File.separator + "images" + File.separator + "room"; 
				String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\webapp\\resources\\images\\room";
//				String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\webapp\\resources" + File.separator + "images\\room";
				// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
				
				String newFileName = ""; // WAS(톰캣) 디스크에 저장할 파일명 
				
				byte[] bytes = null;    // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
											
				for(int i=0; i<attachList.size(); i++) { 
						
					try {
						 bytes = attachList.get(i).getBytes(); // 첨부파일의 내용물(byte)을 읽어옴.
						 
						 // 파일업로드 한 후 업로드되어진 파일명  가져오기
						 newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
						 // 예를들어 newFileName 에는  2019012519592316420706146795.png 와 같은 것이 들어옴.
						 				 
						 HashMap<String, String> roomImageMap = new HashMap<String, String>();
						// 제품1개에 딸린 다중 이미지
					
						 roomImageMap.put("fk_productid", productid);
						 roomImageMap.put("picture", attachList.get(i).getOriginalFilename());
						 roomImageMap.put("uploaded_picture", newFileName);
						 						
						 roomImageMapList.add(roomImageMap);
						 
					} catch (Exception e) {	
						
					}
				} // end of for-------------------------------------------------------------------------
	        } // end of if------------------------------------------------------------------------------
	       
	      // **** 폼에서 입력받은 제품입력정보 값을 
	  	  //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
	  		   
	      // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
	      // Service 단으로 호출하기
			   int n = 0;
			   int m = 0;
			   int count = 0;

			   n = service.roomAdd(productMap);
			   System.out.println("~~~~~~~~~~~ roomImageMapList.size() : " + roomImageMapList.size());
			   
			   for(int i=0; i<roomImageMapList.size(); i++) {
					m = service.imgAdd(roomImageMapList.get(i)); /////////////////////////////////////
					if(m==1) count++;
			   }
				   
			   if(roomImageMapList.size() == count) {
				   n=1;
			   }
			   else {
				   n=0;
			   }

			   String msg = "";
			   String loc = "";
			   
			   if(n==1) {
				   msg = "객실이 등록되었습니다!";
				   loc = mrequest.getContextPath() + "/index.go";
			   }
			   else {      
				   msg = "객실 등록이 실패되었습니다!";
			       loc = mrequest.getContextPath() + "/roomrg.go";
			   }
			    		
			   mrequest.setAttribute("msg", msg);
			   mrequest.setAttribute("loc", loc);
			   
			   return "hyein/roomRg/roomrg2End.tiles1";   

	}
    
}
