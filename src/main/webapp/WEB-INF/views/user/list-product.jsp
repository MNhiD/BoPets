<%@ page pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/user/include/header.jsp"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
                                <li class="active">Shop</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
    <section class="w3l-ecommerce-main-inn">
        <!--/mag-content-->
        <div class="ecomrhny-content-inf py-5">
            <div class="container py-lg-5">
                <div style="margin: 8px auto; display: block; text-align:center;">


                </div>
                <!--/row1-->
                <div class="ecommerce-grids row">
                    <div class="ecommerce-left-hny col-lg-4">
                        <!--/ecommerce-left-hny-->
                        <aside>
                            <div class="sider-bar">
                                <div class="single-gd mb-5">

                                    <h4>Tìm <span>kiếm</span></h4>
                                    <form action="#" method="post" class="search-trans-form">
                                        <input class="form-control" type="search" name="search" placeholder="Tìm kiếm..." required="">
                                        <button class="btn read-2">
										<ion-icon class="search-icon" name="search"></ion-icon>
									</button>

                                    </form>
                                </div>
                                <!-- /Gallery-imgs -->

                                <div class="single-gd mb-5">
                                    <h4>Danh mục</h4>
                                    <ul class="list-group single">
	                                	<c:forEach var="ct" items="${cates }">
	                                		
	                                        <li class="list-group-item d-flex justify-content-between align-items-center">
	                                            <a href="#">${ct.name }</a>
	                                            <!-- <span class="badge badge-primary badge-pill">7</span> -->
	                                        </li>
	                                	</c:forEach>                                      
                                    </ul>
                                </div>                                
                                <div class="single-gd customer-rev left-side mb-5">
                                    <h4>Màu <span>Sắc</span></h4>

                                    <ul class="product-color">
                                        <li>
                                            <input type="checkbox" name="color-check" id="redcheck" checked="checked" />
                                            <label for="redcheck" style="background-color:red;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="color-check" id="#A2C2C9check" checked="checked" />
                                            <label for="#A2C2C9check" style="background-color:#A2C2C9;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="color-check" id="#EFDBD4check" checked="checked" />
                                            <label for="#EFDBD4check" style="background-color:#EFDBD4;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="color-check" id="#2196F3check" checked="checked" />
                                            <label for="#2196F3check" style="background-color:#2196F3;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="color-check" id="#4CAF50check" checked="checked" />
                                            <label for="#4CAF50check" style="background-color:#4CAF50;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" name="color-check" id="#00BCD4check" checked="checked" />
                                            <label for="#00BCD4check" style="background-color:#00BCD4;"><ion-icon class="check-color" name="checkmark"></ion-icon></label>
                                        </li>
                                    </ul>
                                </div>
                                <div class="single-gd left-side mb-5">
                                    <h4>Đánh giá</h4>
                                    <ul class="ratingshyny">
                                        <li>
                                            <a href="#">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <span>5.0</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <span>4.0</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-half"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <span>3.5</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <span>3.0</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-half"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <span>2.5</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="single-gd mb-5 border-0">
                                    <h4>Sản phẩm <span>mới</span></h4>
                                    	<c:forEach var="list" items="${pagedListHolder.pageList}" end="1">                                   	
                                    <div class="row special-sec1 mt-4">
	                                        <div class="col-4 img-deals">
	                                            <a href="${pageContext.request.contextPath }/details-product.htm"><img src="<c:url value='/images/${list.image }'/>" class="img-fluid" alt=""></a>
	                                        </div>
	                                        <div class="col-8 img-deal1">
	                                            <h5 class="post-title">
	                                                <a href="${pageContext.request.contextPath }/details-product.htm">${list.name }</a> </h5>
	
	                                            <a href="${pageContext.request.contextPath }/details-product.htm" class="price-right"><f:formatNumber value="${list.price }" pattern="##,###,###.0"></f:formatNumber></a>
	                                        </div>
                                    </div>                        
                                    	</c:forEach>
                                </div>
                            </div>
                        </aside>
                        <!--//ecommerce-left-hny-->
                    </div>
                    <div class="ecommerce-right-hny col-lg-8">
                        <div class="row ecomhny-topbar">
                            <div class="col-6 ecomhny-result">
                                <h4 class="ecomhny-result-count">Kết quả</h4>
                            </div>
                            <div class="col-6 ecomhny-topbar-ordering">

                                <%-- <div class="ecom-ordering-select d-flex">
                                    <ion-icon class="filter-icon" name="chevron-down-outline"></ion-icon>
                                    <select>
												<option value="menu_order" selected="selected">Lọc</option>
												<option value="popularity">Bán chạy</option>
												<option value="rating">Lượt đánh giá</option>
												<option value="date">Mới nhất</option>
												<li><a href="${pageContext.request.contextPath }/product/filterASC.htm">Giá thấp tới cao</a></li>
												<option value="price"><a href="${pageContext.request.contextPath }/product/filterASC.htm">Giá thấp tới cao</a></option>
												<option value="price-desc"><a href="${pageContext.request.contextPath }/product/filterDESC.htm">Giá cao tới thấp</a></option>
										</select> 
                                </div> --%>
                               <div class="ecom-ordering-select d-flex">
                               	
	                                <div class="dropdown">
									  <button class="nut_dropdown">Lọc</button>
									  <div class="noidung_dropdown">
									    <a href="#!">Bán chạy</a>
									    <a href="#!">Yêu thích</a>
									    <a href="#!">Mới nhất</a>
									    <a href="${pageContext.request.contextPath }/product/filterASC.htm">Giá thấp tới cao</a>
									    <a href="${pageContext.request.contextPath }/product/filterDESC.htm">Giá cao tới thấp</a>
									  </div>
									</div>
								</div>

                            </div>
                        </div>
                        <!-- /row-->
                        <div class="ecom-products-grids row">
                            <div class="product-incfhny mb-4">
                            	<%-- <c:forEach var="list" items="${listProduct }" end="8"> --%>
                            	<c:forEach var="pg" items="${pagedListHolder.pageList }">
                                <div class="product-grid2 transmitv">
                                    <div class="product-image2">
                                        <a href="${pageContext.request.contextPath }/details/${pg.productId }.htm">
                                            <img class="pic-1 img-fluid" src="<c:url value='/images/${pg.image}'/>">
                                            <img class="pic-2 img-fluid" src="<c:url value='/images/${pg.image}'/>">
                                        </a>
                                        <ul class="social">
                                            <li><a href="${pageContext.request.contextPath }/details/${pg.productId }.htm" data-tip="Quick View"><ion-icon name="eye-sharp"></ion-icon></a></li>

                                            <li><a href="${pageContext.request.contextPath }/details/${pg.productId }.htm" data-tip="Add to Cart"><ion-icon name="bag-handle-sharp"></ion-icon></a>
                                            </li>
                                        </ul>
                                        <div data-id="${pg.productId }" class="transmitv single-item">
                                            <form action="#" method="post">
                                                <input type="hidden" name="cmd" value="_cart">
                                                <input type="hidden" name="add" value="1">
                                                <input type="hidden" name="transmitv_item" value="${pg.name }">
                                                <input type="hidden" name="amount" value="${pg.price }">
                                                <button type="submit" class="transmitv-cart ptransmitv-cart add-to-cart">
												Add to Cart
											</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h3 class="title"><a href="${pageContext.request.contextPath }/details-product.htm">${pg.name }</a>
                                        </h3>
                                        <span class="price"><del>đ0</del>đ<f:formatNumber value="${pg.price }" pattern="##,###,###.0"></f:formatNumber></span>
                                    </div>
                                </div>
                            	</c:forEach>
                            </div>               
                        </div>
                    </div>
                </div>
                <!--//row1-->
				 <!-- PAGING -->
				 	<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder" />
						<c:url value="" var="pagedLink">
							<c:param name="p" value="~" />
						</c:url>
					<div class="pagination">
						<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
					</div>
				 <!--end  -->
                

            </div>
        </div>
        <!--//mag-content-->
    </section>
    <div style="margin: 8px auto; display: block; text-align:center;">
    </div>
    <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
    <div id="v-w3layouts"></div>
    <%@include file="/WEB-INF/views/user/include/modal.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${url }/js/jquery-3.3.1.min.js"></script>
	<script src="${url }/js/jquery-2.1.4.min.js"></script>
	<script src="${url }/js/minicart.js"></script>
	<script src="${url }/js/jquery-ui.js"></script>
	<script src="${url }/js/bootstrap.min.js"></script>
	<script src="${url }/js/main.js"></script>
</body>

</html>
