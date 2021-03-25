<%@page import="com.dto.LoginDto"%>
<%@page import="com.biz.LoginBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int mem_no = Integer.parseInt(request.getParameter("mem_no"));
	LoginBiz biz = new LoginBiz();
	LoginDto dto = biz.selectMember(mem_no);

	

%>
	<form action="login.do" method="post">
		<input type="hidden" name="command" value="userupdate">
		<input type="hidden" name="mem_no" value="<%=dto.getMem_no()%>">
		<table border="1">
			<tr>
                <th>비밀번호</th>
                <td><input type="password" name="mem_pw" required="required" value="<%=dto.getMem_pw() %>"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="mem_name" required="required" value="<%=dto.getMem_name() %>"></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><input type="text" name="mem_nickname" required="required" value="<%=dto.getMem_nickname() %>"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" name="mem_addr" required="required" value="<%=dto.getMem_addr() %>"></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="mem_phone" required="required" value="<%=dto.getMem_phone() %>"></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" name="mem_email" required="required" value="<%=dto.getMem_email() %>"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="수정">
                    <input type="button" value="취소">
                </td>
            </tr>
		
		</table>
	</form>

    <a href = "mypage.jsp">수정 완료</a>
</body>
</html>