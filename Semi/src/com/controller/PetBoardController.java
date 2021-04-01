package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.PetBiz;
import com.dto.PetDto;

@WebServlet("/pet.do")
public class PetBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PetBoardController() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		PetBiz biz = new PetBiz();
		
		if(command.equals("list")) {
			List<PetDto> list = biz.selectList();
			request.setAttribute("list", list);
			List<PetDto> list2 = biz.select2();
			request.setAttribute("list2", list2);
			List<PetDto> list3 = biz.select3();
			request.setAttribute("list3", list3);
			dispatch(request, response, "petboard.jsp");
			
		}else if(command.equals("selectone")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			PetDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch(request, response, "petboard_select.jsp");
		
		}else if(command.equals("insertform")) {
			response.sendRedirect("petboard_insert.jsp");
		
		}else if(command.equals("insertres")) {
			//1. 보내준 값이 있으면 받기
			String mem_writer = request.getParameter("mem_writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			//2. 1번 값을 담아서 리턴
			PetDto dto = new PetDto();
			dto.setMem_writer(mem_writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				response.sendRedirect("pet.do?command=list");
			}else {
				response.sendRedirect("pet.do?command=insertform");
			}
		
		}else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			PetDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch(request, response, "petboard_update.jsp");
		
		}else if(command.equals("updateres")) {
			int article_no = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PetDto dto = new PetDto();
			dto.setArticle_no(article_no);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res=biz.update(dto);
			
			if(res>0) {
				response.sendRedirect("pet.do?command=selectone&seq="+article_no);
			}else {
				response.sendRedirect("pet.do?command=updateform.do&seq="+article_no);
			}
			
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			int res = biz.delete(seq);
			if(res>0) {
				response.sendRedirect("pet.do?command=list");
			}else {
				response.sendRedirect("pet.do?command=selectone&seq"+seq);
			}
		}
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
