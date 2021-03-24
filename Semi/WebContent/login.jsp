<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="393709466900-djrtjsb8etgtriiljfdqd58gp07vf6iu.apps.googleusercontent.com">

<title>Insert title here</title>
</head>
<body>
    <a href = "home.jsp">로그인 완료</a>
    
    <script type="text/javascript"
	
	src="https://code.jquery.com/jquery-latest.min.js"></script>

	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
    <form action="login.do" method="post">
		<input type="hidden" name="command" value="login">


		<table>
			<col width="100">
			<col width="100">

			<tr>
				<th>ID</th>
				<td><input type="text" name="mem_id"></td>
			</tr>


			<tr>
				<th>PW</th>
				<td><input type="password" name="mem_pw"></td>
			</tr>
			
			
			<tr>
				
				<td colspan="2" align="right">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='login.do?command=joinform'">
					<a id="kakao-login-btn"></a><br>
					<div id="naver_id_login"></div>
					<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
					
				</td>
			</tr>
			
	<!-- KAKAO LOGIN -->		
     <script type="text/javascript">
		Kakao.init('90c04b9f0318b89033c0670c0eec9a87');

		Kakao.Auth.createLoginButton({
			//id값을 설정한 곳에 버튼을 자동생성한다
			container : '#kakao-login-btn',
			success : function(authObj) {
				//request함수를 통해 사용자 정보를 얻는다
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						console.log(res);

						/* var id = res.id;
						var email = res.kakao_account.email;
						var name = res.properties.nickname;
						var image = res.properties.profile_image;
						var html = '<BR>' + email + '<BR>' + name;

						html += '<BR><img src="'+image+'">';

						$('body').append(html); */

					}
				})

				console.log(authObj);
				var token = authObj.access_token;
			},
			fail : function(err) {
				alert(JSON.stringify(err));
				
			}

		});
	</script>
	<!-- NAVER -->
	
	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<script type="text/javascript">
  			var naver_id_login = new naver_id_login("JKUnL3XzuIStyOJXkUaH", "http://localhost:8787/Semi/login_callback.jsp");
		  	
  			var state = naver_id_login.getUniqState();
		  	naver_id_login.setButton("green", 3,40); // 새성된 버튼 색깔 green 3번 옵션으로 넣어줌 
		  	naver_id_login.setDomain("http://localhost:8787"); // service url 넣어줌 
		  	naver_id_login.setState(state);
		  	naver_id_login.setPopup(); // 팝업 설정
		  	
		  	naver_id_login.init_naver_id_login();
  		</script>
  
	
	 

	
	<!-- GOOGLE LOGIN -->
	<script>
    
    	//등록된 계정 정보를 가져오는 메소드?
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());//보통 이 정보를 가지고 디비에 등록해서 사용하면 된다? 

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
    	//로그아웃 함수
    	function signOut() {
			gapi.auth2.getAuthInstance().disconnect();
		}
    	
    	
    </script>
  
	</table>

	</form>
</body>
</html>