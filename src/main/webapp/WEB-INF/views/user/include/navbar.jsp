<%@ page pageEncoding="utf-8"%>
<header class="tophny-header">
                <div class="container-fluid">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="container-fluid serarc-fluid">
                            <div class="nav-brand">
                                <a href="${pageContext.request.contextPath }/user.htm" class="navbar-brand">
                                </a>
                            </div>
                            <div class="search-right">
                                <div class="search-content"><ion-icon class="mr-2" name="search-outline"></ion-icon>
                                    <form action="${pageContext.request.contextPath }/search-by-keywords.htm" method="post">
                                    	<input autocomplete="off" name="key" type="text" class="search-text" placeholder="Tìm kiếm sản phẩm...">
                                   	</form>
                                </div>
                            </div>
                            <!--//search-right-->
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon fa fa-bars"> </span>
							</button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${pageContext.request.contextPath }/user.htm">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                        <div class="item-header">
                                            <a class="nav-link" href="#">Thú cưng</a>                                 
                                            <ion-icon class="nav-link-icon" name="chevron-down-outline"></ion-icon>
                                        </div>
                                        <!-- menu Details -->
                                        <div class="item-content menu-details">
                                            <div class="menu-pet-img">
                                                <img src="https://chopet.vn/static/media/dog.8d179361.gif" alt="Dog pet" style="width: 240px;
                                            height: 240px;">
                                            </div>
                                            <ul class="menu-type">
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-menu-dog.htm" class="pet-item-link">Chó</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-dog-corgi.htm" class="pet-item-link">Chó Corgi</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-dog-bug.htm" class="pet-item-link">Chó Bug</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-dog-husky.htm" class="pet-item-link">Chó Husky - Alaska - Samoyed</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-dog-shiba.htm" class="pet-item-link">Chó Shiba</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-dog-golden.htm" class="pet-item-link">Chó Golden - Labrador</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-food.htm" class="pet-item-link">Thức ăn cho cún</a>
                                                </li>
                                            </ul>
                                            <div class="menu-pet-img">
                                                <img src="https://chopet.vn/static/media/cat.862fddc4.gif" alt="Cat-pet" style="width: 240px;
                                            height: 240px;">

                                            </div>
                                            <ul class="menu-type">
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat.htm" class="pet-item-link">Mèo</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat-british.htm" class="pet-item-link">Mèo Anh lông dài</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat-ragdoll.htm" class="pet-item-link">Mèo Ragdoll</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat-sphynx.htm" class="pet-item-link">Mèo Sphynx</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat-munchkin.htm" class="pet-item-link">Mèo Munchkin</a>
                                                </li>
                                                <li class="pet-item">
                                                    <a href="${pageContext.request.contextPath }/search-cat-food.htm" class="pet-item-link">Thức ăn cho mèo</a>
                                                </li>
                                            </ul>

                                        </div>
                                        <!-- end menu  -->
                                    </li>

                                    <li class="nav-item">
                                        <div class="item-header">
                                            <a class="nav-link" href="#">Dịch vụ</a>
                                            <ion-icon class="nav-link-icon" name="chevron-down-outline"></ion-icon>
                                            <!-- <i class=" nav-link-icon fa fa-chevron-down"></i> -->
                                        </div>
                                        <div class="item-content service-pet">
                                            <div class="service-img">
                                                <img src="${url }/images/cat.png" alt="Dịch vụ" style="width: 360px;">
                                            </div>
                                            <ul class="service-list-col-1">
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Cắt tỉa lông</a>
                                                </li>
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Tắm & Spa</a>
                                                </li>
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Nhuộm lông</a>
                                                </li>
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Khách sạn thú cưng</a>
                                                </li>
                                            </ul>
                                            <ul class="service-list-col-2">
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Chăm sóc sức khỏe</a>
                                                </li>
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/search-phukien.htm" class="service-item-link">Phụ kiện</a>
                                                </li>
                                                <li class="service-list-item">
                                                    <a href="${pageContext.request.contextPath }/list-product.htm" class="service-item-link">Đào tạo học viên</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="${pageContext.request.contextPath }/contact.htm">Liên hệ</a>
                                    </li>
                                </ul>

                            </div>
                            <div class="top-right-strip row">
                                <ul class="top-hnt-right-content col-lg-6">

                                    <li class="button-log usernhy">
                                    <c:if test="${sessionScope.account != null}">
                                    
                                    	<div class="user-img"><img src="${url }/images/user.png" alt=""></div>
                                    	<!-- logged -->
                                        <ul class="user-list">
                                            <li class="account">
                                                <div class="user-link account-link ">
                                                    <ion-icon class="account-icon" name="settings-outline"></ion-icon>
                                                    <a href="${pageContext.request.contextPath }/account.htm" class="user-account">Tài khoản</a>
                                                </div>
                                            </li>
                                            <li class="purchase">
                                                <div class="user-link purchase-link">
                                                    <ion-icon class="purchase-icon" name="bag-check-outline"></ion-icon>
                                                    <a href="${pageContext.request.contextPath }/purchase.htm" class="user-purchase">Đơn mua</a>
                                                </div>
                                            </li>
                                            <li class="logout">
                                                <div class="user-link logout-link">
                                                    <ion-icon class="logout-icon" name="log-out-outline"></ion-icon>
                                                    <a href="${pageContext.request.contextPath }/user-logout.htm" class="user-logout">Đăng xuất</a>
                                                </div>
                                            </li>
                                        </ul>
                                        <!-- end logged -->
                                    </c:if>
                                    <c:if test = "${sessionScope.account == null }">
                                        <a class="btn-open" href="#">
                                            <ion-icon class="login-icon-user" name="person-circle-outline"></ion-icon>
                                        </a>
                                        <ul class="log-list">
                                            <li class="log-list-login">
                                                <a class="login-link js-click-login-del" href="${pageContext.request.contextPath }/user-login.htm">                                                  	
                                                    <ion-icon class="login-icon" name="person-circle-outline"></ion-icon>
                                                    <span class="user-login">Đăng nhập</span>
                                                </a>
                                            </li>
                                            <li class="log-list-register">
                                                <a class="register-link js-click-register-del" href="${pageContext.request.contextPath }/user-register.htm">
                                                    <!-- <i class="register-icon fa fa-user-plus"></i> -->
                                                    <ion-icon class="register-icon" name="person-add-outline"></ion-icon>
                                                    <span  class="user-register">Đăng ký</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </c:if>
                                        
                                    </li>
                                    <li class="transmitvcart galssescart2 cart cart box_1">
                                        <!-- <form action="#" method="post" class="last">
                                            <input type="hidden" name="cmd" value="_cart">
                                            <input type="hidden" name="display" value="1">
                                            <button class="top_transmitv_cart" type="submit" name="submit" value="">
										
											<ion-icon class="icon-cart" name="cart-outline"></ion-icon>
										</button>
                                        </form> -->                             
                                      		                                  		
                                        		<div class="amount-cart">${sessionScope.amountCart }</div> 
                                      		<a href="${pageContext.request.contextPath }/checkout.htm" class="cart-icon"><ion-icon class="icon-cart" name="cart-outline"></ion-icon></a>                                                  	

                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>