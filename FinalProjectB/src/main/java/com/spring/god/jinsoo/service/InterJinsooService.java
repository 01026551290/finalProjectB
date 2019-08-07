package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.HotelVO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.model.JinsoomemberVO;
import com.spring.god.jinsoo.model.reserveVO;

public interface InterJinsooService {

	// 차트:  성별 JSON으로 얻어오기
	List<HashMap<String, String>> getGenderCntList();

	// 관리자 로그인하기
	JinsooadminVO adminLogin(HashMap<String, String> adminmap);

	// 통계: 총 회원수 구하기
	int allMember();

	// 통계: 오늘 회원 가입 현황 보기
	int todayStartmember();

	// 통계: 오늘 탈퇴 회원 보기
	int todayEndmember();
	
	// 통계: 연령별 회원 통계
	List<HashMap<String, String>> ageMemberList();
	
	// 통계: 연령별로 검색한 성별 회원 통계
	List<HashMap<String, String>> ageGenderList(String age);
	
	// 검색조건 있는 총 회원수 구해오기
	int getTotalCountWithSearch(HashMap<String, String> paramap);

	// 회원 정보 구해오기
	List<JinsoomemberVO> getMemberList(HashMap<String, String> paramap);

	// 검색어 자동 완성하기
	List<String> wordSearchShow(HashMap<String, String> paramap);

	// 예약통계 : 현재 예약되어있는 총 예약건수 구해오기
	int allReserve();

	// 예약통계 : 오늘 예약되어진 예약건수 구해오기
	int todayStartReserve();

	// 예약통계 : 오늘 예약취소되어진 건수 구해오기
//	int todayEndReserve();

	// 통계: 예약된 회원 연령별 현황 가져오기
	List<HashMap<String, String>> ageReserveList();

	// 통계: 예약된 회원 연령별로 검색한 성별  통계
	List<HashMap<String, String>> ageGenderReserveList(String age);

	// 통계: 대분류로 정렬한 예약 현황  통계
	List<HashMap<String, String>> categoryReserveList();

	// 검색조건 있는 총 예약수 구해오기
	int getReserveTotalCountWithSearch(HashMap<String, String> paramap);

	// 예약 정보 구해오기
	List<reserveVO> getReserveList(HashMap<String, String> paramap);

	// 통계: 현재 등록되어진 상품 갯수 구하기
	int allProduct();

	// 통계: 상품 종류별 현황 통계
	List<HashMap<String, String>> categoryProductList();

	// 숙박 총갯수
	int allHotel();

	// 검색조건 있는 총 숙박수 구해오기
	int getHotelTotalCountWithSearch(HashMap<String, String> paramap);

	// 검색조건에 맞는 숙박정보 얻어오기
	List<HotelVO> getHotelList(HashMap<String, String> paramap);

	// 파일 첨부 없는 글쓰기
	int add(BoardVO boardvo);

	// 파일 첨부  글쓰기
	int add_withFile(BoardVO boardvo);

	// 업주 게시판 총 게시물 수 구해오기
	int allbuisnessBoardList();

	// 검색 조건이 있는 업주 게시판 게시물 수 구해오기
	int getbuisnessBoardListTotalCountWithSearch(HashMap<String, String> paramap);

	// 검색 조건이 있는 게시물리스트 가져오기
	List<BoardVO> getbuisnessBoardList(HashMap<String, String> paramap);

	// 글보기
	BoardVO getbuisnessBoardView(String seq, String userid);

	// 글 조횟수 증가 안되게 글 보기
	BoardVO getViewWithNoAddCount(String seq);

	// 코멘트 보이기
	List<CommentVO> getCommentList(String parentSeq);

	// 코멘트 추가하기
	int addComment(CommentVO commentvo);

	// 통계: 연 매출 현황
	String yearRevenue();

	// 통계: 월 매출 현황
	String monthRevenue();

	// 통계: 일 매출 현황
	String todayRevenue();

	// 차트: 종류별 매출 통계 JSON으로 얻어오기
	List<HashMap<String, String>> categoryRevenueList();

	


	

	

	

	
	

}
