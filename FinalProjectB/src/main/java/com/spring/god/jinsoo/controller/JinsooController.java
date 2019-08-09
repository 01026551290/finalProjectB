package com.spring.god.jinsoo.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.support.BooleanTypedValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import com.spring.god.common.FileManager;
import com.spring.god.common.MyUtil;
import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.HotelVO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.model.JinsoomemberVO;
import com.spring.god.jinsoo.model.reserveVO;
import com.spring.god.jinsoo.service.InterJinsooService;
import com.spring.god.jiyoung.model.MemberVO;



@Controller
public class JinsooController {
	
	@Autowired
	private InterJinsooService service;
	
	@Autowired
	private FileManager fileManager;
	
	// 관리자 로그인페이지 만들기
	@RequestMapping(value="/jinsoo/adminLogin.go", method= {RequestMethod.GET} )
	public ModelAndView adminLogin(ModelAndView mv) {
		
		mv.setViewName("tiles1/jinsoo/manager/adminLogin");
		
		return mv;
	}
	
	
	@RequestMapping(value="/jinsoo/search.go", method= {RequestMethod.GET} )
	public ModelAndView search(ModelAndView mv) {
		
		mv.setViewName("tiles1/jinsoo/manager/search");
		
		return mv;
	}
	// 관리자 로그인하기
	@RequestMapping(value="/jinsoo/adminLoginEnd.go", method= {RequestMethod.POST} )
	public ModelAndView adminLoginEnd(ModelAndView mv, HttpServletRequest request) {
		
		String seq = request.getParameter("seq");
		String pwd = request.getParameter("pwd");				
		
		HashMap<String,String> adminmap = new HashMap<String,String>();
		adminmap.put("seq", seq);
		adminmap.put("pwd", pwd);				
		
		JinsooadminVO adminvo = service.adminLogin(adminmap);
		
		HttpSession session = request.getSession();
		
			if(adminvo == null) {
			
			String msg = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";
			
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("tiles1/jinsoo/msg");
			
			}
						
			else {
				
				session.setAttribute("adminvo", adminvo);
				String msg = "로그인 되었습니다.";
				String loc = request.getContextPath()+"/jinsoo/manager.go";
				
				
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				mv.setViewName("tiles1/jinsoo/msg");
			}
		
		return mv;
	}
	// 관리자 페이지 띄우기
	@RequestMapping(value="/jinsoo/manager.go", method= {RequestMethod.GET} )
	public ModelAndView manager(ModelAndView mv) {
		
		mv.setViewName("jinsoo/manager/adminHome.tiles1");
		
		return mv;
	}
	
	// 차트:  성별 JSON으로 얻어오기
	@RequestMapping(value="/jinsoo/genderJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String genderJSON() {
		
		// 성별 JSON으로 얻어오기
		List<HashMap<String,String>> genderList =  service.getGenderCntList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(genderList != null) {
			for(HashMap<String,String> map :genderList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("GENDER", map.get("GENDER"));
				jsonObj.addProperty("CNT", map.get("CNT"));
				jsonObj.addProperty("PERCNT", map.get("PERCNT"));
				
				jsonArr.add(jsonObj);
			}
			
		}

		
		return new Gson().toJson(jsonArr);
	}
	
	// 통계: 회원 가입 현황 보기
	@RequestMapping(value="/jinsoo/todaymemberJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String todaymemberJSON() {
		
		int todayList = service.allMember();
		int todayStartList = service.todayStartmember();
		int todayEndList = service.todayEndmember();
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("todayList", todayList);
		jsonObj.addProperty("todayStartList", todayStartList);
		jsonObj.addProperty("todayEndList", todayEndList);
		
		String result = jsonObj.toString();
		
		return result;
	}
	
