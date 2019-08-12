package com.spring.god.jinsoo.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.FileManager;
import com.spring.god.common.MyUtil;
import com.spring.god.jinsoo.model.BoardVO;
import com.spring.god.jinsoo.model.CommentVO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.jinsoo.service.InterAdminService;
import com.spring.god.jinsoo.service.InterboardService;
import com.spring.god.jiyoung.model.MemberVO;

@Controller
public class AdminBoardController {

	                  
	@Autowired
	private InterboardService boardservice;
	
	@Autowired
	private InterAdminService service;
	
	@Autowired
	private FileManager fileManager;
	

	
	@RequestMapping(value="/jinsoo/buisnessBoard.go" , method= {RequestMethod.GET})
	public ModelAndView buisnessBoard(HttpServletRequest request ,  HttpServletResponse response ,ModelAndView mv ) {
		
		String fk_seq = request.getParameter("fk_seq");
		String groupno = request.getParameter("groupno");
		String depthno = request.getParameter("depthno");
		
		mv.addObject("fk_seq", fk_seq);
		mv.addObject("groupno", groupno);
		mv.addObject("depthno", depthno);
		
		mv.setViewName("jinsoo/board/buisnessBoard.tiles1");
		
		return mv;
	}
	
	@RequestMapping(value="/jinsoo/buisnessBoardEnd.go" , method= {RequestMethod.POST})
	public String addEnd(BoardVO boardvo, MultipartHttpServletRequest mrequest ) {
		
		
		MultipartFile attach = boardvo.getAttach();
		
		if(!attach.isEmpty()) {
	
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String newFileName = "";
		
			
			byte[] bytes = null;
			
			
			long fileSize = 0;
	
			
			try {
				bytes = attach.getBytes();

				
				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
				
				boardvo.setFileName(newFileName);
				boardvo.setOrgFilename(attach.getOriginalFilename());
				
				fileSize = attach.getSize(); 
				
				boardvo.setFileSize(String.valueOf(fileSize));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		int n = 0;
		if(attach.isEmpty()) {
			
			 n = boardservice.add(boardvo);
		}
		else {
			 n = boardservice.add_withFile(boardvo);
		}
		
		mrequest.setAttribute("n", n);
		
		return "jinsoo/board/buisnessBoardEnd.tiles1";
	}

	@RequestMapping(value="/jinsoo/buisnessBoardList.go" , method= {RequestMethod.GET})
	public ModelAndView buisnessBoardList(ModelAndView mv , HttpServletRequest request) {
		
		List<BoardVO> buisnessBoardList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총회원 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 회원 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
				
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");		
				
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());		
		paramap.put("str_sizePerPage", str_sizePerPage);
		
		if("".equals(searchWord)) {
			totalCount=  boardservice.allbuisnessBoardList();
		}
		else {
			totalCount=  boardservice.getbuisnessBoardListTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		buisnessBoardList = boardservice.getbuisnessBoardList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "buisnessBoardList.go";
		int blockSize = 10; 
		
		  
		pagebar += MyUtil.makePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		HttpSession session = request.getSession();
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		
		mv.addObject("buisnessBoardList", buisnessBoardList);
		mv.setViewName("jinsoo/board/buisnessBoardList.tiles1");
		
		return mv;
		
	}
	
	// 글 한개 보기
	@RequestMapping(value="/jinsoo/buisnessBoardView.go" , method= {RequestMethod.GET})
	public ModelAndView view(HttpServletRequest request ,  HttpServletResponse response ,ModelAndView mv) {
		
		String seq = request.getParameter("seq");	
		
		HttpSession session = request.getSession();	
			
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");		
		
			
		JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");		
		String userid = null;
		
		if(loginuser != null && adminvo != null ) {
	//		userid = loginuser.getFk_MemberId()();  // 로그인 되어진 사용자의 userid
			userid = adminvo.getName();
		}
		
		
		BoardVO boardvo = null;
		
		if("yes".equals(session.getAttribute("readCountPermisision"))) {
			// 글목록 보기를 클릭한 다음 특정 글을 조회해온 경우
		
		
		
			boardvo = boardservice.getbuisnessBoardView(seq,userid);
			session.removeAttribute("readCountPermisision");
			// 중요함!! session 에 저장된 값을 삭제한다.
		}
		else {
			
			boardvo = boardservice.getViewWithNoAddCount(seq); 
			
		}
		List<CommentVO> commentlist = boardservice.getCommentList(seq);				
		
		mv.addObject("boardvo" , boardvo);
		mv.addObject("commentlist" , commentlist);
		mv.setViewName("jinsoo/board/buisnessBoardview.tiles1");
		
		return mv;
	}
	
	@RequestMapping(value="/addComment.go" , method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String addComment(HttpServletRequest request , CommentVO commentvo) {
		
		
		String jsonStr = "";
		
		//댓글쓰기 (ajax 처리)
		int n;
		try {
			n = boardservice.addComment(commentvo);
			
			if(n==1) {
				// 댓글쓰기 및 원게시물(tblBoard 테이블)에 댓글의 갯수(1씩 증가) 증가가 성공했다라면 
				List<CommentVO> commentlist = boardservice.getCommentList(commentvo.getParentSeq());
				// 원게시물에 딸린 댓글 조회해오기
				
				JSONArray jsArr = new JSONArray();
				
				for(CommentVO cvo :commentlist) {
					JSONObject jobj =  new JSONObject();	
					jobj.put("name", cvo.getName());
					jobj.put("content", cvo.getContent());
					jobj.put("regDate", cvo.getRegDate());
		
					jsArr.put(jobj);
				}
				jsonStr = jsArr.toString();
				
			}
		} catch (Throwable e) {
			
			e.printStackTrace();
		}

		return jsonStr;
	}
	
	@RequestMapping(value="/jinsoo/buisnessBoardedit.go" , method= {RequestMethod.GET})
	public ModelAndView buisnessBoardedit(ModelAndView mv , HttpServletRequest request) {
		// 글 수정 해야할 글 번호 가져오기
		String seq = request.getParameter("seq");
		
		// 글 수정해야할 글 1개 내용 가져오기 
		BoardVO boardvo = boardservice.getViewWithNoAddCount(seq); 
		
		HttpSession session =  request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");
		
		if(session.getAttribute("loginuser") != null) {
			if(!( loginuser.getFk_MemberId().equals(boardvo.getFk_member())) || !( adminvo.getName().equals(boardvo.getFk_member())) ) {
				String msg = "다른 사용자의 글은 수정이 불가합니다.";
				String loc = "javascript:history.back()";
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				
				mv.setViewName("tiles1/jinsoo/msg");
			}
			else {
				// 자신의 글을 수정할 경우
				// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
				mv.addObject("boardvo", boardvo);
				
				mv.setViewName("jinsoo/board/buisnessBoardedit.tiles1");
			}
		}
		if(session.getAttribute("adminvo") != null) {
			if(!( adminvo.getName().equals(boardvo.getFk_member())) ) {
				String msg = "다른 사용자의 글은 수정이 불가합니다.";
				String loc = "javascript:history.back()";
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				
				mv.setViewName("tiles1/jinsoo/msg");
			}
			else {
				// 자신의 글을 수정할 경우
				// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다.
				mv.addObject("boardvo", boardvo);
				
				mv.setViewName("jinsoo/board/buisnessBoardedit.tiles1");
			}
		}
		return mv;
		
		/*글 삭제 하기 */
	}
	
	
	// 문의 사항 글쓰기
	@RequestMapping(value="/jinsoo/inquiryBoard.go" , method= {RequestMethod.GET})
	public ModelAndView inquiryBoard(HttpServletRequest request ,  HttpServletResponse response ,ModelAndView mv ) {
				
		
		mv.setViewName("jinsoo/board/inquiryBoard.tiles1");
		
		return mv;
	}
	
	// 문의 사항 글 쓰기 완료 
	@RequestMapping(value="/admin_inquiryBoardEnd.go" , method= {RequestMethod.POST})
	public String inquiryBoardEnd(BoardVO boardvo, MultipartHttpServletRequest mrequest ) {
		
		
		MultipartFile attach = boardvo.getAttach();
		
		if(!attach.isEmpty()) {
	
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			String newFileName = "";
		
			
			byte[] bytes = null;
			
			
			long fileSize = 0;
	
			
			try {
				bytes = attach.getBytes();

				
				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
				
				boardvo.setFileName(newFileName);
				boardvo.setOrgFilename(attach.getOriginalFilename());
				
				fileSize = attach.getSize(); 
				
				boardvo.setFileSize(String.valueOf(fileSize));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		int n = 0;
		if(attach.isEmpty()) {
			
			 n = boardservice.inquiryadd(boardvo);
		}
		else {
			 n = boardservice.inquiryadd_withFile(boardvo);
		}
		
		mrequest.setAttribute("n", n);
		
		return "jinsoo/board/inquiryBoardEnd.tiles1";
	}

	// 문의 전체 사항 보기( 관리자 )
	@RequestMapping(value="/jinsoo/inquiryBoardList.go" , method= {RequestMethod.GET})
	public ModelAndView inquiryBoardList(ModelAndView mv , HttpServletRequest request) {
		
		List<BoardVO> inquiryBoardList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총회원 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 회원 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
				
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");		
				
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());		
		paramap.put("str_sizePerPage", str_sizePerPage);
		
		if("".equals(searchWord)) {
			totalCount=  boardservice.allinquiryBoardList();
		}
		else {
			totalCount=  boardservice.getinquiryBoardListTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		inquiryBoardList = boardservice.getinquiryBoardList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "inquiryBoardList.go";
		int blockSize = 10; 
		
		  
		pagebar += MyUtil.makePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		HttpSession session = request.getSession();
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		
		mv.addObject("inquiryBoardList", inquiryBoardList);
		mv.setViewName("jinsoo/board/inquiryBoardList.tiles1");
		
		return mv;
		
	}
	
	
	// 문의사항  보기
	@RequestMapping(value="/jinsoo_personinquiryBoardList.go" , method= {RequestMethod.GET})
	public ModelAndView personinquiryBoardList(ModelAndView mv , HttpServletRequest request) {
		
		List<BoardVO> inquiryBoardList = null;
		
		HttpSession session = request.getSession();	
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String memberid = loginuser.getMemberId();
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총회원 건수
		int sizePerPage = 0; // 한 페이지당 보여줄 회원 수
		int currentShowPageNo = 0; // 현재보여주는 페이지 번호로서, 초기치로는 1페이지로 설정해야한다
		int totalPage = 0; // 총페이지 수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;	// 시작 행 번호
		int endRno = 0;		// 끝 행 번호
		
		String str_sizePerPage = request.getParameter("sizePerPage");	
		
		if(str_sizePerPage == null) {
			sizePerPage = 10;
		}
		else {
			try {
				sizePerPage = Integer.parseInt(str_sizePerPage);
				
				if(sizePerPage < 1) {
					sizePerPage = 10;
				}
				
			}catch (NumberFormatException e) {
				sizePerPage = 10;
			}
		}
		
		
		String searchType = request.getParameter("searchType");		
		String searchWord = request.getParameter("searchWord");		
		
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			
			searchWord = "";
		}
		
		
		HashMap<String,String> paramap = new HashMap<String,String>();
		
		paramap.put("searchType", searchType);
		paramap.put("searchWord", searchWord.trim());		
		paramap.put("str_sizePerPage", str_sizePerPage);
		paramap.put("memberid", memberid);
		
		if("".equals(searchWord)) {
			totalCount=  boardservice.personinquiryBoardList(paramap);
		}
		else {
			totalCount=  boardservice.psersoninquiryBoardListTotalCountWithSearch(paramap);
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면 
			currentShowPageNo = 1;
			// 즉, 초기화면은 1로 한다.
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
			}catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage )+1 ;		
		endRno = startRno + sizePerPage - 1;
		
		paramap.put("startRno", String.valueOf(startRno));
		paramap.put("endRno", String.valueOf(endRno));
		
		inquiryBoardList = boardservice.psersoninquiryBoardList(paramap);
		
		
		if(!("".equals(searchWord)) ) {
			mv.addObject("paramap", paramap);
		}
		else {
			
		}
		
		String pagebar = "<ul>";
		
		String url = "inquiryBoardList.go";
		int blockSize = 10; 
		
		
		pagebar += MyUtil.makePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar +=  "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		
		String url1 = MyUtil.getCurrentURL(request);
		
		session.setAttribute("gobackURL", url1);
		
		
		
		mv.addObject("inquiryBoardList", inquiryBoardList);
		mv.setViewName("jinsoo/board/inquiryBoardList.tiles1");
		
		return mv;
		
	}
	
	
	// 문의사항  보기
	@RequestMapping(value="jinsoo_inquiryBoardView.go" , method= {RequestMethod.GET})
	public ModelAndView inquiryview(HttpServletRequest request ,  HttpServletResponse response ,ModelAndView mv) {
		
		String seq = request.getParameter("seq");	
		
		HttpSession session = request.getSession();	
			
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");		
		
			
		JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");		
		String userid = null;
		
		if(loginuser != null && adminvo != null ) {
	//		userid = loginuser.getFk_MemberId()();  // 로그인 되어진 사용자의 userid
			userid = adminvo.getName();
		}
		
		
		BoardVO boardvo = null;
		
		boardvo = boardservice.getinquiryBoardView(seq);
		
		List<CommentVO> commentlist = boardservice.inquiryCommentList(seq);				
		
		mv.addObject("boardvo" , boardvo);
		mv.addObject("commentlist" , commentlist);
		mv.setViewName("jinsoo/board/inquiryBoardview.tiles1");
		
		return mv;
	}
	
	
	// 글 삭제페이지 요청	
	@RequestMapping(value="/admin_inquiryBoarddel.go" , method= {RequestMethod.GET})
	public ModelAndView del(HttpServletRequest request ,  HttpServletResponse response,ModelAndView mv,BoardVO boardvo) {
		
		String seq = request.getParameter("seq");
		
		boardvo = boardservice.getinquiryBoardView(seq); 
		
		HttpSession session =  request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		System.out.println(loginuser.getMemberId());
		System.out.println(boardvo);
		System.out.println(boardvo.getFk_member());
		
		if(!( loginuser.getMemberId().equals(boardvo.getFk_member())) ) {
			String msg = "다른 사용자의 글은 삭제가 불가합니다.";
			String loc = "javascript:history.back()";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			
			mv.setViewName("msg");
		}
		else {
			// 자신의 글을 삭제할 경우
			// 글삭제시 입력한 암호가 글작성시 입력해준 암호와 일치하는지 알아오도록 view단 페이지로 넘긴다.
			mv.addObject("seq", seq);
			
			mv.setViewName("jinsoo/board/del.tiles1");
			
		}
		
		return mv;
	}
	
	// 문의사항 삭제하기
	@RequestMapping(value="/admin_delEnd.go" , method= {RequestMethod.POST})
	public ModelAndView delEnd(HttpServletRequest request ,  HttpServletResponse response,ModelAndView mv ) {
	
		try {
				String pw = request.getParameter("pw");
				String seq = request.getParameter("seq");
				
				BoardVO boardvo = new BoardVO();
				
				boardvo.setSeq(seq);
				boardvo.setPw(pw);
				
				int result;
				
					result = boardservice.del(boardvo);
					
					if(result == 0) {
						mv.addObject("msg", "암호가 일치하지 않습니다.");
					}else {
						mv.addObject("msg", "글삭제성공");
					}
					mv.addObject("loc", request.getContextPath()+"/jinsoo_personinquiryBoardList.go");
					mv.setViewName("tiles1/jinsoo/msg");
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		
		return mv;
	
	}
		
	
}
