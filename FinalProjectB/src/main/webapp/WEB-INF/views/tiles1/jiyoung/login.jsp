<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String ctxPath = request.getContextPath(); %>

<style type="text/css">
	
	@media ( min-width : 769px) and ( max-width : 991px) {
		.custom-border {
		 	/* border: solid 1px red; */
		 }
		.custom-loginFrm {
			margin: 40px 0 0 0;
		}
		.custom-input {
			padding: 0 0 30px 0;
		}
		.custom-login-submit {
			padding: 45px 0 0 20px;
		}
	}
	
	@media ( min-width : 992px) {
		.custom-border {
		 	/* border: solid 1px red; */
		 }
		.custom-loginFrm {
			margin: 40px 0 0 0;
		}
		.custom-input {
			padding: 0 0 30px 0;
		}
		.custom-login-submit {
			padding: 45px 0 0 20px;
		}
	}
	
</style>

<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	 $("#btnLOGIN").click(function() {
    		 func_Login();
    	 }); // end of $("#btnLOGIN").click();-----------------------
    	 
    	 $("#pwd").keydown(function(event){
  			
  			if(event.keyCode == 13) { // 엔터를 했을 경우
  				func_Login();
  			}
    	 }); // end of $("#pwd").keydown();-----------------------	
    	 
    }); // end of $(document).ready()---------------------------	 

    
    function func_Login() {
    		 
		 var userid = $("#userid").val(); 
		 var pwd = $("#pwd").val(); 
		
		 if(userid.trim()=="") {
		 	 alert("아이디를 입력하세요!!");
			 $("#userid").val(""); 
			 $("#userid").focus();
			 return;
					
			 }
		 
		
		 if(pwd.trim()=="") {
			 alert("비밀번호를 입력하세요!!");
			 $("#pwd").val(""); 
			 $("#pwd").focus();
			 return;
		 }

		 var frm = document.loginFrm;
		 
		 frm.action = "<%=ctxPath%>/jiyoung/loginEnd.go";
		 frm.method = "POST";
		 frm.submit();
		 
    } // end of function func_Login(event)-----------------------------
    function func_register() { 
    	
    }
</script>

<section class="section contact-section" id="next">
      <div class="container">
        <div class="row">
          <div class="col-md-5 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
            <div class="row">
              <div class="col-md-10 ml-auto contact-info">
                <p> <span class="text-black">로그인</span></p>
                
                
              </div>
            </div>
          </div><div class="col-md-7 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
            
            <form name="loginFrm" method="post" class="bg-white p-md-5 p-4 mb-5 border">
              
          
              
<div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="userid">아이디</label>
                  <input type="text" id="userid" name = "userid" class="form-control ">
                </div>
              </div><div class="row">
                <div class="col-md-12 form-group">
                  <label class="text-black font-weight-bold" for="pwd">비밀번호</label>
                  <input type="password" id="pwd" name="pwd" class="form-control ">
                </div>
              </div>
            
              <div class="row">
                <div class="form-group">
                  <input type="button" value="로그인" onclick = "func_Login();" class="btn btn-primary text-white py-3 px-5 font-weight-bold" >
					<input type="button" value="회원가입" onclick="location.href='/god/register.go'" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
					<input type="button" value="아이디찾기" onclick="location.href='/god/register.go'" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
					<input type="button" value="비밀번호찾기" onclick="location.href='/god/register.go'" class="btn btn-primary text-white py-3 px-5 font-weight-bold">
                </div>
              </div>
            </form>

          </div>
          
        </div>
      </div>
    </section>