package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.DonateBiz;
import com.dto.BoardDto;
import com.dto.DonateDto;
import com.dto.PagingDto;

@WebServlet("/donate1.do")
public class DonateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DonateController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		
		DonateBiz biz = new DonateBiz();
		// 결제 정보를 db에 저장
		if (command.equals("payment")) {
			
			String donate_name = request.getParameter("donate_name");
			String donate_phone = request.getParameter("donate_phone");
			String donate_type = request.getParameter("donate_type");
			int donate_pay = Integer.parseInt(request.getParameter("donate_pay"));
			
			DonateDto dto = new DonateDto();
			dto.setDonate_name(donate_name);
			dto.setDonate_phone(donate_phone);
			dto.setDonate_type(donate_type);
			dto.setDonate_pay(donate_pay);
			System.out.println(dto);
			
			int res = biz.insertDonate(dto);
			if (res == 0) {
				dispatch(request, response, "donate.jsp");
			}
		// 회원정보 or 비회원 정보, 결제방법, 결제금액을 전달(결제페이지)
		} else if (command.equals("pay")) {
			String donate_name = request.getParameter("donate_name");
			String donate_phone = request.getParameter("donate_phone");
			String donate_type = request.getParameter("donate_type");
			int donate_pay = Integer.parseInt(request.getParameter("donate_pay"));
			System.out.println(donate_pay);
			
			String msg = "잘못 입력하셨습니다. 다시 입력해주세요";
			String url = "donate.jsp";
			
			request.setAttribute("donate_name", donate_name);
			request.setAttribute("donate_phone", donate_phone);
			request.setAttribute("donate_type", donate_type);
			request.setAttribute("donate_pay", donate_pay);
			
			if (donate_name == null) {
				jsResponse(response, url, msg);
			} else if (donate_phone == null) {
				jsResponse(response, url, msg);
			} else if (donate_type.equals("선택")) {
				jsResponse(response, url, msg);
			} else if (donate_pay == 0) {
				jsResponse(response, url, msg);
			} else {
				dispatch(request, response, "donate_card.jsp");
			}
			// 결제 내역 확인
		} else if (command.equals("donatemain")) {
			String donate_phone = request.getParameter("donate_phone");
			
			int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			
			int totalCount = Integer.parseInt(biz.getTotalCount(donate_phone));
			
			PagingDto paging = new PagingDto();
			paging.setPageNo(pageNum);
			paging.setPageSize(10);
			paging.setTotalCount(totalCount);
			
			pageNum = (pageNum - 1) * 10;// 1 이면 0, 2이면 10, 3이면 20...
			
			// 어디부터 어디까지 가져올 건지 쓰는것 -> 쿼리 안쪽에서 계산해줌
			List<DonateDto> list = biz.pagingList(pageNum, paging.getPageSize(), donate_phone);
			System.out.println("controller"+list);
			System.out.println("controller"+totalCount);
			request.setAttribute("list", list);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("donate_phone", donate_phone);
			dispatch(request, response, "donate_account.jsp");
			// 홈으로 이동
		} else if (command.equals("main")) {
			dispatch(request, response, "index.jsp");
			// 강아지 설문
		}else if (command.equals("강아지상")) {
            dispatch(request, response, "match_test_dok.jsp");
            // 고양이 설문
        } else if (command.equals("고양이상")) {
            dispatch(request, response, "match_test_cat.jsp");
        }
	}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s= "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+"location.href='"+url+"';"
				+"</script>";
		
		response.getWriter().print(s);
	}

}
