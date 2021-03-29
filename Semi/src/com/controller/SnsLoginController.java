package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.LoginBiz;
import com.dto.LoginDto;

/**
 * Servlet implementation class SnsLoginController
 */
@WebServlet("/sns.do")
public class SnsLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SnsLoginController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		LoginBiz biz = new LoginBiz();

		if (command.equals("naverlogin")) {
			String email = request.getParameter("naver_email");
			System.out.println(email);

			int res = biz.tokenchk(email);

			System.out.println(res);

			if (res > 0) {

				System.out.println("여기는 서블릿이에요" + email);
				response.sendRedirect("login.do?command=login&email="+email);

			} else {

				HttpSession session = request.getSession();// 세션 객체 만들기

				// session scope에 객체 담기
				session.setAttribute("email", email); // 세션 생성
				response.sendRedirect("join_sns.jsp?email=" + email);

			}
		} else if (command.equals("kakaologin")) {

			String email = request.getParameter("kakao_email");
			int res = biz.tokenchk(email);

			if (res > 0) {
				System.out.println("여기는 서블릿이에요" + email);
				response.sendRedirect("login.do?command=login&email="+email);
				

			} else {

				HttpSession session = request.getSession();// 세션 객체 만들기

				// session scope에 객체 담기
				session.setAttribute("email", email); // 세션 생성
				response.sendRedirect("join_sns.jsp?email=" + email);

			}
			
			
		}else if(command.equals("googlelogin")) {
			String email = request.getParameter("google_email");
			int res  = biz.tokenchk(email);
			
			if(res>0) {
				System.out.println("여기는 서블릿이에요" + email);
				response.sendRedirect("login.do?command=login&email="+email);
				
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				response.sendRedirect("join_sns.jsp?email="+email);
			}
			
		} else if (command.equals("idchk")) {

			String mem_id = request.getParameter("mem_id");
			int result = biz.idCheck(mem_id);

			// LoginDto dto = biz.idCheck(mem_id);
			boolean idnotused = true;

			if (result > 0) {
				idnotused = false;
			}
			System.out.println(idnotused);

			response.sendRedirect("join_idchk.jsp?idnotused=" + idnotused);
			// dispatch(request, response, "login_idchk.jsp?idnotused="+idnotused);

		} else if (command.equals("insertSns")) {

			String mem_id = request.getParameter("mem_id");
			String mem_pw = request.getParameter("mem_pw");
			String mem_name = request.getParameter("mem_name");
			String mem_nickname = request.getParameter("mem_nickname");
			String mem_addr = request.getParameter("mem_addr");
			String mem_phone = request.getParameter("mem_phone");
			String mem_email = request.getParameter("mem_email");

			LoginDto dto = new LoginDto();
			dto.setMem_id(mem_id);
			dto.setMem_pw(mem_pw);
			dto.setMem_name(mem_name);
			dto.setMem_nickname(mem_nickname);
			dto.setMem_addr(mem_addr);
			dto.setMem_phone(mem_phone);
			dto.setMem_email(mem_email);

			int res = biz.insertMember(dto);

			if (res > 0) {
				jsResponse(response, "login.jsp", "회원가입 완료 ! 로그인 하러 가기");

			} else {
				jsResponse(response, "login.jsp", "회원가입에 실패하였습니다. 회원가입 내용을 확인하세요.");

			}

		}

	}

	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		response.getWriter().print(s);
	}

}
