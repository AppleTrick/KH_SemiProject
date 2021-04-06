package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BoardBiz;
import com.dto.BoardDto;


/**
 * Servlet implementation class InfinitContent
 */
@WebServlet("/infinitContent1.do")
public class InfinitContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int infinityNumber = Integer.parseInt(request.getParameter("infinityNumber"));
		
		BoardBiz biz = new BoardBiz();
		
		List<BoardDto> list = biz.infinitySelect(infinityNumber,infinityNumber+5);
		
		String resp = "";

		for (BoardDto petdto : list) {
			if(petdto.getBrd_no()==2) {
				resp += "<div class='pic wait'>"
						+"<img src='resources/saveFile/"+petdto.getImage()+"' data-original='"+petdto.getImage()+"' articleNo='"+petdto.getArticle_no()+"' chk='stop' onclick='clicks(this)'/>"
						+"</div>";				
			}else if(petdto.getBrd_no()==3) {
				resp +=  "<div class='pic after'>"
				 +"<img src='savefile/"+petdto.getImage()+"' data-original='" +petdto.getImage() +"' articleNo='" + petdto.getArticle_no()+"' onclick='clicks(this)'/>"
				 +"</div>";		
			}
		}
		
		System.out.println(resp);

		
		out.write(resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
