package com.spring.god.hyein.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.hyein.model.BoardVO;
import com.spring.god.common.MyUtil;
import com.spring.god.common.SHA256;
import com.spring.god.common.FileManager;
import com.spring.god.hyein.service.InterBoardService;
import com.spring.god.jinsoo.model.JinsooadminVO;

@Component
@Controller
public class BoardController {
	
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterBoardService service;
	
	@Autowired
	private FileManager fileManager;
	
	// === 글목록 보기 페이지 요청 ===
	@RequestMapping(value="/noticeList.go", method= {RequestMethod.GET})
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mv) {
		
		List<BoardVO> boardList = null;
		
		// === #109. 페이징 처리를 한 검색어가 있는 전체 글목록 보여주기 === //
		// 페이징 처리를 통한 글목록 보여주기는 예를 들어 3페이지의 내용을 보고자 한다라면
		// /list.action?currentShowPageNo=3 와 같이 해주어야 한다.
			
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0;  		// 총게시물 건수
		int sizePerPage = 10; 		// 한 페이지당 보여줄 게시물 수 change
		int currentShowPageNo = 0;	// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;			// 총 페이지수 (웹브라우저 상에 보여줄 총 페이지 갯수, 페이지바)
		
		int startRno = 0;			// 시작 행번호
		int endRno   = 0;			// 끝 행번호
			
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		// 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을 때로 나뉘어진다.
		
		// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithNOsearch();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearch(paraMap);
		}
		
		totalPage = (int) Math.ceil( (double)totalCount/sizePerPage ); 
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			
			currentShowPageNo = 1;
			// 즉, 초기화면은 /list.action?currentShowPageNo=1 로 한다는 말이다.
		} else {
			
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1; // 무조건 1을 주겠다
				}
				
			} catch (NumberFormatException e) { // 장난치면
				currentShowPageNo = 1; // 무조건 1을 주겠다
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다. (공식임!!!) ****
		/*
		 	currentShowPageNo	startRno	endRno
		 	--------------------------------------
		 		  1 page	===>   1		  5
		 		  2 page	===>   6		  10
		 		  3 page	===>   11		  15
		 		  4 page	===>   16		  20
		 		  ......		   ...        ...      
		 */
		
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1; 
		endRno = startRno + sizePerPage - 1; 
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		boardList = service.boardListWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 다 포함한 것)
		
		if(!"".equals(searchWord)) {
			mv.addObject("paraMap", paraMap);
		}
		
		// === 페이지바 만들기 ===
		String pagebar = "<ul>";
		
		String url = "noticeList.go";
		int blockSize = 10;
		
		pagebar += MyUtil.makePageBar(url, currentShowPageNo, sizePerPage, totalPage, blockSize, searchType, searchWord);
		
		pagebar += "</ul>";
		
		mv.addObject("pagebar", pagebar);
		
		String gobackURL =  MyUtil.getCurrentURL(request);
		// 페이징 처리되어진 후 특정 글제목을 클릭하여 상세내용을 본 이후에
		// 사용자가 목록보기 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		mv.addObject("gobackURL", gobackURL); // request 영역에 저장시키는 것이다.
		////////////////////////////////////////////////////////
		
			// === #68. 글조회수(readCount)증가 (DML문 update)는
			//          반드시 목록보기에 와서 해당 글제목을 클릭했을 경우에만
			//          증가되고, 웹브라우저에서 새로고침(F5)을 했을 경우에는
			//          증가가 되지 않도록 해야 한다.
			//          이것을 하기 위해서는 session 을 사용하여 처리하면 된다.
			HttpSession session = request.getSession();
			session.setAttribute("readCountPermission", "yes"); 
			/*
			   session 에  "readCountPermission" 키값으로 저장된 value값은 "yes" 이다.
			   session 에  "readCountPermission" 키값에 해당하는 value값 "yes"를 얻으려면 
			      반드시 웹브라우저에서 주소창에 "/list.action" 이라고 입력해야만 얻어올 수 있다. 
			 */
			
			///////////////////////////////////////////////////
			
			mv.addObject("boardList", boardList);
