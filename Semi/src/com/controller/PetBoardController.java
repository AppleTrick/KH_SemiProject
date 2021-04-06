package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.biz.BoardBiz;
import com.dto.BoardDto;

@WebServlet("/pet1.do")
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
		BoardBiz biz = new BoardBiz();
		
		if(command.equals("list")) {
			List<BoardDto> list = biz.selectList();
			request.setAttribute("list", list);
			dispatch(request, response, "petboard.jsp");
			
		}else if(command.equals("selectone")) {
			int article_no = Integer.parseInt(request.getParameter("article_no"));
			BoardDto dto = biz.selectOne(article_no);
			request.setAttribute("dto", dto);
			
			dispatch(request, response, "petboard_select.jsp");
		
		}else if(command.equals("insertform")) {
			response.sendRedirect("petboard_insert.jsp");
		
		}else if(command.equals("insertres")) {
			//1. 보내준 값이 있으면 받기
			int brd_no = Integer.parseInt(request.getParameter("brd_no"));
			int mem_no = Integer.parseInt(request.getParameter("mem_no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String image = request.getParameter("image");
			//2. 1번 값을 담아서 리턴
			BoardDto dto = new BoardDto();
			//dto.setMem_name(mem_name);
			dto.setMem_no(mem_no);
			dto.setBrd_no(brd_no);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setImage(image);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				response.sendRedirect("pet.do?command=list");
			}else {
				response.sendRedirect("pet.do?command=insertform");
			}
		
		}else if(command.equals("updateform")) {
			int ArticleNo = Integer.parseInt(request.getParameter("ArticleNo"));
			BoardDto dto = biz.selectOne(ArticleNo);
			request.setAttribute("dto", dto);
			dispatch(request, response, "petboard_update.jsp");
		
		}else if(command.equals("updateres")) {
			int article_no = Integer.parseInt(request.getParameter("article_no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			BoardDto dto = new BoardDto();
			dto.setArticle_no(article_no);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res=biz.update(dto);
			
			if(res>0) {
				response.sendRedirect("pet.do?command=list");
			}else {
				response.sendRedirect("pet.do?command=updateform.do&article_no="+article_no);
			}
			
		}else if(command.equals("delete")) {
			int ArticleNo = Integer.parseInt(request.getParameter("ArticleNo"));

			int res = biz.delete(ArticleNo);
			if(res>0) {
				response.sendRedirect("pet.do?command=list");
			}else {
				response.sendRedirect("pet.do?command=selectone&article_no"+ArticleNo);
			}
		}else if(command.equals("titleContent")) {
			int ArticleNo = Integer.parseInt(request.getParameter("ArticleNo"));
			System.out.println(ArticleNo);
			BoardDto dto = biz.selectOne(ArticleNo);
			String title = dto.getTitle();
			String content = dto.getContent();
			
			JSONObject jobj = new JSONObject();
			jobj.put("title", title);
			jobj.put("content", content);
			response.getWriter().print(jobj.toJSONString());
		}
	}

	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
