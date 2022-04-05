<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/user/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Title</title>
    <link href="${url }/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${url }/css/profile-user.css">
    <link rel="stylesheet" href="${url }/css/style-liberty.css">
    <link rel="stylesheet" href="${url }/css/list-product.css">
    <link rel="stylesheet" href="${url }/css/common.css">
</head>
<body>
<section class="w3l-banner-slider-main inner-pagehny">
        <div class="breadcrumb-infhny">
            <div class="top-header-content">

                <%@include file="/WEB-INF/views/user/include/navbar.jsp"%>
                <div class="breadcrumb-contentnhy">
                    <div class="container">
                        <nav aria-label="breadcrumb">
                            <h2 class="hny-title text-center">Ecommerce</h2>
                            <ol class="breadcrumb mb-0">
                                <li><a href="index.html">Home</a>
                                    <ion-icon class="path-icon" name="chevron-forward-outline"></ion-icon></li>
                                <li class="active">User Info</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
	<div class="page-breadcrumb">
        <div class="row align-items-center">
            <div class="col-5">
                <h4 class="page-title">Tài khoản của tôi</h4>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="tabs">
            <div class="tab-item active"><span>Thông tin tài khoản</span></div>
            <div class="tab-item"><span>Ngân hàng</span></div>
            <div class="tab-item"><span>Địa chỉ</span></div>
            <div class="tab-item"><span>Đổi mật khẩu</span></div>
            <div class="line"></div>
        </div>

        <div class="table-content">
            <div class="tab-pane active">
                <div class="container-fluid">
                    <!-- Row -->
                    <div class="row">
                        <!-- Column -->
                        <div class="col-lg-5 col-xlg-3 col-md-5">
                            <div class="card">
                                <div class="card-body">
                                    <center class="m-t-30"> <img src="${url }/images/user.png" class="rounded-circle" width="150" />
                                        <h4 class="card-title m-t-10">${customer.accountID }</h4>
                                        <h6 class="card-subtitle">Khách hàng</h6>
                                        <div class="row text-center justify-content-md-center">
                                        </div>
                                    </center>
                                </div>
                                <div>
                                    <hr>
                                </div>
                                <div class="card-body"> <small class="text-muted">Địa chỉ email </small>
                                    <h6>${customer.email }</h6> <small class="text-muted p-t-30 db">Số điện thoại</small>
                                     <h6>${customer.phoneNumber }</h6> 
                                     <small class="text-muted p-t-30 db">Address</small>
                                   <!--  <h6>Địa chỉ</h6>  -->
                                    <div class="map-box">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d470029.1604841957!2d72.29955005258641!3d23.019996818380896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e848aba5bd449%3A0x4fcedd11614f6516!2sAhmedabad%2C+Gujarat!5e0!3m2!1sen!2sin!4v1493204785508"
                                            width="100%" height="150" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </div> 
                                    <!-- <small class="text-muted p-t-30 db">Social Profile</small> -->
                                    
                                </div>
                            </div>
                        </div>
                        <!-- Column -->
                        <div class="col-lg-7 col-xlg-9 col-md-7">
                            <div class="card">
                                <div class="card-body">
                                    <form class="form-horizontal form-material mx-2">
                                        <div class="form-group">
                                            <label class="col-md-12">Họ và Tên</label>
                                            <div class="col-md-12">
                                                <input type="text" value="${customer.name }" placeholder="Tên đầy đủ" class="form-control form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="example-email" class="col-md-12">Email</label>
                                            <div class="col-md-12">
                                                <input type="email" placeholder="" value="${customer.email }" class="form-control form-control-line" name="example-email" id="example-email">
                                            </div>
                                        </div>
                                        <!-- <div class="form-group">
                                            <label class="col-md-12">Password</label>
                                            <div class="col-md-12">
                                                <input type="password" value="password" class="form-control form-control-line">
                                            </div>
                                        </div> -->
                                        <div class="form-group">
                                            <label class="col-md-12">Số điện thoại</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="123 456 7890" value="${customer.phoneNumber }" class="form-control form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Ghi chú</label>
                                            <div class="col-md-12">
                                                <textarea rows="5" class="form-control form-control-line"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-12">Thành phố</label>
                                            <div class="col-sm-12">
                                                <select class="form-select shadow-none form-control-line">
                                                    <option>Hồ Chí Minh</option>
                                                    <option>Hà Nội</option>
                                                    <option>Đà Nẵng</option>
                                                    <option>Cần Thơ</option>
                                                    <option>Đà Lạt</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success text-white">Update Profile</button>
                                            </div>
                                        </div> -->
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Column -->
                    </div>

                </div>

            </div>

            <div class="tab-pane ">
                <p class="pane-header">Dịch vụ chưa cập nhật.</p>
            </div>
            <div class="tab-pane ">
                <p class="pane-header">Dịch vụ chưa cập nhật.</p>
            </div>
            <div class="tab-pane ">
                <div class="change-header">
                    <h3>Đổi mật khẩu</h3>
                    <p>Vui lòng không chia sẻ mật khẩu cho người khác.</p>
                </div>
                <form action="account.htm" class="change-form" method="POST">
                    <div class="old-password">
                        <label class="title" for="old-pass">Mật khẩu hiện tại</label>
                        <input required="required" type="password" name="old-pass" id="old-pass">
                    </div>
                    <div class="new-password">
                        <label class="title" for="new-pass">Mật khẩu mới</label>
                        <input required="required" type="password" name="new-pass" id="new-pass">
                    </div>
                    <div class="confirm-password">
                        <label class="title" for="confirm-pass">Xác nhận mật khẩu</label>
                        <input required="required" type="password" name="confirm-pass" id="confirm-pass">
                    </div>
                    ${message }
                    <div class="btn-confirm">
                        <button type="submit" class="submit">Xác nhận</button>
                    </div>
                </form>
            </div>


        </div>
    </div>
    <!-- end -->
     <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${url }/js/jquery-3.3.1.min.js"></script>
    <script src="${url }/js/bootstrap.min.js"></script>
    <script src="${url }/js/tabs.js"></script>
</body>
</html>