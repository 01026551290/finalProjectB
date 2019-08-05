package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class VerifyCertificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid"); /* 데이터베이스에서 업뎃해야 돼서 받아옴. */
		String userCertificationCode = request.getParameter("userCertificationCode");
		
		HttpSession session = request.getSession();
		String certificationCode = (String) session.getAttribute("certificationCode");
		
		String message = "";
		String loc = "";
		
		if(certificationCode.equals(userCertificationCode)) { //유저가 보낸 코드와 같다라면
			message = "인증성공 되었습니다.";
			loc = request.getContextPath() + "/login/pwdConfirm.kh?userid=" + userid; /* 유저아이디를 보내주겠다. 겟방식으로 띄워만준다.*/
		}
		else {
			message = "발급된 인증코드가 아닙니다. 인증코드를 다시 발급받으세요!!";
			loc = request.getContextPath() + "/login/pwdFind"; /* 처음부터 해라. */
		}
		request.setAttribute("message", message);
		request.setAttribute("loc", loc);
		
		super.setViewPage("/WEB-INF/msg.jsp");
		
		// !!!  중요 !!! //
		// 세션에 저장된 인증코드 삭제!!!!
		session.removeAttribute("certificationCode");
		
		
	}

}
