package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.LoginBiz;
import com.dto.LoginDto;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String command = request.getParameter("command");
	    LoginBiz biz = new LoginBiz();
	    
	    if(command.equals("login")) {
	    	
	    	String mem_id = request.getParameter("mem_id");
	    	String mem_pw = request.getParameter("mem_pw");
	    	
	    	System.out.println(mem_id);
	    	System.out.println(mem_pw);
	    	
	    	LoginDto dto = biz.login(mem_id, mem_pw);
	    	System.out.println(dto);
	    	
	    	
	    	
	    	if(dto != null){
	    		//session.setAttribute("dto",dto);
	    		
	    		
	    		HttpSession session = request.getSession();//세션 객체 만들기

				//session scope에 객체 담기 
				session.setAttribute("dto",dto); // 세션 생성
				//만료되는 시간 설정 (default : 30분)
				session.setMaxInactiveInterval(10*60);
				
				if(dto.getMem_role().equals("ADMIN")){
					response.sendRedirect("index.jsp");
				}else if(dto.getMem_role().equals("USER")){
					response.sendRedirect("index.jsp");
				}
			}else{
	    	
				jsResponse(response, "index.jsp", "아이디, 비밀번호가 틀렸습니다");
	    	
	    	

				
				
				
				
				
			}
	    	
	    }
	
	
	
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s= "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+"location.href='"+url+"';"
				+"</script>";
		
		response.getWriter().print(s);
	}
    
	
	

}
