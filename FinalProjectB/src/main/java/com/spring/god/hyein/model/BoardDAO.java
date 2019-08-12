package com.spring.god.hyein.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.hyein.model.BoardVO;

@Repository
public class BoardDAO implements InterBoardDAO {

	// === 의존객체 주입하기(DI: Dependency Injection) === //
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private SqlSessionTemplate sqlsession;

	// === 검색조건이 없을 경우의 총 게시물 건수(totalCount) === //
	@Override
	public int getTotalCountWithNOsearch() {
		int count = sqlsession.selectOne("hyeindb.getTotalCountWithNOsearch");
		return count;
	}

	// === 검색조건이 있을 경우의 총 게시물 건수(totalCount) === //
	@Override
	public int getTotalCountWithSearch(HashMap<String, String> paraMap) {
		int count = sqlsession.selectOne("hyeindb.getTotalCountWithSearch", paraMap);
		return count;
	}

	// === 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 다 포함한 것) === //
	@Override
	public List<BoardVO> boardListWithPaging(HashMap<String, String> paraMap) {
		List<BoardVO> boardList = sqlsession.selectList("hyeindb.boardListWithPaging", paraMap);
		return boardList;
	}

	// === 글조회수 1증가하기 === //
	@Override
	public void setAddReadCount(String seq) {
		sqlsession.update("hyeindb.setAddReadCount", seq);
	}

	// === 1개 글 보여주기 === //
	@Override
	public BoardVO getView(String seq) {
		BoardVO boardvo = sqlsession.selectOne("hyeindb.getView", seq);
		return boardvo;
	}

	// === 글쓰기(파일첨부가 없는 글쓰기) === //
	@Override
	public int noticeAdd(BoardVO boardvo) {
		int n = sqlsession.insert("hyeindb.noticeAdd", boardvo);
		return n;
	}

	// === 글쓰기(파일첨부가 있는 글쓰기) === //
	@Override
	public int noticeAdd_withFile(BoardVO boardvo) {
		int n = sqlsession.insert("hyeindb.noticeAdd_withFile", boardvo);		
		return n;
	}

	// === 글수정 및 글삭제시 암호일치 여부 알아오기 === 
	@Override
	public boolean checkPW(BoardVO boardvo) {
		int n = sqlsession.selectOne("hyeindb.checkPW", boardvo); 
		
		if(n==1) 
			return true;
		else
			return false;
	}

	// === 글수정 완료하기 ===
	@Override
	public int updateNoticeBoard(BoardVO boardvo) {
		int n = sqlsession.update("hyeindb.updateNoticeBoard", boardvo);
		return n;
	}

	// === 글삭제하기 ===
	@Override
	public int deleteNoticeBoard(BoardVO boardvo) {
		int n = sqlsession.update("hyeindb.deleteNoticeBoard", boardvo);
		return n;
	}
	
}
