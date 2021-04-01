<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
</head>
<body>
	<%@ include file="Form/header.jsp"%>

	<div class="mt-4">
		<div class="container d-flex justify-content-center">
			<div class="col-9">
				<div class="row">
					<div class="col">
						<div class="card card-body">
							<input type="text" id="search-input" class="form-control" />
						</div>
					</div>
				</div>

				<table class="table">
					<tr class="bg-info">
						<th data-colname="name" data-order="desc" width="10%">축종</th>
						<th data-colname="disease" data-order="desc" width="25%">질병명</th>
						<th data-colname="Main_symptoms" data-order="desc" width="65%">주요증상</th>
					</tr>

					<tbody id="myTable"></tbody>
				</table>
			</div>
		</div>
	</div>


	<script src="resources/js/table.js"></script>


</body>
</html>