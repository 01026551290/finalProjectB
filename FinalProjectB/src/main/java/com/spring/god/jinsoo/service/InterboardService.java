package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.HotelVO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.model.JinsoomemberVO;
import com.spring.god.jinsoo.model.reserveVO;

public interface InterboardService {


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

	// 문의 사항 글쓰기
	int inquiryadd(BoardVO boardvo);

	// 문의 사항 글쓰기 (파일첨부)
	int inquiryadd_withFile(BoardVO boardvo);

	// 문의 게시판 총 게시물 수 구해오기
	int allinquiryBoardList();

	// 검색조건이 있는 문의사항 총 게시물 구해오기
	int getinquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap);

	// 검색 조건이 있는 문의사항리스트 가져오기
	List<BoardVO> getinquiryBoardList(HashMap<String, String> paramap);

	//  문의사항 글 보기
	BoardVO getinquiryBoardView(String seq);

	// 문의사항 답변보이기
	List<CommentVO> inquiryCommentList(String seq);

	// 사용자 문의 사항 글 갯수
	int personinquiryBoardList(HashMap<String, String> paramap);

	// 검색 조건이 있는 사용자 문의 사항 갯수
	int psersoninquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap);

	// 사용자 문의 사항 글 보기
	List<BoardVO> psersoninquiryBoardList(HashMap<String, String> paramap);

	// 문의 사항 삭제하기
	int del(BoardVO boardvo);

	
	

	


	

	

	

	
	

}
