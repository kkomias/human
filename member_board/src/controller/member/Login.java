package controller.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

/*
 * 자주 발생되는 에러
 * 
 * 라이브러리 탐색 실패 TOMCAT
 * 외부 라이브러리 추가 빌드
 * 
 * preference - server - runtime environment 톰캣 설치 경로
 * 프로젝트 설정 - targeted runtime 체크 여부 확인
 * 추가 빌드 : compile
 * 
 * 포트 충돌
 * TOMCAT : 8080
 * 
 * cmd
 * netstat -ao
 * 사용하려는 포트와 일치하는 pid 조회
 * 
 * taskkill -pid 포트번호의 pid -f
 * 
 * 500 error
 * 
 * 400 error
 * 1. 서버 정상 구동 > url 확인
 * 2. 서버 비정상 구동 > error log
 * 
 * 
 */

@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		로그인 폼 화면 : forwarding
		req.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		로그인 처리
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		String redirectUrl = "login";
		
//		어떤 타입의 변수로 두가지 경우를 처리? >> boolean
		MemberService service = new MemberServiceImpl();
		boolean success = service.login(id, pwd);
		
		if(success) {
			HttpSession session = req.getSession();
			session.setAttribute("member", service.findBy(id));
			msg = "로그인 성공";

//			아이디 저장
			Cookie cookie = new Cookie("savedId", id);
			cookie.setMaxAge(req.getParameter("saveId") == null ? 0 : 60 * 60 * 24 * 365);
			resp.addCookie(cookie);
			
			redirectUrl = "index.html";
		}
		else {
			msg = "로그인 실패, 아이디/비밀번호를 확인하세요";
		}
		
		resp.sendRedirect(redirectUrl + "?msg=" + URLEncoder.encode(msg, "utf-8"));
		
	}
	
}
