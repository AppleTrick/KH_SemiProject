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
	    	
	    	String mem_id = null;
	    	String mem_pw = null;
	    	String email = null;
	    	
	    	System.out.println(mem_id);
	    	System.out.println(mem_pw);
	    	
	    	LoginDto dto = null;
	    	System.out.println("로그인 email :"+email);
	    	
	    	
	    	//sns로그인인 경우 email 값을 가져와서 비교한다. 
	    	if(request.getParameter("email") != null) {
	    		
	    		email = request.getParameter("email");
	    		
	    		dto = biz.snslogin(email);
	    	
	    	//일반 로그인 
	    	}else {
	    		 mem_id = request.getParameter("mem_id");
		    	 mem_pw = request.getParameter("mem_pw");
		    	 
		    	 dto= biz.login(mem_id, mem_pw);
	    		
	    	}
	    	
	    	
	    	if(dto != null){
	    		
	    		HttpSession session = request.getSession();//세션 객체 만들기

				//session scope에 객체 담기 
				session.setAttribute("dto",dto); // 세션 생성
				//만료되는 시간 설정 (default : 30분)
				session.setMaxInactiveInterval(10*60);
				
				if(dto.getMem_role().equals("ADMIN")){
					response.sendRedirect("index.jsp"); // admin 페이지 생기면 바꿔줄것 
				}else if(dto.getMem_role().equals("USER")){
					response.sendRedirect("index.jsp");
				}
			}else{
	    	
				jsResponse(response, "move.do?move=loginpage", "존재하지 않는 아이디이거나, 아이디 또는 비밀번호가 틀렸습니다");
	    	

			}
	    	
	    	
	    	
	    }else if(command.equals("logout")){
	    	HttpSession session = request.getSession(false);
	    	session.invalidate();
	    	response.sendRedirect("index.jsp");
	    
	    	
	    }else if(command.equals("joinform")){
			response.sendRedirect("join_terms.jsp");


		}else if(command.equals("idchk")){
			
			String mem_id = request.getParameter("mem_id");
			int result = biz.idCheck(mem_id);
			
			//LoginDto dto = biz.idCheck(mem_id);
			boolean idnotused = true;
		
			if(result>0){
				idnotused = false;
			}
		
			response.sendRedirect("join_idchk.jsp?idnotused="+idnotused);
			//dispatch(request, response, "login_idchk.jsp?idnotused="+idnotused);

		}else if(command.equals("insertuser")){
			
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
			
			if(res>0) {
				jsResponse(response, "login.jsp", "회원가입 완료 ! 로그인 하러 가기");
				
				
			}else{
				jsResponse(response, "login.do?command=joinform", "회원가입에 실패하였습니다. 회원가입 내용을 확인하세요.");
				
				
			}


		}else if(command.equals("updatform")) {
			int mem_no = Integer.parseInt(request.getParameter("mem_no"));
			LoginDto dto = biz.selectMember(mem_no);
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "mypage_update.jsp");
			
		}else if(command.equals("userupdate")) {
			int mem_no = Integer.parseInt(request.getParameter("mem_no"));
			
			String mem_pw = request.getParameter("mem_pw");
			String mem_name = request.getParameter("mem_name");
			String mem_nickname = request.getParameter("mem_nickname");
			
			String mem_phone = request.getParameter("mem_phone");
			String mem_addr = request.getParameter("mem_addr");
			String mem_email = request.getParameter("mem_email");
			
			
			LoginDto dto = new LoginDto(); 
			dto.setMem_no(mem_no);
			dto.setMem_pw(mem_pw);
			dto.setMem_name(mem_name);
			dto.setMem_nickname(mem_nickname);
			dto.setMem_phone(mem_phone);
			dto.setMem_addr(mem_addr);
			dto.setMem_email(mem_email);
			
			
			
			int res = biz.updateMember(dto);
			
			
			
			System.out.println(res);
			
			if(res>0) {
				jsResponse(response, "index.jsp", "개인정보 수정이 완료되었습니다.");
				
				
			}else{
				jsResponse(response, "login.do?command=updatform&mem_no="+mem_no, "수정 실패...!!! 다시 확인 하세요! ");
				
				
			}
			
			
			
			
		}else if(command.equals("deleteuser")) {
			int mem_no = Integer.parseInt(request.getParameter("mem_no"));
			
			int res = biz.deleteMember(mem_no);
			if(res>0) {
				jsResponse(response, "index.jsp", "회원 탈퇴가 완료되었습니다. 언제든지 다시 돌아와주세요 ! ");
				HttpSession session = request.getSession(false);
		    	session.invalidate();
			}else {
				jsResponse(response, "mypage.jsp", "회원탈퇴가 정상적으로 되지 않았습니다.. 다시 시도하세요 ");
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
