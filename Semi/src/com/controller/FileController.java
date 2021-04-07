package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.dto.FileDto;
import com.dto.LoginDto;
import com.oreilly.servlet.MultipartRequest;
import com.dao.FileDao;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import com.biz.FileBiz;
import com.biz.LoginBiz;

/**
 * Servlet implementation class FileController
 */
@WebServlet("/file1.do")
public class FileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    
	    String command = request.getParameter("command");
	    
	    
	    
	    FileBiz biz = new FileBiz();
	    
	    
	    if(command.equals("upload")) {
	    	
	    	String mem_id = request.getParameter("mem_id");
	    	int mem_no = Integer.parseInt(request.getParameter("mem_no"));
	    	
	    	System.out.println("memno 왔나요~~~?"+mem_no);
	    	
	    	// 폴더명
	    	String realFolder = "upload";//선언만 한것임 
	    	String filename = request.getParameter("filename");
	    	int maxSize = 1024 * 1024 * 5;
	    	String encType = "UTF-8";
	    	// 이 폴더 경로에 저장
	    	String savefile = "upload";
	    	ServletContext scontext = getServletContext();
	    	realFolder = scontext.getRealPath(savefile);
	    	// 폴더명을 저장
	    	File folder = new File(realFolder);

	    	try {
	    		// 폴더를 만듬
	    		if(!folder.exists()){
	    			folder.mkdir();
	    		}
	    	    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	    	    Enumeration<?> files = multi.getFileNames();
	    	    String file = (String) files.nextElement();
	    	    filename = multi.getFilesystemName(file);
	    	} catch (Exception e) {
	    	    e.printStackTrace();
	    	}

	    	String fullpath = realFolder + "\\" + filename;
	    	
	    	LoginDto dto = new LoginDto();
	    	dto.setMem_id(mem_id);
	    	dto.setMem_image(filename);
	    	
	    	
	    	
	    	int res = biz.updateProfile(dto);
	    	System.out.println(dto.getMem_image());
	    	
	    	HttpSession session = request.getSession();
	        // 세션에 담겨있는 로그인정보 가져옴
	        LoginDto loginSessionDto = (LoginDto)session.getAttribute("dto");
	        loginSessionDto.setMem_image(filename);
	        session.setAttribute("dto", loginSessionDto);
	        System.out.println(dto.getMem_image());
	    	
	    	
	    	if(res>0) {
	    		
	    		dispatch(request, response, "login.do?command=updatform&mem_no="+mem_no);
	    		
				//jsResponse(response, "login.do?command=updatform&mem_no="+mem_no, "개인정보 수정이 완료되었습니다.");
				
				
			}else{
				jsResponse(response, "file.do?command=upload&mem_id="+mem_id, "수정 실패...!!! 다시 확인 하세요! ");
				
				
			}
	    	
	    	
	    }
	
	
	}
	
	private void jsResponse(HttpServletResponse response, String url, String msg) throws IOException {
		String s= "<script type='text/javascript'>"
				+ "alert('"+msg+"');"
				+"location.href='"+url+"';"
				+"</script>";
		
		response.getWriter().print(s);
	}
	
	private void dispatch(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(path);
		dispatch.forward(request, response);
	}
	
	

}
