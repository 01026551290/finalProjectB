package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.HotelVO;
import com.spring.god.jinsoo.model.InterAdminDAO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.model.JinsoomemberVO;
import com.spring.god.jinsoo.model.reserveVO;

@Service
public class adminService implements InterAdminService {

	@Autowired
	private InterAdminDAO dao;

	// 차트:  성별 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> getGenderCntList() {
		
		List<HashMap<String, String>> genderList = dao.getGenderCntList();
		return genderList;
	}

	// 관리자 로그인하기
	@Override
	public JinsooadminVO adminLogin(HashMap<String, String> adminmap) {
		JinsooadminVO adminvo = dao.adminLogin(adminmap);
		return adminvo;
	}

	// 통계: 회원 가입 현황 보기
	@Override
	public int allMember() {
		int todayList = dao.allMember();
		return todayList;
	}

	// 통계: 오늘 회원 가입 현황 보기
	@Override
	public int todayStartmember() {
		int todayStartList = dao.todayStartmember();
		return todayStartList;
	}

	// 통계: 오늘 탈퇴 회원 보기
	@Override
	public int todayEndmember() {
		int todayEndList = dao.todayEndmember();
		return todayEndList;
	}
	
	// 통계: 연령별 회원 통계
	@Override
	public List<HashMap<String, String>> ageMemberList() {
		List<HashMap<String,String>> ageMemberList =  dao.ageMemberList();
		return ageMemberList;
	}
	
	// 통계: 연령별로 검색한 성별 회원 통계
	@Override
	public List<HashMap<String, String>> ageGenderList(String age) {
		List<HashMap<String,String>> ageGenderList =  dao.ageGenderList(age);
		return ageGenderList;
	}
	
	// 검색조건 있는 총 회원수 구해오기
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount =  dao.getTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 회원 정보 구해오기
	@Override
	public List<JinsoomemberVO> getMemberList(HashMap<String, String> paramap) {
		List<JinsoomemberVO> jsmvoList = dao.getMemberList(paramap);
		return jsmvoList;
	}

	// 검색어 자동 완성하기
	@Override
	public List<String> wordSearchShow(HashMap<String, String> paramap) {
		List<String> wordList =  dao.wordSearchShow(paramap);
		return wordList;
	}

	// 예약통계 : 현재 예약되어있는 총 예약건수 구해오기
	@Override
	public int allReserve() {	
		int todayRList = dao.allReserve();
		return todayRList;
	}

	// 예약통계 : 오늘 예약되어진 예약건수 구해오기
	@Override
	public int todayStartReserve() {
		int todayRstartList = dao.todayStartReserve();
		return todayRstartList;
	}

/*	// 예약통계 : 오늘 예약취소되어진 건수 구해오기
	@Override
	public int todayEndReserve() {
		int todayRendList = dao.todayEndReserve();
		return todayRendList;
	}
*/

	// 통계: 예약된 회원 연령별 현황 가져오기
	@Override
	public List<HashMap<String, String>> ageReserveList() {
		List<HashMap<String,String>> ageRList =  dao.ageReserveList();
		return ageRList;
	}

	// 통계: 예약된 회원 연령별로 검색한 성별  통계
	@Override
	public List<HashMap<String, String>> ageGenderReserveList(String age) {
		List<HashMap<String,String>> ageGenderRList =  dao.ageGenderReserveList(age);
		return ageGenderRList;
	}

	// 통계: 대분류로 정렬한 예약 현황  통계
	@Override
	public List<HashMap<String, String>> categoryReserveList() {
		List<HashMap<String,String>> categoryRList =  dao.categoryReserveList();
		return categoryRList;
	}

	// 검색조건 있는 총 예약수 구해오기
	@Override
	public int getReserveTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount=  dao.getReserveTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 예약 정보 구해오기
	@Override
	public List<reserveVO> getReserveList(HashMap<String, String> paramap) {
		List<reserveVO> reservevoList = dao.getReserveList(paramap);
		return reservevoList;
	}

	// 통계: 현재 등록되어진 상품 갯수 구하기
	@Override
	public int allProduct() {
		int todayPList = dao.allProduct();
		return todayPList;
	}

	// 통계: 상품 종류별 현황 통계
	@Override
	public List<HashMap<String, String>> categoryProductList() {
		List<HashMap<String,String>> categoryPList =  dao.categoryProductList();
		return categoryPList;
	}

	// 숙박 총갯수
	@Override
	public int allHotel() {
		int totalCount=  dao.allHotel();
		return totalCount;
	}

	// 검색조건 있는 총 숙박수 구해오기
	@Override
	public int getHotelTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount =  dao.getHotelTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 검색조건에 맞는 숙박정보 얻어오기
	@Override
	public List<HotelVO> getHotelList(HashMap<String, String> paramap) {
		List<HotelVO> hotelvoList = dao.getHotelList(paramap);
		return hotelvoList;
	}

	

	// 통계: 연 매출 현황
	@Override
	public String yearRevenue() {
		String yearRevenue =  dao.yearRevenue();
		return yearRevenue;
	}

	// 통계: 월 매출 현황
	@Override
	public String monthRevenue() {
		String monthRevenue =  dao.monthRevenue();
		return monthRevenue;
	}

	// 통계: 일 매출 현황
	@Override
	public String todayRevenue() {
		String todayRevenue =  dao.todayRevenue();
		return todayRevenue;
	}

	// 차트: 종류별 매출 통계 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> categoryRevenueList() {
		List<HashMap<String,String>> categoryRevenueList =  dao.categoryRevenueList();
		return categoryRevenueList;
	}

	// 총 예약수 구하기
	@Override
	public int allReserveList() {
		int allReserveList = dao.allReserveList();
		return allReserveList;
	}

	// 차트: 월별 매출 통계 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> MonthRevenueList() {
		List<HashMap<String,String>> MonthRevenueList =  dao.MonthRevenueList();
		return MonthRevenueList;
	}

	// 차트: 요일별 매출 통계 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> dayRevenueList() {
		List<HashMap<String,String>> dayRevenueList =  dao.dayRevenueList();
		return dayRevenueList;
	}

	// 체크아웃시키기
	@Override
	public int checkOut(String reserveId) {
		int n = dao.checkOut(reserveId);
		return n;
	}

	// 차트: 선택 달 일별 매출 통계 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> MdayRevenue(String month) {
		List<HashMap<String,String>> MdayRevenueList =  dao.MdayRevenue(month);
		return MdayRevenueList;
	}


	


	
}
