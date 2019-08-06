package com.spring.god.jinsoo.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class JinsooDAO implements InterJinsooDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 차트:  성별 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> getGenderCntList() {
		
		List<HashMap<String, String>> genderList = sqlsession.selectList("jinsoodb.getGenderCntList");
		return genderList;
	}

	// 관리자 로그인하기
	@Override
	public JinsooadminVO adminLogin(HashMap<String, String> adminmap) {
		JinsooadminVO adminvo = sqlsession.selectOne("jinsoodb.adminLogin", adminmap);
		return adminvo;
	}

	// 통계: 회원 가입 현황 보기
	@Override
	public int allMember() {
		int todayList = sqlsession.selectOne("jinsoodb.allMember");
		return todayList;
	}

	// 통계: 오늘 회원 가입 현황 보기
	@Override
	public int todayStartmember() {
		int todayStartList = sqlsession.selectOne("jinsoodb.todayStartmember");
		return todayStartList;
	}

	// 통계: 오늘 탈퇴 회원 보기
	@Override
	public int todayEndmember() {
		int todayEndList = sqlsession.selectOne("jinsoodb.todayEndmember");
		return todayEndList;
	}

	// 통계: 연령별 회원 통계
	@Override
	public List<HashMap<String, String>> ageMemberList() {
		List<HashMap<String,String>> ageMemberList =  sqlsession.selectList("jinsoodb.ageMemberList");
		return ageMemberList;
	}

	// 통계: 연령별로 검색한 성별 회원 통계
	@Override
	public List<HashMap<String, String>> ageGenderList(String age) {
		List<HashMap<String,String>> ageGenderList =  sqlsession.selectList("jinsoodb.ageGenderList" , age);
		return ageGenderList;
	}
	
	// 검색조건 있는 총 회원수 구해오기
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.getTotalCountWithSearch" , paramap);
		return totalCount;
	}

	// 회원 정보 구해오기
	@Override
	public List<JinsoomemberVO> getMemberList(HashMap<String, String> paramap) {
		List<JinsoomemberVO> jsmvoList = sqlsession.selectList("jinsoodb.getMemberList", paramap);
		return jsmvoList;
	}

	// 검색어 자동 완성하기
	@Override
	public List<String> wordSearchShow(HashMap<String, String> paramap) {
		List<String> wordList = sqlsession.selectList("jinsoodb.wordSearchShow", paramap);
		return wordList;
	}

	// 예약통계 : 현재 예약되어있는 총 예약건수 구해오기
	@Override
	public int allReserve() {
		int todayRList = sqlsession.selectOne("jinsoodb.allReserve");
		return todayRList;
	}

	// 예약통계 : 오늘 예약되어진 예약건수 구해오기
	@Override
	public int todayStartReserve() {
		int todayRstartList = sqlsession.selectOne("jinsoodb.todayStartReserve");
		return todayRstartList;
	}
/*
	// 예약통계 : 오늘 예약취소되어진 건수 구해오기
	@Override
	public int todayEndReserve() {
		int todayRendList = sqlsession.selectOne("jinsoodb.todayEndReserve");
		return todayRendList;
	}
*/

	// 통계: 예약된 회원 연령별 현황 가져오기
	@Override
	public List<HashMap<String, String>> ageReserveList() {
		List<HashMap<String,String>> ageRList =  sqlsession.selectList("jinsoodb.ageReserveList");
		return ageRList;
	}

	// 통계: 예약된 회원 연령별로 검색한 성별  통계
	@Override
	public List<HashMap<String, String>> ageGenderReserveList(String age) {
		List<HashMap<String,String>> ageGenderRList =  sqlsession.selectList("jinsoodb.ageGenderReserveList",age);
		return ageGenderRList;
	}

	// 통계: 대분류로 정렬한 예약 현황  통계
	@Override
	public List<HashMap<String, String>> categoryReserveList() {
		List<HashMap<String,String>> categoryRList =  sqlsession.selectList("jinsoodb.categoryReserveList");
		return categoryRList;
	}

	// 검색조건 있는 총 예약수 구해오기
	@Override
	public int getReserveTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.getReserveTotalCountWithSearch" , paramap);
		return totalCount;
	}

	// 예약 정보 구해오기
	@Override
	public List<reserveVO> getReserveList(HashMap<String, String> paramap) {
		List<reserveVO> reservevoList = sqlsession.selectList("jinsoodb.getReserveList", paramap);
		return reservevoList;
	}

	// 통계: 현재 등록되어진 상품 갯수 구하기
	@Override
	public int allProduct() {
		int todayPList = sqlsession.selectOne("jinsoodb.allProduct");
		return todayPList;
	}

	// 통계: 상품 종류별 현황 통계
	@Override
	public List<HashMap<String, String>> categoryProductList() {
		List<HashMap<String,String>> categoryPList =  sqlsession.selectList("jinsoodb.categoryProductList");
		return categoryPList;
	}

	// 숙박 총갯수
	@Override
	public int allHotel() {
		int totalCount=  sqlsession.selectOne("jinsoodb.allHotel");
		return totalCount;
	}

	// 검색조건 있는 총 숙박수 구해오기
	@Override
	public int getHotelTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.getHotelTotalCountWithSearch" , paramap);
		return totalCount;
	}

	// 검색조건에 맞는 숙박정보 얻어오기
	@Override
	public List<HotelVO> getHotelList(HashMap<String, String> paramap) {
		List<HotelVO> hotelvoList = sqlsession.selectList("jinsoodb.getHotelList", paramap);
		return hotelvoList;
	}

	// groupno 컬럼의 최대값 구하기
	@Override
	public int getGroupnoMax() {
		 int max = sqlsession.selectOne("jinsoodb.getGroupnoMax");
		 return max;
	}

	// 글쓰기(파일첨부없는)
	@Override
	public int add(BoardVO boardvo) {
		
		int n = sqlsession.insert("jinsoodb.addBoard", boardvo);		
		return n;
	}

	// 파일 첨부  글쓰기
	@Override
	public int add_withFile(BoardVO boardvo) {
		
		int n = sqlsession.insert("jinsoodb.add_withFile", boardvo);		
		
		return n;
	}

	// 업주 게시판 총 게시물 수 구해오기
	@Override
	public int allbuisnessBoardList() {
		int totalCount = sqlsession.selectOne("jinsoodb.allbuisnessBoardList");
		return totalCount;
	}

	// 검색 조건이 있는 업주 게시판 게시물 수 구해오기
	@Override
	public int getbuisnessBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.getbuisnessBoardListTotalCountWithSearch" , paramap);
		return totalCount;
	}

	// 검색 조건이 있는 게시물리스트 가져오기
	@Override
	public List<BoardVO> getbuisnessBoardList(HashMap<String, String> paramap) {
		List<BoardVO> buisnessBoardList = sqlsession.selectList("jinsoodb.getbuisnessBoardList", paramap);
		return buisnessBoardList;
	}





}
