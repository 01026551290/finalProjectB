package com.spring.god.hyein.model;

import java.util.HashMap;
import java.util.List;

public interface InterBoardDAO {

	int getTotalCountWithNOsearch(); // 검색조건이 없을 경우의 총 게시물 건수(totalCount)

	int getTotalCountWithSearch(HashMap<String, String> paraMap); // 검색조건이 있을 경우의 총 게시물 건수(totalCount)

	List<BoardVO> boardListWithPaging(HashMap<String, String> paraMap); // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 다 포함한 것)

	void setAddReadCount(String seq); // 글조회수 1증가하기

	BoardVO getView(String seq); // 1개 글 보여주기

	int noticeAdd(BoardVO boardvo); // 글쓰기(파일첨부가 없는 글쓰기)

	int noticeAdd_withFile(BoardVO boardvo); // 글쓰기(파일첨부가 있는 글쓰기)

	boolean checkPW(BoardVO boardvo); // 글수정 및 글삭제시 암호일치 여부 알아오기

	int updateNoticeBoard(BoardVO boardvo); // 글수정 완료하기

	int deleteNoticeBoard(BoardVO boardvo); // 글삭제하기

	
}
