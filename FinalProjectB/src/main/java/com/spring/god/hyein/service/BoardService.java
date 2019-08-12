package com.spring.god.hyein.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.hyein.model.BoardVO;
import com.spring.god.hyein.model.InterBoardDAO;
import com.spring.god.hyein.model.MemberVO;
import com.spring.god.common.AES256;

@Service
public class BoardService implements InterBoardService {

	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterBoardDAO dao;
	
	//===== #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 암호화/복호화 하기위한 클래스 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private AES256 aes;

	// === 검색조건이 없을 경우의 총 게시물 건수(totalCount) ===
	@Override
	public int getTotalCountWithNOsearch() {
		int count = dao.getTotalCountWithNOsearch();
		return count;
	}

	// === 검색조건이 있을 경우의 총 게시물 건수(totalCount) ===
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int count = dao.getTotalCountWithSearch(paraMap);
		return count;
	}

	// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 다 포함한 것)
	@Override
	public List<BoardVO> boardListWithPaging(HashMap<String, String> paraMap) {
		List<BoardVO> boardList = dao.boardListWithPaging(paraMap);
		return boardList;
	}

	// 1개 글 보여주기
	@Override
	public BoardVO getView(String seq) {
		
		dao.setAddReadCount(seq);  // 글조회수 1 증가하기
		BoardVO boardvo = dao.getView(seq);
		
		return boardvo;
	}

	// 글쓰기(파일첨부가 없는 글쓰기)
	@Override
	public int noticeAdd(BoardVO boardvo) {
		int n = dao.noticeAdd(boardvo);
		return n;
	}

	// 글쓰기(파일첨부가 있는 글쓰기)
	@Override
	public int noticeAdd_withFile(BoardVO boardvo) {
		int n = dao.noticeAdd_withFile(boardvo);
		return n;
	}

	// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것
	@Override
	public BoardVO getViewWithNoAddCount(String seq) {
		BoardVO boardvo = dao.getView(seq);	
		return boardvo;
	}

	// 글수정 완료하기
	@Override
	public int noticeEdit(BoardVO boardvo) {
		// 수정하려하는 글에 대한 원래의 암호를 읽어와서 
		// 수정시 입력한 암호와 비교를 한다.
		boolean bool = dao.checkPW(boardvo);
		
		if(!bool) // 암호가 일치 하지 않는 경우
			return 0;
		else {
			// 글 1개를 수정한다.
			int n = dao.updateNoticeBoard(boardvo);
			
			return n;
		}
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class}) 
	public int noticeDel(BoardVO boardvo) {
		
		// 삭제하려는 글에 대한 원래의 암호를 읽어와서 
		// 삭제시 입력한 암호와 비교를 한다.
		boolean bool = dao.checkPW(boardvo);
		
		if(!bool) // 암호가 일치 하지 않는 경우
			return 0;
		else {
						
			// 글 1개를 삭제한다.
			int n = dao.deleteNoticeBoard(boardvo);  
			
			return n;
		}
	}
	
}
