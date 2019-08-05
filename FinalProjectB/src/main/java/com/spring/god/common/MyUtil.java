package com.spring.god.common;
import javax.servlet.http.HttpServletRequest;

public class MyUtil {
	
	// *** 물음표 다음의 데이터까지 포함한 URL 주소를 알려주는 메소드
	
	public static String getCurrentURL(HttpServletRequest request) {
		
		String currentURL = request.getRequestURL().toString();
		// http://localhost:9090/MyMVC/shop/prodView.kh
		
		String queryString = request.getQueryString();
		// pnum=8
		
		currentURL += "?"+queryString;
		// http://localhost:9090/MyMVC/shop/prodView.kh?pnum=8
		
		String ctxPath = request.getContextPath();
		// /MyMVC
		
		int beginIndex = currentURL.indexOf(ctxPath)+ ctxPath.length();
		
		currentURL = currentURL.substring(beginIndex+1);
		// shop/prodView.kh?pnum=8
		
		return currentURL;
		
	}// end of public static String getCurrentURL(HttpServletRequest request)
	
	// 검색어가 포함된 페이지바 만들기 
	public static String makePageBar(String url,int currentShowPageNo ,int sizePerPage , int totalPage , int blockSize , String searchType , String searchWord , String range ) {
		
		String pageBar = "";
		
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 갯수
		/*
		 	1 2 3 4 5 6 7 8 9 10  --- 1개 블럭
		 */
		
		int loop = 1;
		/*
		 	loop 는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수(지금은 10개(blockSize))까지만 증가하는 용도이다.
		 */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize)*blockSize + 1;
		// 공식
		
		/*
		
		  1  2  3  4  5  6  7  8  9  10 -- 첫번째 블럭의 페이지번호 시작값(pageNo)은 1이다.
		 11 12 13 14 15 16 17 18 19  20 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11이다.
		 21 22 23 24 25 26 27 28 29  30 -- 두번째 블럭의 페이지번호 시작값(pageNo)은 21이다.
		 
		 currentShowPageNo            pageNo
		-----------------------------------------
				1						1 = ((currentShowPageNo - 1)/ blockSize)*blockSize + 1
				2						1 = ((3 - 1)/ blockSize)*blockSize + 1
				3
				4
				5
				6
				7
				8
				9
				10
				11						11 = ((currentShowPageNo - 1)/ blockSize)*blockSize + 1
				12
				13
				
				
				
				30
				

		*/
		
		
		
		// [이전] 만들기
		if(pageNo != 1) {
		pageBar += "&nbsp;<a href='"+url+"?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"&range="+range+"' >[이전]</a>&nbsp;";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo ) {
			pageBar += "&nbsp;<span style='color: red; border: 1px solid gray; padding: 2px 4px;'>"+ pageNo+"</span>&nbsp;";
			}
			else {
			pageBar += "&nbsp;<a href='"+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"&range="+range+" ' >"
					+ pageNo+"</a>&nbsp;";
			}
			
			loop++;
			pageNo++;
		}// end of while--------------
		
		// [다음] 만들기
		if(!(pageNo > totalPage)) {
			pageBar += "&nbsp;<a href='"+url+"?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"&range="+range+" ' >[다음]</a>&nbsp;";
		}
		
	
		
		
		return pageBar;
	}// end of public static String makePageBar(url, currentShowPageNo , sizePerPage , totalPage , blockSize , searchType , searchWord );
	
	
	public static String replaceParameter(String param) {
		String result = param;
		
		if(param != null) {
			result = result.replaceAll("<", "&lt;"); // &lt; 부등호를 말한다.
			result = result.replaceAll(">", "&gt;"); // &lt; 부등호를 말한다.
			result = result.replaceAll("&", "&amp;"); // &lt; 부등호를 말한다.
			result = result.replaceAll("\"", "&quot;"); // &lt; 부등호를 말한다.
			result = result.replaceAll("\r\n", "<br/>");
		}
		
		return result;
	}// end of private String replaceParameter(String param)-------------
	
	
	
}