	// 통계: 연령별 회원 통계
	@RequestMapping(value="/jinsoo/ageJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String ageJSON(HttpServletRequest request) {
		
		List<HashMap<String,String>> ageMemberList =  service.ageMemberList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(ageMemberList != null) {
			for(HashMap<String,String> map :ageMemberList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("age", map.get("AGE"));
				jsonObj.addProperty("cnt", map.get("CNT"));								
				jsonObj.addProperty("percnt", map.get("PERCNT"));							
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
	}
	
	// 통계: 연령별로 검색한 성별 회원 통계
	@RequestMapping(value="/jinsoo/ageGenderJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String ageGenderJSON(HttpServletRequest request) {
		
		String age = request.getParameter("age");
		
		List<HashMap<String,String>> ageGenderList =  service.ageGenderList(age);
		
		JsonArray jsonArr = new JsonArray(); 
		
		if(ageGenderList != null) {
			for(HashMap<String,String> map :ageGenderList) {
				JsonObject jsonObj = new JsonObject();
				
				if("1".equals(map.get("GENDER"))) {
					jsonObj.addProperty("gender","남자");
				}
				else {
					jsonObj.addProperty("gender","여자");
				}
				
				
				jsonObj.addProperty("cnt", map.get("CNT"));
				jsonObj.addProperty("percnt", map.get("PERCNT"));
				
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
	}
	
	// 회원 관리 페이지
	@RequestMapping(value="/jinsoo/memberManage.go", method= {RequestMethod.GET} )
	public ModelAndView memberManage(ModelAndView mv , HttpServletRequest request ) {
		
		List<JinsoomemberVO> jsmvoList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총회원 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 회원 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
		
		
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");
	
		
		
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());
	
		paramap.put("str_sizePerPage", str_sizePerPage);
		
		if("".equals(searchWord)) {
			totalCount=  service.allMember();
		}
		else {
			totalCount=  service.getTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		jsmvoList = service.getMemberList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "memberManage.go";
		int blockSize = 10; 
		
		  
		pagebar += MyUtil.JSmakePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		HttpSession session = request.getSession();
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		mv.addObject("jsmvoList", jsmvoList);
		mv.setViewName("jinsoo/manager/memberManage.tiles1");
		
		return mv;
	}
	
	// 검색어 자동 완성하기
	@RequestMapping(value="/jinsoo/wordSearchShow.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String wordSearchShow(HttpServletRequest request) {
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());
		
		List<String> wordList =  service.wordSearchShow(paramap);
		
		JSONArray jsonArr = new JSONArray();
		
		if(wordList != null) {
			for(String word :wordList) {
				JSONObject jobj = new JSONObject();
				jobj.put("word",word);
				jsonArr.put(jobj);
			}
		}
		String result = jsonArr.toString();
		
		return result;		
		
	}
	
	// 통계: 예약 현황 통계
	@RequestMapping(value="/jinsoo/todayReserveJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String todayReserveJSON() {
		
		int todayRList = service.allReserve();
		int todayRstartList = service.todayStartReserve();
	//	int todayRendList = service.todayEndReserve();
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("todayRList", todayRList);
		jsonObj.addProperty("todayRstartList", todayRstartList);
//		jsonObj.addProperty("todayRendList", todayRendList);
		
		String result = jsonObj.toString();
		
		return result;
		
	}
	
	// 통계: 예약된 회원 연령별 현황 가져오기
	@RequestMapping(value="/jinsoo/ageReserveJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String ageReserveJSON() {
		
		List<HashMap<String,String>> ageRList =  service.ageReserveList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(ageRList != null) {
			for(HashMap<String,String> map :ageRList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("age", map.get("AGE"));
				jsonObj.addProperty("cnt", map.get("CNT"));								
				jsonObj.addProperty("percnt", map.get("PERCNT"));							
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
		
	}
	
	
	// 통계: 예약된 회원 연령별로 검색한 성별  통계
	@RequestMapping(value="/jinsoo/ageGenderReserveJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String ageGenderReserveJSON(HttpServletRequest request) {
		
		String age = request.getParameter("age");

		List<HashMap<String,String>> ageGenderRList =  service.ageGenderReserveList(age);
		
		JsonArray jsonArr = new JsonArray(); 
		
		if(ageGenderRList != null) {
			for(HashMap<String,String> map :ageGenderRList) {
				JsonObject jsonObj = new JsonObject();
				
				if("1".equals(map.get("GENDER"))) {
					jsonObj.addProperty("gender","남자");
				}
				else {
					jsonObj.addProperty("gender","여자");
				}
				
				
				jsonObj.addProperty("cnt", map.get("CNT"));
				jsonObj.addProperty("percnt", map.get("PERCNT"));
				
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
	}
	
	// 통계: 대분류로 정렬한 예약 현황  통계
	@RequestMapping(value="/jinsoo/categoryReserveJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String categoryReserveJSON() {
		
		List<HashMap<String,String>> categoryRList =  service.categoryReserveList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(categoryRList != null) {
			for(HashMap<String,String> map :categoryRList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("largecategoryname", map.get("LARGECATEGORYNAME"));
				jsonObj.addProperty("cnt", map.get("CNT"));								
				jsonObj.addProperty("percnt", map.get("PERCNT"));							
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
		
	}
	
	// 예약 관리 페이지
	@RequestMapping(value="/jinsoo/reserveManage.go", method= {RequestMethod.GET} )
	public ModelAndView reserveManage(ModelAndView mv , HttpServletRequest request) {
		
		List<reserveVO> reservevoList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총예약 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 예약 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
				
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");		
				
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());		
		paramap.put("str_sizePerPage", str_sizePerPage);
		
		if("".equals(searchWord)) {
			totalCount=  service.allReserveList();
		}
		else {
			totalCount=  service.getReserveTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		reservevoList = service.getReserveList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "reserveManage.go";
		int blockSize = 10; 
		
		  
		pagebar += MyUtil.JSmakePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		HttpSession session = request.getSession();
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		mv.addObject("reservevoList", reservevoList);
		mv.setViewName("jinsoo/manager/reserveList.tiles1");
		
		return mv;

		
	}
	
	
	// 통계: 상품 현황 통계
	@RequestMapping(value="/jinsoo/productStatusJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String productStatusJSON() {
		
		int todayPList = service.allProduct();
	//	int todayRstartList = service.todayStartReserve();
	//	int todayRendList = service.todayEndReserve();
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("todayPList", todayPList);
//		jsonObj.addProperty("todayRstartList", todayRstartList);
//		jsonObj.addProperty("todayRendList", todayRendList);
		
		String result = jsonObj.toString();
		
		return result;
		
	}
	
	
	// 통계: 상품 종류별 현황 통계
	@RequestMapping(value="/jinsoo/categoryProductJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String categoryProductJSON() {
		
		List<HashMap<String,String>> categoryPList =  service.categoryProductList();
		
		JsonArray jsonArr = new JsonArray();
		
		if(categoryPList != null) {
			for(HashMap<String,String> map :categoryPList) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("largecategoryname", map.get("LARGECATEGORYNAME"));
				jsonObj.addProperty("cnt", map.get("CNT"));								
				jsonObj.addProperty("percnt", map.get("PERCNT"));							
				jsonArr.add(jsonObj);
			}
		}
		return new Gson().toJson(jsonArr);
		
	}
	
	// 상품 관리
	@RequestMapping(value="/jinsoo/productManage.go", method= {RequestMethod.GET} )
	public ModelAndView productManage(ModelAndView mv , HttpServletRequest request) {
	
		List<HotelVO> hotelvoList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총회원 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 회원 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
				
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");		
				
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());		
		paramap.put("str_sizePerPage", str_sizePerPage);
		
		if("".equals(searchWord)) {
			totalCount=  service.allHotel();
		}
		else {
			totalCount=  service.getHotelTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		hotelvoList = service.getHotelList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "productManage.go";
		int blockSize = 10; 
		
		  
		pagebar += MyUtil.JSmakePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		HttpSession session = request.getSession();
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		mv.addObject("hotelvoList", hotelvoList);
		mv.setViewName("jinsoo/manager/hotelvoList.tiles1");
		
		return mv;
		
	
	}
	

	
	
	// 차트:  매출 통계 JSON으로 얻어오기
		@RequestMapping(value="/jinsoo/revenueStatusJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
		@ResponseBody
		public String revenueStatusJSON() {
			
			
			String yearRevenue =  service.yearRevenue(); // 연 매출 현황
			String monthRevenue =  service.monthRevenue(); // 연 매출 현황 
			String todayRevenue =  service.todayRevenue(); // 일 매출 현황
			
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("yearRevenue", yearRevenue);
			jsonObj.addProperty("monthRevenue", monthRevenue);
			jsonObj.addProperty("todayRevenue", todayRevenue);
			
			String result = jsonObj.toString();
			
			return result;
			
		}
	
		// 차트: 종류별 매출 통계 JSON으로 얻어오기
		@RequestMapping(value="/jinsoo/categoryRevenueJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
		@ResponseBody
		public String categoryRevenueJSON() {
			
			List<HashMap<String,String>> categoryRevenueList =  service.categoryRevenueList();
			
			JsonArray jsonArr = new JsonArray();
			
			if(categoryRevenueList != null) {
				for(HashMap<String,String> map :categoryRevenueList) {
					JsonObject jsonObj = new JsonObject();
					jsonObj.addProperty("largecategoryname", map.get("LARGECATEGORYNAME"));
					jsonObj.addProperty("allprice", map.get("ALLPRICE"));																				
					jsonArr.add(jsonObj);
				}
			}
			return new Gson().toJson(jsonArr);
			
		}
		
		// 차트: 월별 매출 통계 JSON으로 얻어오기
		@RequestMapping(value="/jinsoo/MonthRevenueJSON.go", method= {RequestMethod.GET}  , produces="text/plain;charset=UTF-8" )
		@ResponseBody
		public String MonthRevenueJSON() {
			
			List<HashMap<String,String>> MonthRevenueList =  service.MonthRevenueList();
			
			JsonArray jsonArr = new JsonArray();
			
			if(MonthRevenueList != null) {
				for(HashMap<String,String> map :MonthRevenueList) {
					JsonObject jsonObj = new JsonObject();
					jsonObj.addProperty("month", map.get("MONTH"));
					jsonObj.addProperty("revenue", map.get("REVENUE"));																				
					jsonArr.add(jsonObj);
				}
			}
			return new Gson().toJson(jsonArr);
			
		}
		
}
