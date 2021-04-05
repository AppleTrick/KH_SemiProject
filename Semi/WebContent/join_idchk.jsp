<%@page import="com.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script type="text/javascript">

        onload=function(){
            var mem_id = opener.document.getElementsByName("mem_id")[1].value;
            document.getElementsByName("id")[1].value=mem_id;
            
        }
        
        function confirmId(bool){
            if(bool == "true"){
                opener.document.getElementsByName("mem_id")[1].title = "y";
                opener.document.getElementsByName("mem_pw")[1].focus(); 
                
            }else{
                opener.document.getElementsByName("mem_id")[1].focus();
            }
            
            self.close();
        }
   
   </script>

<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

table {
	width: 80%;
	margin: auto;
	padding-top: 20%;
	text-align: center;
}

td {버튼 크기 padding-top:10px;
	
}

td>input {
	background-color: #f5df4e;
	border: none;
	outline: none;
	width: 60pt;
	height: 25pt;
}
</style>
</head>
<body>

	<%

String idnotused = request.getParameter("idnotused");

%>

	<table>

		<tr>
			<td><%=idnotused.equals("true")?"사용 가능한 ID입니다." : "입력하신 ID가 이미 존재합니다."%></td>
		</tr>
		<tr>
			<td><input type="button" value="확  인"
				onclick="confirmId('<%=idnotused%>');"></td>
		</tr>


	</table>


</body>
</html>