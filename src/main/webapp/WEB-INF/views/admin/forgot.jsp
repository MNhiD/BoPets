<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/admin/assets" var="url"></c:url>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>BoPets - Admin Forgot</title>
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="${url}/css/login.css">
</head>
<body>
  <main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
    <div class="container">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-5">
            <img src="${url}/images/forgot.jpg" alt="login" class="login-card-img">
          </div>
          <div class="col-md-7">
            <div class="card-body">
              <div class="brand-wrapper">
              Quên mật khẩu
                <%-- <img src="${url}/images/logo.png" alt="logo" class="logo"> --%>
              </div>
              <p class="login-card-description">Get your account</p>
              <form action="admin-forgot.htm" method="post">
                  <div class="login-admin form-group">             
                    <input autocomplete="off" required="required" type="text" name="accountID" class="form-control" placeholder="Tên đăng nhập.">
                  </div>
                  <div class="login-admin form-group">             
                    <input autocomplete="off" required="required" type="text" name="email" class="form-control" placeholder="Email đã đăng ký.">
                  </div>            
                  ${message }
                  <button class="btn btn-block login-btn mb-4" type="submit">SEND</button>
                  
                </form>
                <a href="myadmin.htm" class="forgot-password-link">Đăng nhập</a>
                <p class="login-card-footer-text">Chưa có tài khoản? <a href="#!" class="text-reset">Đăng ký.</a></p>
                <nav class="login-card-footer-nav">

                </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
