 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
<script type="text/javascript">
	
	$(document).ready(function(){
	  			
			$(".error").hide();
			$("#error_passwd").hide();
			$("#MEMBERID").focus();
			
			$(".form-control").each(function(){
				
				
				$(this).blur(function(){
					var data = $(this).val().trim();
					if(data == "") {
						// 입력하지 않거나 공백만 입력했을 경우
						$(this).parent().find(".error").show();
						$(":input").attr("disabled",true).addClass("bgcol"); 
						$(this).attr("disabled",false).removeClass("bgcol");
						$(this).focus();
					}
					else {
						// 공백이 아닌 글자를 입력했을 경우
						$(this).parent().find(".error").hide();
						$(":input").attr("disabled",false).removeClass("bgcol"); 
					}
				});
			});
			
				///////////////////////////////////////////////
			$("#PWD").blur(function(){
				var passwd = $(this).val();
				
			//	var regExp_PW = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
				// 또는
				var regExp_PW = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g); 
				// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 객체 생성
				
				var bool = regExp_PW.test(passwd);
				
				if(!bool) {
					$("#error_passwd").show();
					$(":input").attr("disabled",true).addClass("bgcol"); 
					$(this).attr("disabled",false).removeClass("bgcol");
					$(this).focus();
				}
				else {
					$("#error_passwd").hide();
					$(":input").attr("disabled",false).removeClass("bgcol"); 
					$("#pwdcheck").focus();
				} 
			}); // end of $("#pwd").blur()---------------
	});
	
	function goRegister() {
	
		 // *** jQuery 에서 radio, checkbox 의 체크여부 확인하기 *** // 
	   	 /* 
	   	   $("input:checkbox[name=이름]").is(":checked");
	   	   ==> name 이 이름인 체크박스에 체크가 되었으면   true를 반환
	   	   ==> name 이 이름인 체크박스에 체크가 안되었으면 false를 반환
	   	   
	   	   $("input:checkbox[id=이름]").is(":checked");
	   	   ==> id의 값이 이름인 체크박스에 체크가 되었으면   true를 반환
	   	   ==> id의 값이 이름인 체크박스에 체크가 안되었으면 false를 반환
	   	   
	   	   $("input:radio[name=이름]").is(":checked");
	   	   ==> name 이 이름인 라디오에 체크가 되었으면   true를 반환
	   	   ==> name 이 이름인 라디오에 체크가 안되었으면 false를 반환
	   	   
	   	   $("input:radio[id=이름]").is(":checked");
	   	   ==> id의 값이 이름인 라디오에 체크가 되었으면   true를 반환
	   	   ==> id의 값이 이름인 라디오에 체크가 안되었으면 false를 반환
	   	 */
	   	$("#MEMBERID").blur(function(){
			  alert("아이디를 입력하셔야 합니다.");
			  return;  
	   	 
		});
	   	$("#PWD").blur(function(){
			  alert("암호를 입력하셔야 합니다.");
			  return;
		   
	   	});
	   	   
	   	 /*  if( !$("input:checkbox[id=agree]").is(":checked") ) {
	   		  alert("이용약관에 동의하셔야 합니다.");
	   		  return;
	   	  }  */
	   	 
	   	  var frm = document.registerFrm;
	   	  frm.method = "POST";
	   	  frm.action = "memberoutEnd.go";
	   	  frm.submit();
	   
		}// end of function goRegister(event)----------

	</script> 
		<section class="section contact-section" id="next">
      		<div class="container" >
        		<div class="row">
         		 <div class="col-md-7" data-aos="fade-up" data-aos-delay="100">
            		 <div>::: 탈퇴하실 아이디와 비밀번호를 입력해주세요 :::(<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>) </div>
            <form name="registerFrm" >                      
              <div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="MEMBERID" required>회원아이디</label><span class="star">*</span>
                  <input type="text" name="memberId" id="MEMBERID" class="form-control" value="${vo.memberId}" />
              		<div class="row">
                	<div class="col-md-12 form-group">
	                 	 <label class="text-black font-weight-bold" for="PWD" required>암호</label><span class="star">*</span>
	                  	 <input type="password" name="pwd" id="PWD" class="form-control" value="${vo.pwd}"/>
	                  	 <span id="error_passwd">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로만 입력가능합니다.</span>
                  </div>
                </div>
                 <div class="row">
                <div class="col-md-6 form-group">
                  <input type="button" id="btnRegister" value="탈퇴하기" class="btn btn-primary text-white py-3 px-5 font-weight-bold" onClick="goRegister();" />
                </div>
              </div>
              </div>
              </div>
              </form>
          </div>                  
        </div>
      </div>
    </section>

