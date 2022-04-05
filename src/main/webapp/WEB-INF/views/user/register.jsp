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
</head>
<body>
	<body>
    <div class="main">
        <div class="container">
            <div class="signup-content">
                <form action="${pageContext.request.contextPath }/user-register.htm" method="POST" id="signup-form" class="signup-form">
                    <a href="${pageContext.request.contextPath }/user.htm" class="register-close">
                        <ion-icon name="close-outline"></ion-icon>
                    </a>
                    <h2>Đăng ký </h2>
                    <div class="form-group">
                        <input type="text" required="required" class="form-input" name="username" id="name" placeholder="Tên đăng nhập" />
                    </div>
                    <div class="form-group">
                        <input type="email" required="required" class="form-input" name="email" id="email" placeholder="Email" />
                    </div>
                    <div class="form-group">
                        <input type="password" required="required" class="form-input" name="password" id="password" placeholder="Mật khẩu" />
                    </div>
                    <div class="form-group">
                        <input type="password" required="required" class="form-input" name="rePassword" id="rePassword" placeholder="Xác nhận lại mật khẩu" />
                    </div>
                    <div class="form-group">
                        <input type="number" required="required" class="form-input" name="phone" id="phone" placeholder="Số điện thoại" />
                    </div>
                    <span class="error-register">${message }</span>
                    <div class="form-group">
                        <input type="checkbox" required="required" name="agree-term" id="agree-term" class="agree-term" />
                        <label for="agree-term" class="label-agree-term"><span></span>Tôi đồng ý với các quy định trong  <a href="#!" class="term-service">Điều khoản dịch vụ</a></label>
                    </div>
                    <div class="form-group">
                        <button class="form-submit submit">Đăng ký</button>
                        <a href="${pageContext.request.contextPath }/user-login.htm" class="submit-link submit">Đăng nhập</a>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>