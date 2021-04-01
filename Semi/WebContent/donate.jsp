<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">

				<form action="donate.do" method="post">
					<input type="hidden" name="command" value="pay">
					<table border="1">
						<tr>
							<th>후원자</th>
							<td><input name="donate_name"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input name="donate_phone" placeholder="000-0000-0000"></td>
						</tr>
						<tr>
							<th>결제방법</th>
							<td><select name="donate_type">
									<option>선택</option>
									<option value="kakaopay">카카오페이</option>
							</select></td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td><select name="donate_pay">
									<option>선택</option>
									<option value="10000">10000원</option>
									<option value="20000">20000원</option>
									<option value="30000">30000원</option>
									<option value="40000">40000원</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit"
								value="후원하기"> <input type="button" value="취소"
								onclick="index.jsp"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>