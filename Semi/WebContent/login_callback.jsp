<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">


<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>


	<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("JKUnL3XzuIStyOJXkUaH",
				"http://qclass.iptime.org:8686/Semi/login_callback.jsp");

		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);

		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");

		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

		function naverSignInCallback() {
			console.log(naver_id_login.getProfileData('name'));
			console.log(naver_id_login.getProfileData('email'));
			console.log(naver_id_login.getProfileData('birthday'));
			console.log(naver_id_login.getProfileData('age'));

			opener.location.href = "sns.do?command=naverlogin&naver_email="
					+ naver_id_login.getProfileData('email') + "&naver_name="
					+ naver_id_login.getProfileData('name');
			window.close();
		}

		//네이버 사용자 프로필 조회
		//naver_id_login.get_naver_userprofile("naverSignInCallback()");
	</script>

	</form>


</body>
</html>