//			mv.setViewName("board/list.tiles1");
			mv.setViewName("hyein/board/noticeList.tiles1");
			
			return mv;
		
	}
	
	
	// === 글1개를 보여주는 페이지 요청 ===
	   @RequestMapping(value="/noticeView.go", method= {RequestMethod.GET})	
	   public ModelAndView view(HttpServletRequest request, ModelAndView mv) {
		   
		    HttpSession session =  request.getSession();
			JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");
			
			session.setAttribute("adminvo", adminvo);
		   
		   // 조회하고자 하는 글번호 받아오기
		   String seq = request.getParameter("seq");
		   
		   String gobackURL = request.getParameter("gobackURL");
		   mv.addObject("gobackURL", gobackURL);
		   
//		   HttpSession session = request.getSession();
//		   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
//		   
//		   String userid = null; 
//		   
//		   if(loginuser != null) {
//			   userid = loginuser.getMemberId(); // 로그인 되어진 사용자의 userid
//			   
//		   }
		   
		   BoardVO boardvo = null;
		   
		   // 위의 글목록보기에서 session.setAttribute("readCountPermission", "yes"); 해두었다.
		   if("yes".equals(session.getAttribute("readCountPermission")) ) {
		   // 글목록보기를 클릭한 다음 특정글을 조회해온 경우이다.
			   
			   boardvo = service.getView(seq);
			   // 글조회수 증가와 함께 글1개 조회를 해주는 것
			   
			   session.removeAttribute("readCountPermission");
			   // 중요함!! session 에 저장된 readCountPermission을 삭제한다.
			   
		   }
		   else {
				  boardvo = service.getViewWithNoAddCount(seq);
				  // 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것
		   }
		   
//		   request.setAttribute("boardvo", boardvo);
		   
		   
		   String content = boardvo.getContent();
		   /*content = content.replaceAll("\r\n", "<br/>");
		   content = content.replaceAll("&lt;", "<");
		   content = content.replaceAll("&gt;", ">");
		   content = content.replaceAll("&amp;", "&");
		   content = content.replaceAll("&quot;", "\"");*/
		   
//		   boardvo.setContent(content);
			
		   mv.addObject("boardvo", boardvo);
		   mv.setViewName("hyein/board/noticeView.tiles1");
		   
		return mv;
		   
	   }	

	   
		// === 공지사항 글쓰기 폼페이지 요청 (관리자만 가능) ===
		@RequestMapping(value="/noticeAdd.go", method= {RequestMethod.GET})
		public ModelAndView requireLogin_noticeAdd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) { 
			
			HttpSession session =  request.getSession();
			JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");
			
			session.setAttribute("adminvo", adminvo);
			
			
			// === #124. 답변글쓰기가 추가된 경우 ===
			/*
			String fk_seq = request.getParameter("fk_seq");
			String groupno = request.getParameter("groupno");
			String depthno = request.getParameter("depthno");
			
			mv.addObject("fk_seq", fk_seq);
			mv.addObject("groupno", groupno);
			mv.addObject("depthno", depthno);
			*/
			/////////////////////////////////////////////////
			
			mv.setViewName("hyein/board/noticeAdd.tiles1");
			
			return mv;
		}
		
		
		// === 공지사항 글쓰기 완료 요청 ===
		@RequestMapping(value="/noticeAddEnd.go", method= {RequestMethod.POST}) 
		public String noticeAddEnd(BoardVO boardvo, MultipartHttpServletRequest mrequest) { //파일첨부를 하려면  addEnd(BoardVO boardvo, ModelAndView mv) 이렇게는 불가하다

//		public String noticeAddEnd(BoardVO boardvo, HttpServletRequest request) {
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
			String content = boardvo.getContent();
			
			// *** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성하기 *** //
			/*boardvo.setContent(MyUtil.replaceParameter(content));  	   
			
			content = boardvo.getContent().replaceAll("\r\n", "<br/>");
			boardvo.setContent(content);*/
			//////////////////////////////////////////////////////////////////
			
			int n = 0;
			if(attach.isEmpty()) {
				
				 n = service.noticeAdd(boardvo);
			}
			else {
				 n = service.noticeAdd_withFile(boardvo);
			}
			
			mrequest.setAttribute("n", n);
			
			return "hyein/board/noticeAddEnd.tiles1";
			
		}
			
		// 공지사항 글수정 페이지 요청 (관리자만 가능)
		@RequestMapping(value="/noticeEdit.go" , method= {RequestMethod.GET})
		public ModelAndView requireLogin_noticeEdit(HttpServletRequest request,HttpServletResponse response,ModelAndView mv) {
			
			// 글 수정 해야할 글 번호 가져오기
			String seq = request.getParameter("seq");
			
			// 글 수정해야할 글 1개 내용 가져오기 
			BoardVO boardvo = service.getViewWithNoAddCount(seq); 
			
			HttpSession session =  request.getSession();
//			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			JinsooadminVO adminvo = (JinsooadminVO)session.getAttribute("adminvo");
			
			/*
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
			*/
			
			
//			 if(session.getAttribute("adminvo") != null) {
//				if(!( adminvo.getName().equals(boardvo.getFk_member())) ) {
//					String msg = "다른 관리자의 글은 수정이 불가합니다!!";
//					String loc = "javascript:history.back()";
//					mv.addObject("msg", msg);
//					mv.addObject("loc", loc);
//					
//					mv.setViewName("tiles1/hyein/msg");
//				}
//				else {
//					// 자신의 글을 수정할 경우
//					// 가져온 1개글을 글수정할 폼이 있는 view 단으로 보내준다. 
					mv.addObject("boardvo", boardvo);
					
					mv.setViewName("hyein/board/noticeEdit.tiles1");
//				}
//			}
			return mv;
		}
		
		// 글수정 완료하기
		@RequestMapping(value="/noticeEditEnd.go", method= {RequestMethod.POST})
		public ModelAndView noticeEditEnd(HttpServletRequest request, HttpServletResponse response, BoardVO boardvo, ModelAndView mv) {
		
//			String content = boardvo.getContent();
			   
		   // *** 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성하기 *** //
//		   content = MyUtil.replaceParameter(content);
//		   content = content.replaceAll("\r\n", "<br/>");
//		   
//		   boardvo.setContent(content);
		   ///////////////////////////////////////////////////////////////////
		   
		   /* 글 수정을 하려면 원본글의 글암호와 수정시 입력해준 암호가 일치할때만
		   	수정이 가능하도록 해야 한다. */
		   
//			String subject = boardvo.getSubject();
//			System.out.println("subject=>" + subject);
			
		   String seq = request.getParameter("seq");
		   String pw = request.getParameter("pw");
		   
		   boardvo.setSeq(seq);
		   boardvo.setPw(pw);
			
		   int n = service.noticeEdit(boardvo);
		   
		   if(n == 0) {
			   mv.addObject("msg", "암호가 일치하지 않아 글 수정이 불가합니다.");
		   }
		   else {
			   mv.addObject("msg", "글이 수정되었습니다!!");
		   }
		   
		   mv.addObject("loc", request.getContextPath()+"/noticeView.go?seq="+boardvo.getSeq());
		   mv.setViewName("tiles1/hyein/msg");
		   
		   return mv;
			   
		}	
		
		// 글삭제하기
		@RequestMapping(value="/noticeDelEnd.go", method= {RequestMethod.POST})
		public ModelAndView noticeDelEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
			
			try {
			   // 삭제해야할 글번호 및 사용자가 입력한 암호를 받아온다.
			   String seq = request.getParameter("seq");
			   String pw = request.getParameter("pw");
			   
			   BoardVO boardvo = new BoardVO();
			   boardvo.setSeq(seq);
			   boardvo.setPw(pw);
			   
			   int n = service.noticeDel(boardvo);
			   
			   if(n == 0) {
				   mv.addObject("msg", "암호가 일치하지 않아 글 삭제가 불가합니다.");
			   }
			   else {
				   mv.addObject("msg", "글이 삭제되었습니다!!");
			   }
			   
			   mv.addObject("loc", request.getContextPath()+"/noticeList.go");
			   mv.setViewName("tiles1/hyein/msg");
		   
		    } catch (Throwable e) {
				e.printStackTrace();
			}
		   
		    return mv;
			
		}
}
