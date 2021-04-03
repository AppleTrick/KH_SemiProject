<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
             var popupX = (window.screen.width/2)-(200/2);
             var popupY = (window.screen.height/2)-(300/2);
             
             if(mem_id==null|| mem_id.trim() == ""){
                 alert("id를 입력해 주세요 !");
                 
             }else {
            	 location.href="login.do?command=idchk&mem_id="+mem_id;
                 open("login.do?command=idchk&mem_id="+mem_id,"","statusbar=no,width=300, height=200, left="+popupX+",top="+popupY);
                 
             }
             
         }
    
   </script>


</head>
<body>
    

    <h2>회원가입</h2>

    <form action="login.do" method="post">
        <input type="hidden" name="command" value="insertuser">

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
                
                <td >
                 <div class="d-flex justify-content-end">
					<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
				</div>
				<input type="text" size=100 name="mem_addr" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly />
                
                </td>
            </tr>
            
            <tr>
                <th>이메일</th>
                <td><input type="text" name="mem_email" required="required" onclick="idCheckProc()"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="가입">
                    <input type="button" value="취소">
                </td>
            </tr>
        </table>
    </form>

<script type="text/javascript">

function goPopup() {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp", "pop",
			"width=570,height=420, scrollbars=yes, resizable=yes");
}
function jusoCallBack(roadFullAddr) {
	var addressEl = document.querySelector("#address");
	addressEl.value = roadFullAddr;
}


</script>




</body>
</html>