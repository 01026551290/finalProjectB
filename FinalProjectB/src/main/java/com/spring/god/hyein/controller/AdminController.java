package com.spring.god.hyein.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.god.common.FileManager;
import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.PhotoVO;
import com.spring.god.hyein.service.InterAdminService;

@Controller
public class AdminController {

	@Autowired 
	private InterAdminService service;
	
	// === #2. 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private FileManager fileManager;
	
	// 숙소 등록 뷰단 보여주기
	@RequestMapping(value="/roomrg.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg.tiles1");
		
		return mv;
	}
	
	
	// 숙소 등록하기
	@RequestMapping(value="/roomrgEnd.go", method={RequestMethod.POST} )
	public String roomRegistrationEnd(HotelRoomVO hotelroomvo, MultipartHttpServletRequest mrequest) {
		/*
		System.out.println(hotelroomvo.getLseq());
		System.out.println(hotelroomvo.getName());
		System.out.println(hotelroomvo.getBusinessTel());
		System.out.println(hotelroomvo.getAddress());
		System.out.println(hotelroomvo.getInfo());
		System.out.println(hotelroomvo.getOntionType());
		System.out.println(hotelroomvo.getAttach());
		*/
		System.out.println(hotelroomvo.getRegDay());
		
		/*
		HttpSession session = mrequest.getSession();
		
		ServletContext svlCtx = session.getServletContext();
		String imagesDir = svlCtx.getRealPath("/images/detailP_imgs");

		System.out.println("=== 첨부되어지는 이미지 파일이 올라갈 절대경로 imagesDir==> " + imagesDir); // 파일을 첨부하면 .metadata에 올라온다!
		// === 첨부되어지는 이미지 파일이 올라갈 절대경로 imagesDir==> C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FinalProjectB\images\detailP_imgs
		*/
		
//		========= !!첨부파일이 있는지 없는지 알아오기 시작!! =========
		MultipartFile attach = hotelroomvo.getAttach();
		System.out.println("attach확인: "+attach);
		
		if(!attach.isEmpty()) {
			
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";
			
			System.out.println(">>> 확인용 path ==> " + path);
			
			String newFileName = "";
			// WAS(톰캣)의 디스크에 저장될 파일명
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣)의 디스크에 저장할 때 사용되는 용도
			
			long fileSize = 0;
			// 파일크기를 읽어오기 위한 용도
			
			try {
				bytes = attach.getBytes();
				// getBytes() 메소드는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다.
				// 예를 들어, 첨부한 파일이 "강아지".png 이라면
				// 이 파일을 WAS(톰캣) 디스크에 저장시키기 위해 byte[] 타입으로 변경해서 올린다.
				
				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
				// 이제 파일 올리기를 한다.
				// attach.getOriginalFilename() 은 첨부된 파일의 파일명(강아지.png)이다.
				
				System.out.println(">>> 확인용 : newFileName ==> " + newFileName);
				// >>> 확인용 : newFileName ==> 201907251244161722498031530800.jpg
				
				// == 3. BoardVO hotelroomvo 에 fileName 과 picture 값과 fileSize 값을 넣어주기
				hotelroomvo.setFileName(newFileName);
				// WAS(톰캣)에 저장된 파일명(201907251244161722498031530800.jpg)
				
				hotelroomvo.setImg(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일의 파일명(강아지.png)을 보여줄 때 및
				// 사용자가 파일을 다운로드 할 때 사용되어지는 파일명
				
				fileSize = attach.getSize();
				hotelroomvo.setFileSize(String.valueOf(fileSize));
				// 게시판 페이지에서 첨부한 파일의 크기를 보여줄 때 String 타입으로 변경해서 저장함.
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! ========= */
		
		
		int n = 0;
		if(attach.isEmpty()) {
// 		첨부파일이 없는 경우이라면
/*
			String msg = "이미지를 첨부해주세요!";
			String loc = "javascript:history.back()";
			
		return "hyein/roomRg/msg.tiles1";
*/	
		} else {
			
// 		첨부파일이 있는 경우이라면	
//		=== 호텔 등록 ===
			n = service.hotelAdd(hotelroomvo);
		
		}
		
		mrequest.setAttribute("n", n);
		
		return "hyein/roomRg/roomrgEnd.tiles1";
		
	}
	
	// 객실 등록 폼의 숙소명 검색어 자동완성하기 3
	@RequestMapping(value="/wordSearch.go", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String wordSearch(HttpServletRequest request) {
		
		String searchWord = request.getParameter("searchWord");
		
		List<String> wordNameList = null;
		
		if(searchWord!="") {
			
			// 객실 등록 폼의 숙소명 검색어 자동완성하기
			wordNameList = service.wordNameSearchView(searchWord);
		}
		
		JSONArray jsonArr = new JSONArray();

		if(wordNameList != null) {
			for(String name : wordNameList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("name", name);
				
				jsonArr.put(jsonObj);
			}
		}

		String result = jsonArr.toString();
		
		return result;
	}
	
	// 룸 등록 뷰단 보여주기
	@RequestMapping(value="/roomrg2.go", method={RequestMethod.GET} )
	public ModelAndView roomRegistration2(ModelAndView mv) {
		
		mv.setViewName("hyein/roomRg/roomrg2.tiles1");
		
		return mv;
	}
	
	
	// 자동완성 검색어 클릭했을 때 대분류 카테고리 넘버 가져오기
	@RequestMapping(value="/largeCodeSearch.go", method={RequestMethod.GET}, produces="text/plain;charset=UTF-8" )
	@ResponseBody
	public String largeCodeSearch(ModelAndView mv, HttpServletRequest request) { 
		
		String clickWord = request.getParameter("searchWord");
		System.out.println(clickWord);
		String largeCodeList = null;
		
		if(clickWord!="" && clickWord!=null) {
			
			// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
			largeCodeList = service.getLargeCodeNum(clickWord);
			
		}
			JSONArray jsonArr = new JSONArray();

			if(largeCodeList != null) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("largeCategoryontionCode", largeCodeList);
					
					jsonArr.put(jsonObj);
			}

			String result = jsonArr.toString();
			
			return result;
		}
	
	
	// 룸 등록 하기 (Register 버튼을 눌렀을 때)
	@RequestMapping(value="/roomrg2End.go", method={RequestMethod.POST} )
	public String roomRegistration2End(HotelRoomVO hotelroomvo 
//									 ,	PhotoVO photovo
									 , @RequestParam("attach") MultipartFile[] files
//									 , @ModelAttribute("attach") MultipartFile files
									 , MultipartHttpServletRequest mrequest
									 , HttpServletRequest request) throws Exception {

		
		String largeCategoryontionCode = request.getParameter("largeCategoryontionCode");
		String bedCnt = request.getParameter("bedCnt");
		String peopleCnt = request.getParameter("peopleCnt");
		
		String roomType = largeCategoryontionCode.substring(0, 1); // largeCategoryontionCode의 맨 앞 숫자 뽑아와서 roomType에 넣어주기
		roomType += bedCnt += peopleCnt; // roomType에 침대갯수(bedCnt)와 수용인원(peopleCnt) 더해주기
		
		hotelroomvo.setRoomType(roomType); // largeCategoryontionCode를 HotelRoomVo의  fk_LargeCategoryOntionCode에 넣어준다
		String pseq = hotelroomvo.getPseq();
		
		/*
		값을 받아오는지 찍어보기
		System.out.println(largeCategoryontionCode);
		System.out.println(roomType);
		
		 */
		System.out.println(hotelroomvo.getPseq());
		

		
/////////////////////////////////////////다중 파일 업로드//////////////////////////////////////////////////////
		
		String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\resources" + File.separator + "images\\detailP_imgs"; 
        String newFileName = "";

        List<MultipartFile> fileList = mrequest.getFiles("attach");
        System.out.println(fileList);
        HttpSession session = mrequest.getSession();
        byte[] bytes = null;
        long fileSize = 0;
        List<PhotoVO> photoList = null;
        
        if(fileList!=null) {
        	for(int i=0;i<fileList.size();i++) {
    			try {
    				bytes = fileList.get(i).getBytes();
    				
    				newFileName = fileManager.doFileUpload(bytes, fileList.get(i).getOriginalFilename(), path);
    				fileSize = fileList.get(i).getSize();
    				PhotoVO phvo = new PhotoVO();
    				phvo.setFileName(newFileName);
    				phvo.setPseq(pseq);
    				photoList.add(phvo);
    				
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    			
    		}
        	
        }
        
        int n = service.photoaddimg(photoList);
		int m = service.roomAdd(hotelroomvo);

        
//        for (MultipartFile file : files) {
//            if (!file.getOriginalFilename().isEmpty()) {
//               BufferedOutputStream outputStream = new BufferedOutputStream(
//                     new FileOutputStream(new File(path, file.getOriginalFilename()))); // 원본 파일 명
//
//               hotelroomvo.setPicture(file.getOriginalFilename());
//               
//               outputStream.write(file.getBytes());
//               outputStream.flush();
//               outputStream.close();
//            } 
//         }
		
		// 룸 등록하기


//		
//		mrequest.setAttribute("n", n);

		return "hyein/roomRg/roomrg2End.tiles1";
	}

		
///////////////////////////////////////////////////////////////////////////////////////////////
		
		
//	String path = "C:\\springworkspace\\FinalProjectTest\\src\\main\\resources\\images\\detailP_imgs";

		
//		String attach = mrequest.getParameter("attach");
//		
//		
//		List<MultipartFile> file_list = mrequest.getFiles("attach");
//		
//			if( file_list.size() > 0 ){
//				
//	 		for( MultipartFile mpf : file_list ){ // 파일이 빈 껍데기가 아닐때
//	
//		 		if( ! mpf.isEmpty() ){
//		 			
//		 		}
//		}
//		
//		try {
//			
//			Iterator itr = mrequest.getFileNames();
//
//			while((boolean) itr.next()){     // while로 루프돌면서 name이 다른 파일input 을 처리
//	
//	 		// 명령어 getFiles   : input이 multiple로 파일이 한 input태그에 여러개 들어가는 경우
//	
//	 		List<MultipartFile> file_list = mrequest.getFiles( (String) itr.next());  
//	
//	
//	 		if( file_list.size() > 0 ){
//	
//		 		for( MultipartFile mpf : file_list ){
//		
//			 		if( ! mpf.isEmpty() ){    // 파일이 빈 껍데기가 아닐때
//			 		// 파일 저장이든 DB에 값넣고 insert를 하던지 하기
//			 		}
//			 	}
//		 	}
// 		}
//			
//		} catch (Exception e) {
//
//
//	e.printStackTrace();
//
//}
//
//return "hyein/roomRg/roomrg2End.tiles1";
//
//}
		
///////////////////////////////////////////////////////////////////////////////////////////////			
//		========= !!첨부파일이 있는지 없는지 알아오기 시작!! =========
//		MultipartFile attach = photovo.getAttach();
//		System.out.println("attach확인: "+attach);
//		
//		if(!attach.isEmpty()) {
//			
//			HttpSession session = mrequest.getSession();
//			String root = session.getServletContext().getRealPath("/");
//			String path = root + "resources" + File.separator + "files";
//			
//			System.out.println(">>> 확인용 path ==> " + path);
//			
//			String newFileName = "";
//			// WAS(톰캣)의 디스크에 저장될 파일명
//			
//			byte[] bytes = null;
//			// 첨부파일을 WAS(톰캣)의 디스크에 저장할 때 사용되는 용도
//			
//			long fileSize = 0;
//			// 파일크기를 읽어오기 위한 용도
//			
//			try {
//				bytes = attach.getBytes();
//				// getBytes() 메소드는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다.
//				// 예를 들어, 첨부한 파일이 "강아지".png 이라면
//				// 이 파일을 WAS(톰캣) 디스크에 저장시키기 위해 byte[] 타입으로 변경해서 올린다.
//				
//				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
//				// 이제 파일 올리기를 한다.
//				// attach.getOriginalFilename() 은 첨부된 파일의 파일명(강아지.png)이다.
//				
//				System.out.println(">>> 확인용 : newFileName ==> " + newFileName);
//				// >>> 확인용 : newFileName ==> 201907251244161722498031530800.jpg
//				
//				// == 3. BoardVO hotelroomvo 에 fileName 과 picture 값과 fileSize 값을 넣어주기
//				photovo.setFileName(newFileName);
//				// WAS(톰캣)에 저장된 파일명(201907251244161722498031530800.jpg)
//				
//				photovo.setOrgFilename(attach.getOriginalFilename());
//				// 게시판 페이지에서 첨부된 파일의 파일명(강아지.png)을 보여줄 때 및
//				// 사용자가 파일을 다운로드 할 때 사용되어지는 파일명
//				
//				fileSize = attach.getSize();
//				photovo.setFileSize(String.valueOf(fileSize));
//				// 게시판 페이지에서 첨부한 파일의 크기를 보여줄 때 String 타입으로 변경해서 저장함.
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//		}
		
		
		// ========= !!첨부파일이 있는지 없는지 알아오기 끝!! ========= */
//		
//		
//		int m = 1;
//		MultipartFile attach = null;
//		String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\resources" + File.separator + "images\\room";
//		String newFileName="";
//		byte[] bytes = null;
//		long fileSize = 0;
//		String str_attachCount = mrequest.getParameter("attachCount");
//			// 넘어온 갯수만큼 뺑뺑이
//			int attachCount = Integer.parseInt(str_attachCount);
//			System.out.println(attachCount);
//			for(int i=0; i<attachCount; i++) {
//				
//				attach = photovo.getAttach();
//				System.out.println("attach확인: "+attach);
//				
//				if(!attach.isEmpty()) {
//					try {
//						bytes = attach.getBytes();
//						// getBytes() 메소드는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다.
//						// 예를 들어, 첨부한 파일이 "강아지".png 이라면
//						// 이 파일을 WAS(톰캣) 디스크에 저장시키기 위해 byte[] 타입으로 변경해서 올린다.
//						
//						newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
//						// 이제 파일 올리기를 한다.
//						// attach.getOriginalFilename() 은 첨부된 파일의 파일명(강아지.png)이다.
//						
//						System.out.println(">>> 확인용 : newFileName ==> " + newFileName);
//						// >>> 확인용 : newFileName ==> 201907251244161722498031530800.jpg
//						
//						// == 3. BoardVO hotelroomvo 에 fileName 과 picture 값과 fileSize 값을 넣어주기
//						photovo.setFileName(newFileName);
//						// WAS(톰캣)에 저장된 파일명(201907251244161722498031530800.jpg)
//						
//						photovo.setOrgFilename(attach.getOriginalFilename());
//						// 게시판 페이지에서 첨부된 파일의 파일명(강아지.png)을 보여줄 때 및
//						// 사용자가 파일을 다운로드 할 때 사용되어지는 파일명
//						
//						fileSize = attach.getSize();
//						photovo.setFileSize(String.valueOf(fileSize));
//						// 게시판 페이지에서 첨부한 파일의 크기를 보여줄 때 String 타입으로 변경해서 저장함.
//						
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//					
//			
//				String attachFileName = mtrequest.getFilesystemName("attach"+i);
//				
////			String attachFileName = mtrequest.getFilesystemName("attach"+i);				
//				
//				// jsp_product_imagefile 테이블에 추가이미지 파일명 insert 해주기
//				m = pdao.product_imagefile_Insert(pnum, attachFileName); // 이 테이블에 insert를 한다
//				
//				if(m==0) break;
//			} // end of for--------------------------------------------------------------------------------
//		} // end of if-------------------------------------------------------------------------------------


//		int n = 0;
//		if(attach.isEmpty()) {
//			
//		} else {
//		// 룸 등록하기
//		n = service.roomAdd(hotelroomvo);
//		
//		}
//		mrequest.setAttribute("n", n);
//
//		return "hyein/roomRg/roomrg2End.tiles1";
//	}
	
	/*
	@RequestMapping(value="/yj.go", method={RequestMethod.GET} )
	public String yj() {
		return "tiles1/hyein/roomRg/yj";
	}
	
	@RequestMapping(value="/yjend.go", method={RequestMethod.POST} )
	public String yjend(@RequestParam("attach") MultipartFile[] files, PhotoVO photovo, MultipartHttpServletRequest mrequest)throws IOException {

// 		String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\resources" + File.separator + "images\\review";            
        String path = "C:\\Users\\user1\\git\\finalProjectB\\FinalProjectB\\src\\main\\resources" + File.separator + "images\\yj";
        String newFileName = "";
        
        for (MultipartFile file : files) {
            if (!file.getOriginalFilename().isEmpty()) {
               BufferedOutputStream outputStream = new BufferedOutputStream(
                     new FileOutputStream(
                           new File(path, file.getOriginalFilename())));

               outputStream.write(file.getBytes());
               outputStream.flush();
               outputStream.close();
            } 
         }

		
		return "tiles1/hyein/roomRg/yj";
	}
	*/
    
}
