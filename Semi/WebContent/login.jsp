<%@page import="com.dto.LoginDto"%>
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

	<!-- 제이쿼리 -->
    <script type="text/javascript"src="https://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 카카오 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- 네이버 -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<!-- 구글 -->
	<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  	<script src="https://apis.google.com/js/api:client.js"></script>
  	
  	<!-- GOOGLE LOGIN -->
	<script>
	  var googleUser = {};
	  var startApp = function() {
	    gapi.load('auth2', function(){
	      
	      auth2 = gapi.auth2.init({
	        client_id: '393709466900-djrtjsb8etgtriiljfdqd58gp07vf6iu.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	        // Request scopes in addition to 'profile' and 'email'
	        scope: 'profile email'
	      });
	      
	      attachSignin(document.getElementById('customBtn'));
	    });
	  };
	
	  function attachSignin(element) {
	    console.log(element.id);
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {
	          location.href="sns.do?command=googlelogin&google_email="+googleUser.getBasicProfile().getEmail() + "&google_name="+googleUser.getBasicProfile().getName();
	        }, function(error) {
	          alert(JSON.stringify(error, undefined, 2));
	        });
	  }
	</script>
	
	<style type="text/css">
    #customBtn {
      margin-left: 10px;
      display: inline-block;
      background: white;
      color: #444;
      width: 100px;
      border-radius: 5px;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-family: serif;
      font-weight: normal;
    }
    span.icon {
      background: url('resources/LoginImage/g-normal.png') transparent 5px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 36px;
      height: 36px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      font-size: 14px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>
   
    
	<!-- login css -->
	<link rel="stylesheet" href="resources/css/loginpage.css" />
	
	<script type="text/javascript">
	
    function idCheckProc() {
        var chk = document.getElementsByName ("mem_id")[1].title;
        if(chk == 'n'){
            alert("id 중복체크를 해주세요!");
            document.getElementsByName("mem_id")[1].focus();
        	}
   	}
    
    function idCheck(){
        var mem_id = document.getElementsByName("mem_id")[1].value; 
        //팝업창 가운데 정렬
        var screenW = screen.availWidth; // 스크린 가로사이즈
        var screenH = screen.availHeight; // 스크린 세로사이즈
        var popW =300; //팝업창 가로사이즈
        var popH =200; //팝업창 세로사이즈
        var posL=(screenW-popW)/2; //팝업창 가로 포지션
        var posT=(screenH-popH)/2; //팝업창 세로 포지션
        
        if(mem_id==null|| mem_id.trim() == ""){
            alert("id를 입력해 주세요 !");
        }else {
            open('login.do?command=idchk&mem_id='+mem_id,'test','width='+popW+',height='+popH+',top='+posT+',left='+posL+',resizable=no,scrolbars=no');
        }
    }
    
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

    function toggleForm(){
        container = document.querySelector('.container');
        section = document.querySelector('section');

        container.classList.toggle('active');
        section.classList.toggle('active');
    }
   
	
	
	
	

    
    <%
	LoginDto logindto;
	String email = "";
	String name = "";
	if(request.getAttribute("loginDto")!=null ){
		logindto = (LoginDto) request.getAttribute("loginDto");
		if(logindto.getMem_name() != null){
			name = logindto.getMem_name();
		}		
		email = logindto.getMem_email();
	%>
		window.onload = function(){
			toggleForm();
		}
	<%
	}
	%>
	
    
    
  	</script>

	<title>Insert title here</title>
</head>
<body> 

    <section>
    <!-- 로그인 부분 -->
        <div class="container">
            <div class="user signinBx">

                <div class="imgBx">
                    <img src="resources/img/dog_login.jpg">
                </div>

                <div class="formBx">
                    <form action="login.do" method="post">
                    	<input type="hidden" name="command" value="login">
                        <h2>로그인</h2>
                        <input type="text" placeholder="Username" name="mem_id">
                        <input type="password" placeholder="PassWord" name="mem_pw">
                        <input type="submit" value="Login">
                        <input class="homeBtn" type="button" value="Main" onclick="location.href='index.jsp'">
                        <p class="signup"> 아이디가 없으신가요? <a onclick="toggleForm();">회원가입</a></p>
                        
                        <div class="SNSButton">
                        	<!-- 카카오 버튼 -->
							<a id="kakao-login-btn" style="display:none;"></a>
							<a class="kakao" onclick="document.getElementById('kakao-login-btn').click();">
								<img alt="" src="resources/LoginImage/kakao.png" width="72" height="36">
							</a>
							
							<!-- 네이버 버튼 -->
							<div id="naver_id_login" class="SNSbuttons"></div>				
							
							<!-- 구글 버튼 -->
							<div id="gSignInWrapper">
							   <div id="customBtn" class="customGPlusSignIn">
							     <span class="icon"></span>
							     <span class="buttonText">Google</span>
							   </div>
							 </div>
							<script>startApp();</script>
							<!-- <div class="g-signin2 SNSbuttons" data-onsuccess="onSignIn" heigth="50"></div>	 -->
                        </div>
                    </form>
                </div>
            </div>
	<!-- 회원가입 부분 -->
            <div class="user signupBx">
                <div class="formBx">
                    <form action="login.do" method="post">
                    	<input type="hidden" name="command" value="insertuser">
                        <h2>회원가입</h2>
                        <div>
                        	<input type="text" name="mem_id" required="required" title="n" placeholder="ID"><input type="button" value="중복확인" onclick="idCheck();" class="checkButton">
                       	</div>                      
                        <input type="password" placeholder="Create Password" name="mem_pw" required="required" onclick="idCheckProc();">
                        <input type="text" placeholder="Username" name="mem_name" required="required" onclick="idCheckProc()" value="<%=name %>">
                        <input type="text" placeholder="Nickname" name="mem_nickname" required="required" onclick="idCheckProc()">
                        <input type="text" placeholder="PhoneNumber" name="mem_phone" required="required" onclick="idCheckProc()">
                        <div>
                        	<input type="text" name="mem_addr" id="address" class="form-control" placeholder="도로명 주소를 입력해 주세요" required readonly><input type="button" class="btn btn-info checkButton" onClick="goPopup();" value="검색">
                        </div>       
                        <input type="text" placeholder="Email" name="mem_email" required="required" onclick="idCheckProc()" value="<%=email %>">
                        <input type="submit" value="Sign up">
                        <p class="signup"> 아이디가 있으신가요? <a onclick="toggleForm();">로그인</a></p>
                    </form>
                </div>
                <div class="imgBx">
                    <img src="resources/img/cat_login.jpg">
                </div>
            </div>
        </div>

        
    </section>
    
    
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

					location.href="sns.do?command=kakaologin&kakao_email="+res.kakao_account.email+"";
						//window.close();
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
	  	naver_id_login.setButton("green", 2,36); // 새성된 버튼 색깔 green 3번 옵션으로 넣어줌 
	  	naver_id_login.setDomain("http://localhost:8787"); // service url 넣어줌 
	 	naver_id_login.setState(state);
		naver_id_login.setPopup(); // 팝업 설정
		naver_id_login.init_naver_id_login();
  	</script>	
	
</body>
</html>