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


</head>
<body>



 
<%
String idnotused = request.getParameter("idnotused");

%>   


	<table border="1">
		<tr>
			<td><input type="text" name="id" readonly="readonly"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")?"id생성 가능" : "id가 이미 존재합니다" %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirmId('<%=idnotused%>');">
			</td>
		</tr>
	
	
	</table>
    
    
</body>
</html>