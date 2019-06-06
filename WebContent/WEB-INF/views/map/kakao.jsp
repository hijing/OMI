<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
    <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    </head>
    <body>
    <a id="kakao-login-btn"></a>
    <input type="button" value="로그아웃" onclick="out()" />
    <script type='text/javascript'>

        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('cb62f9c085465b25a6b2359c43c379dc');
        
        var refreshToken = Kakao.Auth.getRefreshToken();
        
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
        	  Kakao.API.request({
        		  url : '/v1/user/me',
        		  success: function(res){
        			  alert(res.properties.nickname+'님 환영합니다.');
        		  },
        		  fail: function(error){
        			  alert(JSON.stringify(error));
        		  }
        	  });
            //alert(JSON.stringify(authObj)+"환영합니다.");
            //window.location='map.omi';
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
        
        function out(){
        	Kakao.Auth.logout(function(){
        		setTimeout(function(){
        			window.location='map.omi'
        		},1000);
        	});
        }
        

    </script>

    </body>
    </html>