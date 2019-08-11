package com.spring.god.jinsoo.model;

import java.util.HashMap;
import java.util.List;

public interface InterBoardDAO {

	
	// groupno 컬럼의 최대값 구하기
	int getGroupnoMax();

	// 글쓰기(파일첨부없는)
	int add(BoardVO boardvo);

	// 파일 첨부  글쓰기
	int add_withFile(BoardVO boardvo);

	// 업주 게시판 총 게시물 수 구해오기
	int allbuisnessBoardList();

	// 검색 조건이 있는 업주 게시판 게시물 수 구해오기
	int getbuisnessBoardListTotalCountWithSearch(HashMap<String, String> paramap);

	// 검색 조건이 있는 게시물리스트 가져오기
	List<BoardVO> getbuisnessBoardList(HashMap<String, String> paramap);

	// 1개 글 보여주기 
	BoardVO getbuisnessBoardView(String seq);

	// 글조회수 증가는 다른 사람의 글을 읽을 때만 증가하도록 한다. 로그인 하지 않은 상태에서 글을 읽을때 조회수 증가가 일어나지 않도록 해야한다.
	void setAddReadCount(String seq);

	// 코멘트 보이기
	List<CommentVO> getCommentList(String parentSeq);

	// 코멘트 추가하기
	int addComment(CommentVO commentvo);

	// 보드테이블 카운트증가하기
	int updateCommentCount(String parentSeq);

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
	List<CommentVO> inquiryCommentList(String parentSeq);

	// 사용자 문의 사항 글 갯수
	int personinquiryBoardList(HashMap<String, String> paramap);

	// 검색 조건이 있는 사용자 문의 사항 갯수
	int psersoninquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap);

	// 사용자 문의 사항 글 보기
	List<BoardVO> psersoninquiryBoardList(HashMap<String, String> paramap);

	// 문의 사항 삭제하기
	int del(BoardVO boardvo);




	

	

	
}
