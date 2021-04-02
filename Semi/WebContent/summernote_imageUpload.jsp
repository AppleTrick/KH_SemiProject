<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "org.json.simple.JSONObject" %>
<%@page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import = "java.util.Enumeration" %>
<%@page import = "com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>imageUpload</title>
</head>
<body>
<%
	String uploadPath = "summernote_upload";
	int maxSize = 10*1024*1024;
	String fileName = ""; 
	
	
	
	try{
	MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"UTF-8",
				new DefaultFileRenamePolicy());
	Enumeration<?> files = multi.getFileNames();
	String file = (String)files.nextElement();
	fileName = multi.getFilesystemName(file);
	}catch(Exception e){
		e.printStackTrace();
	}


	uploadPath = "/summernote_upload/"+fileName;
	
	JSONObject jobj = new JSONObject(); 
	jobj.put("url",uploadPath);
	
	response.setContentType("application/json");
	
	out.print(jobj.toJSONString());


%>

</body>
</html>