<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

    function idCheckProc() {
        var chk = document.getElementsByName ("mem_id")[0].title;
        if(chk == 'n'){
            alert("id 중복체크를 해주세요!");
            document.getElementsByName("mem_id")[0].focus();
        }
       
   }
    
         function idCheck(){
             var mem_id = document.getElementsByName("mem_id")[0].value; 
             
             if(mem_id==null|| mem_id.trim() == ""){
                 alert("id를 입력해 주세요 !");
                 
             }else {
                 open("login.do?command=idchk&mem_id="+mem_id,"","width=200, height=200");
                 
             }
             
         }
    
   </script>
</head>
<body>


<% 

String email = session.getAttribute("email")+""; 
System.out.println(email);



%>


    <h2>SNS회원 간편 회원가입</h2>

    <form action="sns.do" method="post">
        <input type="hidden" name="command" value="insertSns">

        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="mem_id" required="required" title="n">
                    <input type="button" value="중복체크" onclick="idCheck();">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="mem_pw" required="required" onclick="idCheckProc();"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="mem_name" required="required" onclick="idCheckProc()"></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><input type="text" name="mem_nickname" required="required" onclick="idCheckProc()"></td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="mem_phone" required="required" onclick="idCheckProc()"></td>
            </tr>
            
            
            <tr>
                <th>주소</th>
                <td><input type="text" name="mem_addr" required="required" onclick="idCheckProc()"></td>
            </tr>
            
            
            <tr>
                <th>이메일</th>
                <td><input type="text" name="mem_email" required="required" onclick="idCheckProc()" value="<%=email%>" readonly="readonly"></td>
            </tr>
            
            
            
            
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="가입">
                    <input type="button" value="취소">
                </td>
            </tr>
        </table>
    </form>





</body>
</html>