<%@ page pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/user/include/header.jsp"%>
    <link rel="stylesheet" href="${url}/css/style-starter.css">
    <link rel="stylesheet" href="${url}/css/custom.css">
    <link rel="stylesheet" href="${url}/css/common.css">
    	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>
<body>
    <section class="w3l-banner-slider-main">
        <div class="top-header-content">
            <%@include file="/WEB-INF/views/user/include/navbar.jsp"%>
            <div class="bannerhny-content">
                <!--/banner-slider-->
                <div class="content-baner-inf">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>FREESHIP
                                            <br>50% SALE OFF </h3>
                                        <a href="${pageContext.request.contextPath }/list-product.htm" class="shop-button btn">
										Shop Now
									</a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item2">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>VOUCHER 50%
                                            <br>BATHING FOR MY PETS </h3>
                                        <a href="${pageContext.request.contextPath }/list-product.htm" class="shop-button btn">
										Shop Now
									</a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item3">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>BILL 500.000
                                            <br>GIFT DOG TREATS</h3>
                                        <a href="${pageContext.request.contextPath }/list-product.htm" class="shop-button btn">
										Shop Now
									</a>

                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item item4">
                                <div class="container">
                                    <div class="carousel-caption">
                                        <h3>BIGGEST EVENT OF
                                            <br>THE YEAR 12/12</h3>
                                        <a href="${pageContext.request.contextPath }/list-product.htm" class="shop-button btn">
										Shop Now
									</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>


            </div>

    </section>
    <!-- //w3l-banner-slider-main -->
    <section class="w3l-grids-hny-2">
        <!-- /content-6-section -->
        <div class="grids-hny-2-mian py-5">
            <div class="container py-lg-5">

                <h3 class="hny-title mb-0 text-center">Shop With <span>Us</span></h3>
                <p class="mb-4 text-center">Chúng tôi có gì?</p>
                <div class="welcome-grids row mt-5">
                	<c:forEach var="ct" items="${cates }">
                	
	                   <div class="col-lg-2 col-md-4 col-6 welcome-image">
	                       <div class="boxhny13">
	                           <a href="${pageContext.request.contextPath }/search-by-category/${ct.categoryId }.htm">
	                               <img src="${url }/images/${ct.image}" class="img-fluid" alt="" />
	                               <div class="boxhny-content">
	                                   <h3 class="title">My pets
	                               </div>
	                           </a>
	                       </div>
	                       <h4><a href="${pageContext.request.contextPath }/list-product.htm">${ct.name }</a></h4>
	                   </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- //content-6-section -->
    <section class="w3l-content-w-photo-6">
        <!-- /specification-6-->
        <div class="content-photo-6-mian py-5">
            <div class="container py-lg-5">
                <div class="align-photo-6-inf-cols row">
                    <div class="photo-6-inf-right col-lg-6">
                        <h3 class="hny-title text-left">All PET'S FOOD <span>30% SALE OFF </span></h3>
                        <p>Chương trình giảm giá cuối năm với nhiều ưu đãi. Mua hàng với hóa đơn trên 500.000 tặng ngay phần thức ăn đặc biệt cho thú cưng của bạn. </p>
                        <a href="${pageContext.request.contextPath }/list-product.htm" class="read-more btn">Shop Now</a>
                    </div>
                    <div class="photo-6-inf-left col-lg-6">
                        <img src="${url }/images/photo1.jpg" class="img-fluid" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //specification-6-->
    <section class="w3l-video-6">
        <!-- /video-6-->
        <div class="video-66-info">
            <div class="container-fluid">
                <div class="video-grids-info row">
                    <div class="video-gd-right col-lg-8">
                        <div class="video-inner text-center">
                            <!--popup-->
                            <a class="play-button btn popup-with-zoom-anim" href="#small-dialog">
                                <ion-icon name="play"></ion-icon>
                            </a>
                            <div id="small-dialog" class="mfp-hide">
                                <div class="search-top notify-popup">
                                    <iframe width="560" height="315" src="https://www.youtube.com/embed/3dcli9i_pvA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                            <!--//popup-->
                        </div>
                    </div>
                    <div class="video-gd-left col-lg-4 p-lg-5 p-4">
                        <div class="p-xl-4 p-0 video-wrap">
                            <h3 class="hny-title text-left">FREESHIP FOR ALL BILL FROM <span>50.000 - SALE OFF</span>
                            </h3>
                            <p>Miễn phí vận chuyển cho mọi đơn hàng bất kỳ với hóa đơn trên 50.000. Mua hàng và nhận ngay ưu đãi. </p>
                            <a href="${pageContext.request.contextPath }/list-product.htm" class="read-more btn">
							Shop Now
						</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <section class="w3l-ecommerce-main">
        <!-- /products-->
        <div class="ecom-contenthny py-5">
            <div class="container py-lg-5">
                <h3 class="hny-title mb-0 text-center">Shop With <span>Us</span></h3>
                <p class="text-center">Nổi bật</p>
                <!-- /row-->
                <div class="ecom-products-grids row mt-lg-5 mt-3">
	                <c:forEach var="list" items="${listProduct }" end="7">
	                	<div class="col-lg-3 col-6 product-incfhny mt-4">
	                        <div class="product-grid2 transmitv">
	                            <div class="product-image2">
	                                <a href="${pageContext.request.contextPath }/details/${list.productId }.htm">
	                                    <img class="pic-1 img-fluid" src="<c:url value='/images/${list.image}'/>">
	                                    <img class="pic-2 img-fluid" src="<c:url value='/images/${list.image}'/>">
	                                </a>
	                                <ul class="social">
	                                    <li><a href="${pageContext.request.contextPath }/details/${list.productId }.htm" data-tip="Quick View"><ion-icon name="eye-sharp"></ion-icon></a></li>
	
	                                    <li><a href="${pageContext.request.contextPath }/buynow/${list.productId }.htm" data-tip="Add to Cart"><ion-icon name="bag-handle-sharp"></ion-icon></a>
	                                    </li>
	                                </ul>
	                                <div data-id="${list.productId }" class="transmitv single-item">
	                                    <form action="${pageContext.request.contextPath }/details-product.htm" method="post">
	                                        <input type="hidden" name="cmd" value="_cart">
	                                        <input type="hidden" name="add" value="1">
	                                        <input type="hidden" name="transmitv_item" value="${list.name }">
	                                        <input type="hidden" name="amount" value="${list.price }">
	                                        <button  class="transmitv-cart ptransmitv-cart add-to-cart">
											Add to Cart
										</button>
	                                    </form>
	                                </div>
	                            </div>
	                            <div class="product-content">
	                                <h3 class="title"><a href="${pageContext.request.contextPath }/details-product.htm">${list.name }</a></h3>
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
    <section class="w3l-content-5">
        <!-- /content-6-section -->
        <div class="content-5-main">
            <div class="container">
                <div class="content-info-in row">
                    <div class="content-gd col-md-6 offset-lg-3 text-center">
                        <h3 class="hny-title two">
                            More than 5 years of experience in the field of
                            <span>training</span></h3>
                        <p>Chúng tôi nhận đào tạo học viên trong lĩnh vực spa thú cưng. <br> Chúng tôi luôn chào đón những thành viên mới cho đội ngũ nhân viên của BoPets. Nếu bạn quan tâm hãy gửi cv trong phần liên hệ nhé!
                        </p>
                        <a href="${pageContext.request.contextPath }/list-product.htm" class="read-more-btn2 btn">
						Shop Now
					</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //content-6-section -->
    <section class="w3l-post-grids-6">
        <!-- /post-grids-->
        <div class="post-6-mian py-5">
            <div class="container py-lg-5">
                <h3 class="hny-title text-center mb-0 ">Latest Blog <span>Posts</span></h3>
                <p class="mb-5 text-center">Có thể bạn đã biết?</p>
                <div class="post-hny-grids row mt-5">
                    <div class="col-lg-3 col-md-6 grids5-info column-img" id="zoomIn">
                        <a href="#">
                            <figure>
                                <img class="img-fluid" src="${url }/images/blog1.jpg" alt="blog-image">
                            </figure>
                        </a>
                        <div class="blog-thumbhny-caption">
                            <ul class="blog-info-list">
                                <li><a href="#admin">By admin</a></li>
                                <li class="date-post">
                                    Aug 10, 2021</li>
                            </ul>
                            <h4><a href="#">Cách khắc phục tình trạng biếng ăn ở các chú chó</a></h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 grids5-info column-img" id="zoomIn">
                        <a href="#">
                            <figure>
                                <img class="img-fluid" src="${url }/images/blog2.jpg" alt="blog-image">
                            </figure>
                        </a>
                        <div class="blog-thumbhny-caption">
                            <ul class="blog-info-list">
                                <li><a href="#admin">By admin</a></li>
                                <li class="date-post">
                                    Aug 9, 2021</li>
                            </ul>
                            <h4><a href="#">Lợi ích của việc cho bé nuôi thú cưng</a></h4>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 grids5-info column-img" id="zoomIn">
                        <figure>
                            <img class="img-fluid" src="${url }/images/blog3.jpg" alt="blog-image">
                        </figure>
                        <div class="blog-thumbhny-caption">
                            <ul class="blog-info-list">
                                <li><a href="#admin">By admin</a></li>
                                <li class="date-post">
                                    Aug 10, 2021</li>
                            </ul>
                            <h4><a href="#">Làm thế nào để cắt móng cho chó mèo?</a></h4>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 grids5-info column-img" id="zoomIn">
                        <figure>
                            <img class="img-fluid" src="${url }/images/blog4.jpg" alt="blog-image">
                        </figure>
                        <div class="blog-thumbhny-caption">
                            <ul class="blog-info-list">
                                <li><a href="#admin">By admin</a></li>
                                <li class="date-post">
                                    Aug 10, 2021</li>
                            </ul>
                            <h4><a href="#">Thực đơn hằng ngày cho cún để cải thiện vóc dáng chuẩn.</a></h4>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- //post-grids-->
    <section class="w3l-customers-sec-6">
        <div class="customers-sec-6-cintent py-5">
            <!-- /customers-->
            <div class="container py-lg-5">
                <h3 class="hny-title text-center mb-0 ">Customers <span>Love</span></h3>
                <p class="mb-5 text-center">What People Say</p>
                <div class="row customerhny my-lg-5 my-4">
                    <div class="col-md-12">
                        <div id="customerhnyCarousel" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">
                                <li data-target="#customerhnyCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#customerhnyCarousel" data-slide-to="1"></li>
                            </ol>
                            <!-- Carousel items -->
                            <div class="carousel-inner">

                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c1.jpg" class="img-fluid" alt="">
                                                    <h5>Smith Roy</h5>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c2.jpg" class="img-fluid" alt="">
                                                    <h5>Lora Grill</h5>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c3.jpg" class="img-fluid" alt="">
                                                    <h5>Laura Sten</h5>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c4.jpg" class="img-fluid" alt="">
                                                    <h5>John Lee</h5>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c4.jpg" class="img-fluid" alt="">
                                                    <h5>John Lee</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c3.jpg" class="img-fluid" alt="">
                                                    <h5>Laura Sten</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c1.jpg" class="img-fluid" alt="">
                                                    <h5>Smith Roy</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="customer-info text-center">
                                                <div class="feedback-hny">
                                                    <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="quote-left" class="svg-inline--fa fa-quote-left fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M464 256h-80v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8c-88.4 0-160 71.6-160 160v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48zm-288 0H96v-64c0-35.3 28.7-64 64-64h8c13.3 0 24-10.7 24-24V56c0-13.3-10.7-24-24-24h-8C71.6 32 0 103.6 0 192v240c0 26.5 21.5 48 48 48h128c26.5 0 48-21.5 48-48V304c0-26.5-21.5-48-48-48z"></path></svg>
                                                    <p class="feedback-para">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Labore rem, dicta assumenda mollitia molestias quas nihil quasis.</p>
                                                </div>
                                                <div class="feedback-review mt-4">
                                                    <img src="${url }/images/c2.jpg" class="img-fluid" alt="">
                                                    <h5>Lora Grill</h5>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->

                            </div>
                            <!--.carousel-inner-->
                        </div>
                        <!--.Carousel-->

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //customers-->
    <section class="w3l-subscription-6">
        <!--/customers -->
        <div class="subscription-infhny">
            <div class="container-fluid">

                <div class="subscription-grids row">

                    <div class="subscription-right form-right-inf col-lg-6 p-md-5 p-4">
                        <div class="p-lg-5 py-md-0 py-3">
                            <h3 class="hny-title">Join us for FREE to get instant <span>email updates!</span></h3>
                            <p>Subscribe and get notified at first on the latest update and offers!</p>

                            <form action="#" method="post" class="signin-form mt-lg-5 mt-4">
                                <div class="forms-gds">
                                    <div class="form-input">
                                        <input type="email" name="" placeholder="Your email here" required="">
                                    </div>
                                    <div class="form-input"><button class="btn">Join</button></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="subscription-left forms-25-info col-lg-6 ">

                    </div>
                </div>

                <!--//customers -->
            </div>
    </section>
    <!-- //customers-6-->


    <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
    <%@include file="/WEB-INF/views/user/include/modal.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <script src="${url}/js/jquery-3.3.1.min.js"></script>
	<script src="${url}/js/jquery-2.1.4.min.js"></script>
	<script src="${url}/js/minicart.js"></script>
	<script src="${url}/js/jquery.magnific-popup.js"></script>
	<script src="${url}/js/bootstrap.min.js"></script>
	<script src="${url}/js/main.js"></script>
	
</body>

</html>
