<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/admin.htm"> 
                        <div class="logo-img"></div>
                        <span class="logo-text">
                           <span class="brand-text" href="${pageContext.request.contextPath }/admin.htm">
                                Bo<span class="lohny">P</span>ets</a>
                    		</span>
                   	</a>
                </div>
                <div class="navbar-collapse collapse navbar-search" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav float-start me-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="#"><i class="ti-search"></i></a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
                            </form>
                        </li>
                    </ul>
                    <ul class="navbar-nav float-end">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="${url }/images/1.jpg" alt="user" class="rounded-circle" width="31">
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end user-dd animated" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#"><i class="ti-user m-r-5 m-l-5"></i>
                                    My Profile</a>
                                <a class="dropdown-item" href="#"><i class="ti-wallet m-r-5 m-l-5"></i>
                                    My Balance</a>
                                <a class="dropdown-item" href="#"><i class="ti-email m-r-5 m-l-5"></i>
                                    Inbox</a>
                                <a class="dropdown-item" href="#"><i class="ti-settings m-r-5 m-l-5"></i>
                                     Account Setting</a>
                                <a class="dropdown-item" href="admin-logout.htm"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath }/admin.htm" aria-expanded="false"><i class="mdi mdi-home"></i><span
                                    class="hide-menu">Trang chủ</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath }/admin/order.htm" aria-expanded="false"><i class="fas fa-shopping-cart"></i><span
                                    class="hide-menu">Đơn hàng</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="${pageContext.request.contextPath }/admin/product.htm" aria-expanded="false"><i class="fas fa-paw"></i><span
                                    class="hide-menu">Sản phẩm</span></a></li>

                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>