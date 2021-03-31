package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.SemiBiz;
import com.dto.SemiDto;

@WebServlet("/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		SemiBiz biz = new SemiBiz();
		
		if(command.equals("list")) {
			List<SemiDto> list = biz.list(null);
			request.setAttribute("list", list);
			dispatch(request, response, "noticeboard.jsp");
			
		}else if(command.equals("selectone")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			SemiDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch(request, response, "noticeboard_select.jsp");
		
		}else if(command.equals("insertform")) {
			response.sendRedirect("noticeboard_insert.jsp");
		
		}else if(command.equals("insertres")) {
			//1. 보내준 값이 있으면 받기
			String admin_writer = request.getParameter("admin_writer");
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_content");
			//2. 1번 값을 담아서 리턴
			SemiDto dto = new SemiDto();
			dto.setAdmin_writer(admin_writer);
			dto.setNotice_title(notice_title);
			dto.setNotice_content(notice_content);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				response.sendRedirect("board.do?command=list");
			}else {
				response.sendRedirect("board.do?command=insertform");
			}
		
		}else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			SemiDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch(request, response, "noticeboard_update.jsp");
		
		}else if(command.equals("updateres")) {
			int article_no = Integer.parseInt(request.getParameter("seq"));
			String notice_title = request.getParameter("notice_title");
			String notice_content = request.getParameter("notice_content");
			
			SemiDto dto = new SemiDto();
			dto.setArticle_no(article_no);
			dto.setNotice_title(notice_title);
			dto.setNotice_content(notice_content);
			
			int res=biz.update(dto);
			
			if(res>0) {
				response.sendRedirect("board.do?command=selectone&seq="+article_no);
			}else {
				response.sendRedirect("board.do?command=updateform.do&seq="+article_no);
			}
			
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			int res = biz.delete(seq);
			if(res>0) {
				response.sendRedirect("board.do?command=list");
			}else {
				response.sendRedirect("board.do?command=selectone&seq"+seq);
			}
		}
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
