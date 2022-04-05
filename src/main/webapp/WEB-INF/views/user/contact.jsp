<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/user/include/header.jsp"%>
    <link rel="stylesheet" href="${url}/css/style-starter.css">

</head>

<body>
    <section class="w3l-banner-slider-main inner-pagehny">
        <div class="breadcrumb-infhny">
            <div class="top-header-content">
                <header class="tophny-header">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="container-fluid serarc-fluid">
                            <a class="navbar-brand" href="${pageContext.request.contextPath }/user.htm"></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon fa fa-bars"></span>
                            </button>                          
                        </div>
                    </nav>
                    <!--//nav-->
                </header>
                <div class="breadcrumb-contentnhy">
                    <div class="container">
                        <nav aria-label="breadcrumb">
                            <h2 class="hny-title text-center">Contact Us</h2>
                            <ol class="breadcrumb mb-0">
                                <li><a href="${pageContext.request.contextPath }/user.htm">Trang chủ</a>
                                    <ion-icon name="chevron-forward-outline"></ion-icon></li>
                                <li class="active">Liên hệ</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
    <!-- contacts -->
    <section class="w3l-contacts-8">
        <div class="contacts-9 section-gap py-5">
            <div class="container py-lg-5">
                <div class="row top-map">
                    <div class="col-lg-6 partners">
                        <div class="cont-details">
                            <h3 class="hny-title mb-0">Liên <span>Lạc</span></h5>
                                <p class="mb-5">Chúng tôi sẵn sàng hỗ trợ bạn</p>
                                <p class="margin-top"><span class="texthny">Call Us : </span> <a href="tel:+(84) 94 352 559 ">+(84) 94 352 559</a></p>
                                <p> <span class="texthny">Email : </span> <a href="bopets@gmail.com">bopets@gmail.com</a></p>
                                <p class="margin-top">97 Man Thiện, phường Hiệp Phú, Quận 9, TP. Hồ Chí Minh</p>
                        </div>
                        <div class="hours">
                            <h3 class="hny-title">Giờ <span>Làm Việc</span></h5>
                                <h6>Bộ phận kinh doanh:</h6>
                                <p> Thứ 2 tới thứ 6 8.00 am - 6.00 pm</p>

                                <h6 class="margin-top">Hỗ trợ khách hàng:</h6>
                                <p> Thứ 2 tới Thứ 6 8.00 am - 6.00 pm</p>
                                <p> Thứ 7 10.00 am - 4.00 pm</p>

                        </div>
                    </div>
                    <div class="col-lg-6 map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15674.046470318253!2d106.77693702565632!3d10.848637376359786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752713216a3adf%3A0xf8b22853eea72777!2zOTcgxJDGsOG7nW5nIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1636193075428!5m2!1svi!2s"
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="map-content-9 form-bg-img">
            <div class="layer section-gap py-5">
                <div class="container py-lg-5">
                    <div class="form">
                        <h3 class="hny-title two text-center">Điền vào mẫu.</h3>
                        <form action="https://sendmail.w3layouts.com/submitForm" class="mt-md-5 mt-4" method="post">
                            <div class="input-grids">
                                <input type="text" name="w3lName" id="w3lName" placeholder="Name">
                                <input type="email" name="w3lSender" id="w3lSender" placeholder="Email" required="" />
                                <input type="subject" name="w3lSubject" id="w3lSubject" placeholder="Subject" required="">
                            </div>
                            <div class="input-textarea">
                                <textarea name="w3lMessage" id="w3lMessage" placeholder="Message" required=""></textarea>
                            </div>
                            <button type="submit" class="btn-contact-send">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //contacts -->
    <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${url }/js/jquery-3.3.1.min.js"></script>
	<script src="${url }/js/jquery-2.1.4.min.js"></script>
	<script src="${url }/js/minicart.js"></script>
	<script src="${url }/js/main.js"></script>
</body>

</html>

