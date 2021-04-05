<%@page import="com.dto.LoginDto"%>
<%@page import="com.biz.LoginBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 60%;
	height: 100px;
	margin: auto;
	margin-top: 50px;
	border-collapse: separate;
	border-spacing: 0 40px;
}

#2_form {
	margin-left: 150px;
}

td>input {
	margin-bottom: 10px;
}

table>tr {
	align: left;
}

.btn {
	width: 130;
	height: 30; /*--버튼 크기---*/
	margin-top: 50px;
}

/* div {
        width: 100%;
        height: 300px;
        
        border: 1px solid #000;
    } */
div.left {
	width: 50%;
	float: left;
	box-sizing: border-box;
	height: 480px;
	padding-left: 80px;
}

div.right {
	width: 50%;
	float: right;
	box-sizing: border-box;
	height: 480px;
}
</style>

</head>

<body>

	<%
		LoginDto dto2 = (LoginDto) session.getAttribute("dto"); //컨트롤러에서 dto 받아와서 형변환 
	if (dto2 == null) {
		pageContext.forward("index.jsp");
	}
	%>


	<%@ include file="Form/header.jsp"%>

	<%
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
	LoginBiz biz = new LoginBiz();
	LoginDto dto = biz.selectMember(mem_no);
	%>
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<h2>회원정보수정</h2>
				<p>
					"<%=dto.getMem_id()%>"님의 정보입니다.
				</p>
				<hr>

				<div class="left">

					<%
						if (dto.getMem_image() != null) {
					%>


					<img src="./upload/<%=dto.getMem_image()%>" name="profile_img"
						width="350" height="350">
					<%
						} else {
					%>
					<img src="resources/img/profile.jpg" name="profile_img" width="350"
						height="350">
					<%
						}
					%>

					<form
						action="file.do?command=upload&mem_id=<%=dto.getMem_id()%>&mem_no=<%=dto.getMem_no()%>"
						method="post" enctype="multipart/form-data">
						<input type="file" name="file" style="margin-bottom: 10px; margin-top: 40px;"><br> 
						<input type="submit" value="프로필사진 변경"><br>

					</form>
				</div>
 


				<div class="right">
					<form action="login.do" method="post" id="2_form">

						<input type="hidden" name="command" value="userupdate"> 
						<input type="hidden" name="mem_no" value="<%=dto.getMem_no()%>">



						<table style="margin-left: 100px; margin-right: 0px;">
							<colgroup>
								<col width="25%">
								<col width="75%">
							</colgroup>
							<tr>
								<th>아이디</th>
								<td>
								<input type="text" name="mem_id" required="required" value="<%=dto.getMem_id()%>" readonly="readonly"></td>

							</tr>

							<tr>
								<th>비밀번호 변경</th>
								<td><input type="password" name="mem_pw"
									required="required" value="<%=dto.getMem_pw()%>"></td>
							</tr>


							<tr>
								<th>이름</th>
								<td><input type="text" name="mem_name" required="required"
									value="<%=dto.getMem_name()%>"><br></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" name="mem_nickname"
									required="required" value="<%=dto.getMem_nickname()%>"><br></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="mem_addr" required="required"
									value="<%=dto.getMem_addr()%>"><br></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="mem_phone" required="required"
									value="<%=dto.getMem_phone()%>"><br></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="mem_email" required="required"
									value="<%=dto.getMem_email()%>"><br></td>
							</tr>
							<tr>
								<th>회원등급</th>
								<td><input type="text" name="mem_email" required="required"
									value="<%=dto.getMem_role()%>" readonly="readonly"><br></td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" class="btn" value="수정완료" style="background-color: #f5df4e;">
									<input type="button" class="btn" value="뒤로가기" style="background-color: #f5df4e;"> 
									<input type="button" class="btn" value="회원탈퇴" style="background-color: #f5df4e;"onclick="location.href='login.do?command=deleteuser&mem_no=<%=dto.getMem_no()%>'">
								</td>
							</tr>

						</table>

					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>