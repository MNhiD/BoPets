<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/user/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BoPets</title>
    <link href="//fonts.googleapis.com/css?family=Oswald:300,400,500,600&display=swap" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${url }/css/register.css">
<link rel="stylesheet" href="${url }/css/login.css">
</head>
<body>
	<div class="modal-login">
        <div class="modal-login__overlay">
        </div>
        <div class="modal-login__body">
            <div class="modal-login__inner">
                <!-- Login form  -->
                <div class="auth-form">
	                <form action="${pageContext.request.contextPath }/user-forgot.htm" method="post" >
	                <a href="${pageContext.request.contextPath }/user-login.htm" class="forgot-close login-close">
                        <ion-icon name="close-outline"></ion-icon>
                    </a>
	                    <div class="auth-form__header">
	                        <h3 class="auth-form__heading">Lấy mật khẩu?</h3>
	                    </div>
	                    <div class="auth-form__form">
	                        <div class="auth-form__group">
	                            <input type="text" required="required" name="username" class="auth-form__input" placeholder="Tên đăng nhập">
	                        </div>
	                        <div class="auth-form__group">
	                            <input type="email" required="required" name="email" class="auth-form__input" placeholder="Email đăng ký tài khoản">
	                        </div>
	                        <div class="auth-form__group message-form">
	                        	${message }
	                        </div>
	                    </div>
	                    <div class="auth-form__controls">
	                        <button type="submit" class="submit btn btn-login">Send Mail</button>
	                    </div>
	                </form>
                    <div class="auth-form__social">
                        <div class="auth-form__aside">
                            <span class="aside-text">Bạn chưa có tài khoản?</span>
                            <a href="#" class="aside-link-register">Đăng ký</a>
                        </div>
                    </div>
                </div>
                <!-- End login form  -->

            </div>
        </div>
    </div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>