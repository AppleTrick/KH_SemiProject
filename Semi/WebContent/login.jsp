<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <a href = "home.jsp">로그인 완료</a>
    
    <form action="" method="post">
		<input type="hidden" name="command" value="login">
		<table border="1">
			<col width="100">
			<col width="100">

			<tr>
				<th>ID</th>
				<td><input type="text" name="myid"></td>
			</tr>


			<tr>
				<th>PW</th>
				<td><input type="password" name="mypw"></td>
			</tr>
			
			
			<tr>
				
				<td colspan="2" align="right">
					<input type="submit" value="login">
					<input type="button" value="regist" onclick="">
				</td>
			</tr>
			

		</table>

	</form>
</body>
</html>