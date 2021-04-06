<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
* {
	box-shadow: none !important;
	outline: none !important;
}
table{
	margin-left: auto;
	margin-right: auto;
}
th,td{
	padding: 10px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Form/header.jsp"%>
	<!-- 바디부분 시작 -->
<div class="donatebody">
	<div class="mt-4 mb-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<img src=resources/img/donate1004.png  width="1000px"/>
					<form action="donate.do" method="post">
						<input type="hidden" name="command" value="pay">
							<table>
								<tr>
									<th>후원자</th>
									<td>
										<div class="col-sm-12">
     										<input type="text" class="form-control" name="donate_name">
   										</div>
   									</td>
								</tr>
								<tr>
									<th>전화번호</th>
										<td>
											<div class="col-sm-12">
     											<input type="text" class="form-control" name="donate_phone" placeholder="000-0000-0000">
   											</div>
   										</td>
								</tr>
								<tr>
									<th>결제방법</th>
									<td>
									<select class="form-select" name="donate_type">
										  <option selected value="선택">선택</option>
										  <option value="kakaopay">카카오페이</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>결제금액</th>
									<td><select class="form-select" name="donate_pay">
											<option selected value="0">선택</option>
											<option selected value="10000">10000원</option>
											<option selected value="20000">20000원</option>
											<option selected value="30000">30000원</option>
											<option selected value="40000">40000원</option>
									</select></td>
								</tr>
								<tr>
									<td colspan="2" align="right"><input type="submit"
										class="btn btn-primary" value="후원하기"> <input type="button" value="취소" class="btn btn-primary"
										onclick="index.jsp"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>