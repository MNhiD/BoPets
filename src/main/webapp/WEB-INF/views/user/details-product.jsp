<%@ page pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/user/include/header.jsp"%>
    <link rel="stylesheet" href="${url }/css/style-liberty.css">
    <link rel="stylesheet" href="${url }/css/product-details.css">
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
                                <li><a href="${pageContext.request.contextPath }/user.htm">Home</a>
                                    <ion-icon name="chevron-forward-outline"></ion-icon></li>
                                <li class="active">Shop Single</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
    <section class="w3l-ecommerce-main-inn">
        <!--/ecommerce-single-->
        <div class="ecomrhny-content-inf py-5">
            <div class="container py-lg-5">
                <!--/row1-->
                <div class="sp-store-single-page row">
                    <div class="col-lg-5 single-right-left">
                        <div class="flexslider1">

                            <ul class="slides">
                                <li data-thumb="<c:url value='/images/${prod.image}'/>">
                                    <div class="thumb-image"> <img src="<c:url value='/images/${prod.image}'/>" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                                <li data-thumb="<c:url value='/images/${prod.image}'/>">
                                    <div class="thumb-image"> <img src="<c:url value='/images/${prod.image}'/>" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                                <%-- <li data-thumb="${url}/images/corgi-product2.jpg" style="width: 350px; height: 450px;">
                                    <div class="thumb-image"> <img src="${url}/images/corgi-product.jpg" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                                <li data-thumb="${url}/images/corgi-product2.jpg">
                                    <div class="thumb-image"> <img src="${url}/images/corgi-product2.jpg" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li> --%>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="eco-buttons mt-5">

                            <div class=" transmitv single-item" data-id="${prod.productId }">
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart">
                                    <input type="hidden" name="add" value="1">
                                    <input type="hidden" name="transmitv_item" value="${prod.name}">
                                    <input type="hidden" name="amount" value="${prod.price}">
                                    <button type="submit" class="transmitv-cart ptransmitv-cart add-to-cart read-2">
									Thêm Vào Giỏ Hàng
								</button>
                                </form>
                            </div>
                            <div class="buyhny-now"> <a href="${pageContext.request.contextPath }/buynow/${ prod.productId}.htm" class="action btn">Mua Ngay </a></div>

                        </div>
                    </div>
                    <div class="col-lg-7 single-right-left pl-lg-4 ">
                        <h3>${prod.name}
                        </h3>
                        <div class="caption">
                            <ul class="rating-single">
                                <li>
                                    <a href="#">
                                        <ion-icon name="star"></ion-icon>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <ion-icon name="star"></ion-icon>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <ion-icon name="star"></ion-icon>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <ion-icon name="star-half"></ion-icon>
                                    </a>
                                </li>

                            </ul>

                            <h6>
                                <span class="item_price"><f:formatNumber value="${prod.price }" pattern="##,###,###.0"></f:formatNumber></span>
                                <del>0đ</del>
                            </h6>
                        </div>

                        <div class="description-apt d-grid mb-4">
                            <div class="occasional">
                                <h5 class="sp_title mb-3">Thông tin chi tiết:</h5>
                                <ul class="single_specific">
                                    <li> Số lượng: ${prod.amount}</li>
                                    <c:if test = "${not empty dt.weight }">
                                    <li>
                                        Cân nặng : ${dt.weight} g</li>
                                       </c:if>
                                    <li>
                                        Xuất xứ : ${dt.brand } </li>
                                     <c:if test = "${not empty dt.material }">
	                                    <li>Chất liệu : ${dt.material }
	                                    </li>
                                     </c:if>
                                     <c:if test = "${not empty dt.classify }">
	                                    <li>Phân loại : ${dt.classify }
	                                    </li>
                                     </c:if>
									<c:if test = "${not empty dt.volume }">
	                                    <li>Thể tích : ${dt.volume }
	                                    </li>
                                     </c:if>
                                     <c:if test = "${not empty dt.expDate }">
	                                    <li>Hạn sử dụng : ${dt.expDate }
	                                    </li>
                                     </c:if>
                                </ul>

                            </div>

                            <div class="color-quality">
                                <h5 class="sp_title">Dịch vụ:</h5>
                                <ul class="single_serv">
                                    <li>
                                        <a href="#">Hoàn tiền trong 24h</a>
                                    </li>
                                    <li class="gap">
                                        <a href="#">Giao hàng trong ngày ở Hồ Chí Minh</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="desc_single mb-4">
                            <h5>Mô tả:</h5>
                            <p>${prod.description }</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--//row1-->
        </div>
        <!--//ecommerce-single-->
    </section>
    <section class="w3l-ecommerce-main w3l-ecommerce-main-inn">
        <!-- /content-6-section -->

        <!-- //content-6-section -->
        <section class="w3l-ecommerce-main">
            <!-- /products-->
            <div class="ecom-contenthny py-5">
                <div class="container py-lg-5">
                    <div style="margin: 8px auto; display: block; text-align:center;">

                        <!---728x90--->


                    </div>
                    <h3 class="hny-title mb-0 text-center"> <span>Sản phẩm Nổi Bật</span></h3>
                    <p class="text-center">Liên quan</p>
                    <div style="margin: 8px auto; display: block; text-align:center;">
                    </div>
                    <!-- /row-->
                    <div class="ecom-products-grids row mt-lg-5 mt-3">
	                    <c:forEach var="list" items="${list }" end="3">
	                        <div class="col-lg-3 col-6 product-incfhny mt-4">
	                            <div class="product-grid2 transmitv">
	                                <div class="product-image2">
	                                    <a href="${pageContext.request.contextPath }/details/${list.productId }.htm">
	                                        <img class="pic-1 img-fluid" src="<c:url value='/images/${list.image}'/>">
	                                    	<img class="pic-2 img-fluid" src="<c:url value='/images/${list.image}'/>">
	                                    </a>
	                                    <ul class="social">
	                                        <li><a href="${pageContext.request.contextPath }/details/${list.productId }.htm" data-tip="Quick View"><ion-icon name="eye"></ion-icon></a></li>
	
	                                        <li><a href="${pageContext.request.contextPath }/buynow/${list.productId}.htm" data-tip="Add to Cart"><ion-icon name="bag-handle"></ion-icon></a>
	                                        </li>
	                                    </ul>
	                                    <div class="details transmitv single-item">
	                                        <form action="#!" method="post">
	                                            <input type="hidden" name="cmd" value="_cart">
	                                            <input type="hidden" name="add" value="1">
	                                            <input type="hidden" name="transmitv_item" value="${list.name }">
	                                            <input type="hidden" name="amount" value="${list.price }">
	                                            <button hidden="true" type="submit" class="transmitv-cart ptransmitv-cart add-to-cart">
											Add to Cart
										</button>
	                                        </form>
	                                    </div>
	                                </div>
	                                <div class="product-content">
	                                    <h3 class="title"><a href="#!">${list.name }</a></h3>
	                                    <span class="price"><del>đ0</del>đ<f:formatNumber value="${list.price }" pattern="##,###,###.0"></f:formatNumber></span>
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
                        
                    </div>
                    <!-- //row-->
                </div>
            </div>
        </section>
        <!-- //products-->

        <div style="margin: 8px auto; display: block; text-align:center;">

        </div>
        
        <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
        <%@include file="/WEB-INF/views/user/include/modal.jsp"%>
        <!-- Modal đăng nhập/ đăng ký  -->
        <!-- Modal layout  -->
        
        <div id="BoPets"></div>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
		<script src="${url }/js/jquery-3.3.1.min.js"></script>
		<script src="${url }/js/jquery-2.1.4.min.js"></script>
		<script src="${url }/js/jquery.flexslider.js"></script>
		<script src="${url }/js/imagezoom.js"></script>
		<script>
		    // Can also be used with $(document).ready()
		    $(window).load(function() {
		        $('.flexslider1').flexslider({
		            animation: "slide",
		            controlNav: "thumbnails"
		        });
		    });
		</script>
		<script src="${url }/js/minicart.js"></script>
		<script src="${url }/js/jquery-ui.js"></script>
		<script src="${url }/js/main.js"></script>
</body>

</html>

