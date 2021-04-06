package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MovePage
 */
@WebServlet("/move1.do")
public class MovePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String move = request.getParameter("move");
	    
	    
	    // forword 서블릿에서 무언가를 할때
    	// sendRedirect 는 그냥 이동
    	// dispatch 는 이전에 파라마터 유지해줄 때
	    
	    	// 메인 페이지 이동
	    if (move.equals("home")) {
	    	response.sendRedirect("index.jsp");
	    	
	    	// 지도 페이지 이동
		}else if(move.equals("map")) {
			response.sendRedirect("map_main.jsp");
			
		    // 동물 질병 알아보기 페이지  이동
		}else if(move.equals("doctor")) {
			response.sendRedirect("petdoctor.jsp");
			
		    // 기부 페이지 이동
		}else if(move.equals("donation")) {
			response.sendRedirect("donate.jsp");
			
		    // 로그인 페이지 이동
		}else if(move.equals("loginpage")) {
			response.sendRedirect("login.jsp");
			
		    // 얼굴 인식 페이지 이동
		}else if(move.equals("matchPet")) {
			response.sendRedirect("match_pet.jsp");
			
		    // 
		}else if(move.equals("noticeboard")) {
			response.sendRedirect("notice.do?command=list");
		}else if(move.equals("petboard")) {
			response.sendRedirect("pet.do?command=list");
		}else if(move.equals("")) {
			
		}
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}

}
