package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.ChecklistBiz;
import com.dto.ChecklistDto;

@WebServlet("/checklist.do")
public class ChecklistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ChecklistController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		ChecklistBiz biz = new ChecklistBiz();
		
		if(command.equals("insert")) {
			String q1name = request.getParameter("q1name");
			String q2call = request.getParameter("q2call");
			String q3adr = request.getParameter("q3adr");
			String q4marriage = request.getParameter("q4marriage");
			String q5job = request.getParameter("q5job");
			String q6pet = request.getParameter("q6pet");
			String q7pet2 = request.getParameter("q7pet2");
			String q8fam = request.getParameter("q8fam");
			String q9why = request.getParameter("q9why");
			String q10baby = request.getParameter("q10baby");
			String q11etc = request.getParameter("q11etc");
			
			ChecklistDto dto = new ChecklistDto();
			dto.setQ1name(q1name);
			dto.setQ2call(q2call);
			dto.setQ3adr(q3adr);
			dto.setQ4marriage(q4marriage);
			dto.setQ5job(q5job);
			dto.setQ6pet(q6pet);
			dto.setQ7pet2(q7pet2);
			dto.setQ8fam(q8fam);
			dto.setQ9why(q9why);
			dto.setQ10baby(q10baby);
			dto.setQ11etc(q11etc);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				jsResponse(response, "index.jsp", "정상적으로 처리되었습니다.");
				System.out.println("되는거");
			}else {
				jsResponse(response, "petboard_adopt_checklist.jsp", "다시 시도해 주세요.");
			}System.out.println("안되는거");
		}
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s= "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+"location.href='"+url+"';"
				+"</script>";
		
		response.getWriter().print(s);
	}

}
