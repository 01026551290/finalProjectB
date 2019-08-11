package com.spring.god.jinsoo.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;





@Repository
public class BoardDAO implements InterBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
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

	// 1개 글 보여주기 
	@Override
	public BoardVO getbuisnessBoardView(String seq) {
		BoardVO boardvo = sqlsession.selectOne("jinsoodb.getbuisnessBoardView", seq);
		return boardvo;
	}

	//글조회수 증가는 다른 사람의 글을 읽을 때만 증가하도록 한다. 로그인 하지 않은 상태에서 글을 읽을때 조회수 증가가 일어나지 않도록 해야한다.
	@Override
	public void setAddReadCount(String seq) {
		sqlsession.update("jinsoodb.AddReadCount" ,seq);		
	}

	// 코멘트 보이기
	@Override
	public List<CommentVO> getCommentList(String parentSeq) {
		List<CommentVO> commentlist = sqlsession.selectList("jinsoodb.getCommentList", parentSeq);
		return commentlist;	
	}

	// 코멘트 추가하기
	@Override
	public int addComment(CommentVO commentvo) {
		int n  = sqlsession.insert("jinsoodb.addComment", commentvo);
		return n;
	}

	// 보드테이블 카운트증가하기
	@Override
	public int updateCommentCount(String parentSeq) {
		int n = sqlsession.update("jinsoodb.updateCommentCount", parentSeq);
		return n;
	}

	// 문의 사항 글쓰기
	@Override
	public int inquiryadd(BoardVO boardvo) {
		int n = sqlsession.insert("jinsoodb.inquiryadd", boardvo);		
		return n;
	}


	// 문의 사항 글쓰기 (파일첨부)
	@Override
	public int inquiryadd_withFile(BoardVO boardvo) {
		int n = sqlsession.insert("jinsoodb.inquiryadd_withFile", boardvo);				
		return n;
	}

	// 문의 게시판 총 게시물 수 구해오기
	@Override
	public int allinquiryBoardList() {
		int totalCount = sqlsession.selectOne("jinsoodb.allinquiryBoardList");
		return totalCount;
	}

	// 검색조건이 있는 문의사항 총 게시물 구해오기
	@Override
	public int getinquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.getinquiryBoardListTotalCountWithSearch" , paramap);
		return totalCount;
	}

	// 검색 조건이 있는 문의사항리스트 가져오기
	@Override
	public List<BoardVO> getinquiryBoardList(HashMap<String, String> paramap) {
		List<BoardVO> inquiryBoardList = sqlsession.selectList("jinsoodb.getinquiryBoardList", paramap);
		return inquiryBoardList;
	}

	//  문의사항 글 보기
	@Override
	public BoardVO getinquiryBoardView(String seq) {
		BoardVO boardvo = sqlsession.selectOne("jinsoodb.getinquiryBoardView", seq);
		return boardvo;
	}

	// 문의사항 답변보이기
	@Override
	public List<CommentVO> inquiryCommentList(String parentSeq) {
		List<CommentVO> commentlist = sqlsession.selectList("jinsoodb.inquiryCommentList", parentSeq);
		return commentlist;	
	}

	// 사용자 문의 사항 글 갯수
	@Override
	public int personinquiryBoardList(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.personinquiryBoardList",paramap);
		return totalCount;
	}

	// 검색 조건이 있는 사용자 문의 사항 갯수
	@Override
	public int psersoninquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount = sqlsession.selectOne("jinsoodb.psersoninquiryBoardListTotalCountWithSearch",paramap);
		return totalCount;
	}

	// 사용자 문의 사항 글 보기
	@Override
	public List<BoardVO> psersoninquiryBoardList(HashMap<String, String> paramap) {
		List<BoardVO> inquiryBoardList = sqlsession.selectList("jinsoodb.psersoninquiryBoardList", paramap);
		return inquiryBoardList;
	}

	// 문의 사항 삭제하기
	@Override
	public int del(BoardVO boardvo) {
		int del = sqlsession.update("jinsoodb.del", boardvo);
		return del;
	}






}
