<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
	/* table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 900px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 860px;} */
	/* .long {width: 470px;}
	.short {width: 120px;}  */		
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		//전역변수
	    var obj = [];
	    
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
	        sSkinURI: "<%= request.getContextPath() %>/resources/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true,
	        }
       });
    
      //완료버튼
      $("#btnUpdate").click(function(){
          //id가 content인 textarea에 에디터에서 대입
          obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        
		  // 글암호 유효성 검사
		  var pwval = $("#pw").val().trim();
		  if(pwval == "") {
		  	alert("글암호를 입력하세요!!");
		  	return;
		  }
          
          //폼 submit
          var editFrm = document.editFrm;
          editFrm.action = "<%= request.getContextPath() %>/noticeEditEnd.go";
          editFrm.method = "POST";
          editFrm.submit();
      });
      
      $("#btnDelete").click(function(){
			
			// 글암호 유효성 검사
			var pwval = $("#pw").val().trim();
			if(pwval == "") {
				alert("글암호를 입력하세요!!");
				return;
			}
			
			// 폼을 submit
			var frm = document.editFrm;
			frm.method = "POST";
			frm.action = "<%= ctxPath%>/noticeDelEnd.go";
			frm.submit();
		});
		
	}); // end of ready()-------------------------------------------
	
</script>
<section class="site-hero inner-page overlay" style="background-image: url(images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Notice</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Home</a></li>
              <li>&bullet;</li>
              <li>Reservation</li>
            </ul>
          </div>
        </div>
      </div>

      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->

	<section class="section contact-section" id="next">
    	<div class="container">
        	<div class="row">
        		<div class="col-md-12 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100" >
					
				<div style="padding-left: 10%; border: solid 0px red;" class= "bg-white p-md-5 p-4 mb-5">
					<h1 style="margin-bottom: 20px; color: #6c757d; width: 300px;">글수정</h1>
					
					<form name="editFrm">
						<table class="table">
							<tr>
								<th width="130px;">작성자</th>
								<td>	
								    <input type="hidden" name="seq" value="${boardvo.seq}" />
									${boardvo.name}          
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="subject" id="subject" class="long" style="width: 860px;" value="${boardvo.subject}" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
								<textarea name="content" id="content" rows="10" cols="100" style="width: 95%; height: 412px;">${boardvo.content}</textarea>   	
								</td>
							</tr>
							<tr>
								<th>글암호</th>
									<td><input type="password" name="pw" id="pw" class="short" />
									<input type="hidden" name="seq" value="${seq}" />
								</td>
							</tr>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>
						
						<div style="margin: 20px;">
							<button type="button" id="btnUpdate" class="btn btn-primary text-white py-3 px-4 font-weight-bold" style="margin-right: 5px;">수정하기</button>
							
							<button type="button" class="btn btn-primary text-white py-3 px-4 font-weight-bold" onclick="javascript:history.back();">취소하기</button>
							<button type="button" id="btnDelete" style="position: relative; left: 640px;" class="btn btn-primary text-white py-3 px-4 font-weight-bold">삭제하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

    