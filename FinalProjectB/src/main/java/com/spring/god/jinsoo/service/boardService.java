package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.InterAdminDAO;
import com.spring.god.jinsoo.model.InterBoardDAO;


@Service
public class boardService implements InterboardService {

	@Autowired
	private InterBoardDAO dao;

	
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

	// 문의 사항 글쓰기
	@Override
	public int inquiryadd(BoardVO boardvo) {
		int n = dao.inquiryadd(boardvo);
		return n;
	}

	// 문의 사항 글쓰기 (파일첨부)
	@Override
	public int inquiryadd_withFile(BoardVO boardvo) {
		int n = dao.inquiryadd_withFile(boardvo);	
		return n;
	}

	// 문의 게시판 총 게시물 수 구해오기
	@Override
	public int allinquiryBoardList() {
		int totalCount = dao.allinquiryBoardList();
		return totalCount;
	}

	// 검색조건이 있는 문의사항 총 게시물 구해오기
	@Override
	public int getinquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount =  dao.getinquiryBoardListTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 검색 조건이 있는 문의사항리스트 가져오기
	@Override
	public List<BoardVO> getinquiryBoardList(HashMap<String, String> paramap) {
		List<BoardVO> inquiryBoardList = dao.getinquiryBoardList(paramap);
		return inquiryBoardList;
	}

	//  문의사항 글 보기
	@Override
	public BoardVO getinquiryBoardView(String seq) {
		BoardVO boardvo = dao.getinquiryBoardView(seq);		
		return boardvo;
	}

	// 문의사항 답변보이기
	@Override
	public List<CommentVO> inquiryCommentList(String parentSeq) {
		List<CommentVO> commentlist = dao.inquiryCommentList(parentSeq);
		return commentlist;
	}

	// 사용자 문의 사항 글 갯수
	@Override
	public int personinquiryBoardList(HashMap<String, String> paramap) {
		int totalCount = dao.personinquiryBoardList(paramap);
		return totalCount;
	}

	// 검색 조건이 있는 사용자 문의 사항 갯수
	@Override
	public int psersoninquiryBoardListTotalCountWithSearch(HashMap<String, String> paramap) {
		int totalCount =  dao.psersoninquiryBoardListTotalCountWithSearch(paramap);
		return totalCount;
	}

	// 사용자 문의 사항 글 보기
	@Override
	public List<BoardVO> psersoninquiryBoardList(HashMap<String, String> paramap) {
		List<BoardVO> inquiryBoardList = dao.psersoninquiryBoardList(paramap);
		return inquiryBoardList;
	}

	// 문의 사항 삭제하기
	@Override
	public int del(BoardVO boardvo) {
		int del = dao.del(boardvo);
		return del;
	}

	
}
