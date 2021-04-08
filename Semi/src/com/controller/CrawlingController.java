package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BoardBiz;
import com.dto.BoardDto;

@WebServlet("/crawling1.do")
public class CrawlingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CrawlingController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unlikely-arg-type")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 서버 실행시 파일 경로
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/saveFile") ;
		//String savePath = rootPath + "resources\\saveFile\\" ;

		String command = request.getParameter("command");
		System.out.println(command);

		BoardBiz biz = new BoardBiz();

		if (command.equals("animal")) {
			
			int mem_no = Integer.parseInt(request.getParameter("mem_no"));
			int brd_no = Integer.parseInt(request.getParameter("brd_no"));
			String title = "입양대기";
			Crawling crawling = new Crawling();
			// 크롤링 후 저장한 내용을 저장
			List<String> listCat = crawling.CatCrawling(rootPath);
			List<String> listDok = crawling.DokCrawling(rootPath);
			
			System.out.println(listCat.size());
			System.out.println(listDok.size());
			
			// img, content 는 중복값을 제거한 후 디비에 저장하기 위하여 나눔
			List<String> listCatImg = new ArrayList<String>();
			List<String> listCatContent = new ArrayList<String>();

			List<String> listDokImg = new ArrayList<String>();
			List<String> listDokContent = new ArrayList<String>();
			// 중복체크하기 위하여 db값 호출
			List<BoardDto> boardList = biz.selectList();
			// 고양이 이미지와 내용을 나눔
			for (int j = 0; j < listCat.size(); j++) {
				String catResult = listCat.get(j);

				int catIndex = catResult.indexOf("@");

				String catImg = catResult.substring(0, catIndex);
				String catContent = catResult.substring(catIndex+1);
				
				listCatImg.add(catImg);
				listCatContent.add(catContent);
				System.out.println("고양이 사진"+listCatImg.get(j));
				System.out.println("고양이 내용"+listCatContent.get(j));

			}
			// 강아지 이미지와 내용을 나눔
			for (int j = 0; j < listDok.size(); j++) {
				String dokResult = listDok.get(j);

				int dokIndex = dokResult.indexOf("@");
				
				String dokImg = dokResult.substring(0, dokIndex);
				String dokContent = dokResult.substring(dokIndex+1);
				
				listDokImg.add(dokImg);
				listDokContent.add(dokContent);
				System.out.println("강아지 사진"+listDokImg.get(j));
				System.out.println("강아지 내용"+listDokContent.get(j));
			}
			// 고양이 중복제거
			int aaaa = 1;
			for (BoardDto catDeleteDto : boardList) {
				System.out.println(aaaa+"고양이"+catDeleteDto.getArticle_no());
				aaaa++;
				for (int i = 0; i < listCatImg.size(); i++) {
					System.out.println("고양이 : "+i);
					
					if (catDeleteDto.getImage() == null || catDeleteDto.getImage().equals("")) {
						continue;
					} else if (catDeleteDto.getImage().equals(listCatImg.get(i))) {
						listCatImg.remove(i);
						System.out.println("중복제거성공");
					}
				}
				for (int i = 0; i < listCatContent.size(); i++) {
					if (catDeleteDto.getContent() == null || catDeleteDto.getContent().equals("")) {
						continue;
					} else if (catDeleteDto.getContent().equals(listCatContent.get(i))) {
						listCatContent.remove(i);
						System.out.println("중복제거성공");
					}
				}
				System.out.println("중복제거중");
			}
			// 강아지 중복제거
			for (BoardDto dokDeleteDto : boardList) {
				System.out.println("강아지" + dokDeleteDto.getArticle_no());
				for (int i = 0; i < listDokImg.size(); i++) {
					System.out.println("강이지 : "+i);
					if (dokDeleteDto.getImage() == null || dokDeleteDto.getImage().equals("")) {
						continue;
					} else if (dokDeleteDto.getImage().equals(listDokImg.get(i))) {
						listDokImg.remove(i);
						System.out.println("중복제거성공");
					}
				}
				for (int i = 0; i < listDokContent.size(); i++) {
					if (dokDeleteDto.getContent() == null || dokDeleteDto.getContent().equals("")) {
						continue;
					} else if (dokDeleteDto.getContent().equals(listDokContent.get(i))) {
						listDokContent.remove(i);
						System.out.println("중복제거성공");
					}
				}
				System.out.println("중복제거중");
			}
			// db에 중복제거 한 값 저장
			if (listCatImg != null && listDokImg != null & listCatContent != null && listDokContent != null) {
				for (int i = 0; i < listCatImg.size(); i++) {
					BoardDto catDto = new BoardDto();
					catDto.setBrd_no(brd_no);
					catDto.setMem_no(mem_no);
					catDto.setTitle(title);
					catDto.setContent(listCatContent.get(i));
					catDto.setImage(listCatImg.get(i));
					System.out.println(catDto);
					int res = biz.insert(catDto);
					
					if (res > 0) {
						System.out.println("cat insert 성공");
					} else {
						System.out.println("cat insert 실패");
					}
				}
				
				for (int i = 0; i < listDokImg.size(); i++) {
					BoardDto dokDto = new BoardDto();
					dokDto.setBrd_no(brd_no);
					dokDto.setMem_no(mem_no);
					dokDto.setTitle(title);
					dokDto.setContent(listDokContent.get(i));
					dokDto.setImage(listDokImg.get(i));
					System.out.println(dokDto);
					int res = biz.insert(dokDto);
					
					if (res > 0) {
						System.out.println("dok insert 성공");
					} else {
						System.out.println("dok insert 실패");
					}
				}
			}
			dispatch(request, response, "pet.do?command=list");
		}
	}
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
}
