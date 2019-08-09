package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.HotelVO;
import com.spring.god.jinsoo.model.InterJinsooDAO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.model.JinsoomemberVO;
import com.spring.god.jinsoo.model.reserveVO;

@Service
public class JinsooService implements InterJinsooService {

	@Autowired
	private InterJinsooDAO dao;

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

	// 파일 첨부 없는 글쓰기
	@Override
	public int add(BoardVO boardvo) {
		
		if(boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {
					
			int groupno = dao.getGroupnoMax()+1;
			
			boardvo.setGroupNo(String.valueOf(groupno));
		}
		
		int n = dao.add(boardvo);
		return n;
	}

	// 파일 첨부  글쓰기
	@Override
	public int add_withFile(BoardVO boardvo) {
		if(boardvo.getFk_seq() == null || boardvo.getFk_seq().trim().isEmpty()) {			
			int groupno = dao.getGroupnoMax()+1;
			
			boardvo.setGroupNo(String.valueOf(groupno));
		}		
		int n = dao.add_withFile(boardvo);	
		return n;
	}

	// 업주 게시판 총 게시물 수 구해오기
	@Override
	public int allbuisnessBoardList() {
		int totalCount = dao.allbuisnessBoardList();
		return totalCount;
	}

	// 검색 조건이 있는 업주 게시판 게시물 수 구해오기
	@Override
	public int getbuisnessBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount =  dao.getbuisnessBoardListTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 검색 조건이 있는 게시물리스트 가져오기
	@Override
	public List<BoardVO> getbuisnessBoardList(HashMap<String, String> paramap) {
		List<BoardVO> buisnessBoardList = dao.getbuisnessBoardList(paramap);
		return buisnessBoardList;
	}

	// 글보기
	@Override
	public BoardVO getbuisnessBoardView(String seq, String userid) {
		
		BoardVO boardvo = dao.getbuisnessBoardView(seq);

		if(userid != null && !(boardvo.getFk_member().equals(userid))) {
			// 글조회수 증가는 다른 사람의 글을 읽을때만 증가하도록 해야 한다. 로그인 하지 않은 성태에서는 글을 읽을수가 없다.
			dao.setAddReadCount(seq); // 글 조회수 증가하기
			boardvo = dao.getbuisnessBoardView(seq);
		}
		
		return boardvo;
	}

	// 글 조횟수 증가 안되게 글 보기
	@Override
	public BoardVO getViewWithNoAddCount(String seq) {
		BoardVO boardvo = dao.getbuisnessBoardView(seq);	
		return boardvo;
	}

	// 코멘트 보이기
	@Override
	public List<CommentVO> getCommentList(String parentSeq) {
		List<CommentVO> commentlist = dao.getCommentList(parentSeq);
		return commentlist;
	}

	// 코멘트 추가하기
	@Override
	public int addComment(CommentVO commentvo) {
		
		int result = 0;
		int n = 0; 
		
		n = dao.addComment(commentvo);		
		if(n==1) {
			result = dao.updateCommentCount(commentvo.getParentSeq());			
		}
		
		return result;
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


	


	
}
