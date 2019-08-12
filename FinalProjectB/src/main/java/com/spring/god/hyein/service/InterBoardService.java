package com.spring.god.hyein.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.BoardVO;
import com.spring.god.hyein.model.MemberVO;

public interface InterBoardService {

	int getTotalCountWithNOsearch(); // 검색조건이 없을 경우의 총 게시물 건수(totalCount)

	int getTotalCountWithSearch(HashMap<String, String> paraMap); // 검색조건이 있을 경우의 총 게시물 건수(totalCount)

	List<BoardVO> boardListWithPaging(HashMap<String, String> paraMap); // 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 다 포함한 것)
	
	BoardVO getView(String seq); // 1개 글 보여주기

	int noticeAdd(BoardVO boardvo); // 글쓰기(파일첨부가 없는 글쓰기)

	int noticeAdd_withFile(BoardVO boardvo); // 글쓰기(파일첨부가 있는 글쓰기)

	BoardVO getViewWithNoAddCount(String seq); // 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것

	int noticeEdit(BoardVO boardvo); // 글수정 완료하기

	int noticeDel(BoardVO boardvo); // 글삭제하기

}
