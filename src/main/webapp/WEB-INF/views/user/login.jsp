<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/user/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>BoPets</title>
    <link href="//fonts.googleapis.com/css?family=Oswald:300,400,500,600&display=swap" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${url }/css/register.css">
    <link rel="stylesheet" href="${url }/css/login.css">
</head>
<body>
	<div class="main">

        <div class="container">
            <div class="signup-content">
                <form action="user-login.htm" method="POST" id="signin-form" class="signin-form">
                    <a href="${pageContext.request.contextPath }/user.htm" class="login-close">
                        <ion-icon name="close-outline"></ion-icon>
                    </a>
                    <h2>Đăng nhập </h2>
                    <div class="form-group">
                        <input type="text" required="required" class="form-input" value="${uid }" name="accountId" id="name" placeholder="Tên đăng nhập" />
                    </div>
                    <div class="form-group">
                        <input required="required" type="password" class="form-input" value="${upw }" name="password" id="password" placeholder="Mật khẩu" />
                    	<span class="message-form">${message}</span>
                    </div>
                    
                    <div class="form-group group-flex">
                        <div class="remember-me">
                        	<input type="checkbox" name="remember" value="1" id="remember" class="remember" />
                        	<label for="remember" class="label-remember">Lưu đăng nhập</label>
                        </div>           
                        <a href="user-forgot.htm" class="js-click-login forgot">Quên mật khẩu?</a>
                    </div>
                   
                    <div class="form-group">
                        <button class="form-submit submit">Đăng nhập</button>
                        <a href="#" class="submit-link submit">Đăng ký</a>
                    </div>
                </form>
            </div>
        </div>

    </div>
    
<%--      <script src="${url }/js/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.js-click-login').click(function(e) {
                e.preventDefault();
                $('.modal-login').toggleClass("open-login");
            });
            $('.modal-login__overlay').click(function(e) {
                e.preventDefault();
                $('.modal-login').removeClass("open-login");

            });
        });
    </script> --%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>