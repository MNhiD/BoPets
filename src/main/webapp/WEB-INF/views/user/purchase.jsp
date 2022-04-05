<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"  %>
<c:url value="/resources/user/assets" var="url"></c:url>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Title</title>
    <link href="${url }/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${url }/css/common.css">
    <link rel="stylesheet" href="${url }/css/list-product.css">
    <link rel="stylesheet" href="${url }/css/purchase.css">
    <link rel="stylesheet" href="${url }/css/style-liberty.css">
</head>
<body>
   <section class="w3l-banner-slider-main inner-pagehny">
        <div class="breadcrumb-infhny">
            <div class="top-header-content">

                <%@include file="/WEB-INF/views/user/include/navbar.jsp"%>
                <div class="breadcrumb-contentnhy">
                    <div class="container">
                        <nav aria-label="breadcrumb">
                            <h2 class="hny-title text-center">Shopping Cart</h2>
                            <ol class="breadcrumb mb-0">
                                <li><a href="index.html">Home</a>
                                    <ion-icon class="path-icon" name="chevron-forward-outline"></ion-icon></li>
                                <li class="active">Cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
	<!-- tabs -->

    <div class="page-breadcrumb">
        <div class="row align-items-center">
            <div class="col-5">
                <h4 class="page-title">Đơn hàng của tôi</h4>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="tabs">
            <div class="tab-item active"><span>Tất cả</span></div>
            <div class="tab-item"><span>Chờ xác nhận</span></div>
            <div class="tab-item"><span>Đang giao hàng</span></div>
            <div class="tab-item"><span>Đã hủy</span></div>
            <div class="line"></div>
        </div>

        <div class="table-content">
            <div class="tab-pane active">
                <div class="all-orders">
                    <h4>Danh sách đơn hàng</h4>
                    <table class="order-table" id="order-table">
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Mã khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng thanh toán</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái đơn hàng</th>
                                <th>Trạng thái thanh toán</th>
                                <th>Ghi chú</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${listAll }">                      
                            <tr>                            
                                <td>${list.sellID }</td>
                                <td>${list.customerID }</td>
                                <td>${list.orderDate }</td>
                                <td><f:formatNumber value="${list.totalMoney }" pattern="##,###,###.0"></f:formatNumber></td>
                                <td>${list.address }</td>
                                <c:if test="${list.status=='pending' }">
                                	<td>Chờ phê duyệt</td>
                                </c:if>
                                <c:if test="${list.status=='delivery' }">
                                	<td>Đang giao hàng</td>
                                </c:if>
                                <c:if test="${list.status=='success' }">
                                	<td>Thành công</td>
                                </c:if>
                                <c:if test="${list.status=='cancel' }">
                                	<td>Đã hủy</td>
                                </c:if>
                                <c:if test="${list.paidStatus == true }">
                                	<td>Đã thanh toán</td>
                                </c:if>
                                <c:if test="${list.paidStatus == false }">
                                	<td>Thanh toán khi nhận hàng</td>
                                </c:if>
                                <td>${list.note }</td>
                                <td><a href="${list.sellID}.htm?linkDetails" class="btn btn-details"><ion-icon name="information-circle-outline"></ion-icon></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- <div class="pagination">
                        <a href="#"><ion-icon name="arrow-back-outline"></ion-icon></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><ion-icon name="arrow-forward-outline"></ion-icon></a>
                    </div> -->
                </div>
            </div>

            <div class="tab-pane ">
                <div class="all-orders">
                    <h4>Đơn hàng chờ duyệt</h4>
                    <table class="order-table" id="order-table">
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Mã khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng thanh toán</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái đơn hàng</th>
                                <th>Trạng thái thanh toán</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="listP" items="${listStatus }">                      
                            <tr>                            
                                <td>${listP.sellID }</td>
                                <td>${listP.customerID }</td>
                                <td>${listP.orderDate }</td>
                                <td>${listP.totalMoney }</td>
                                <td>${listP.address }</td>
                                <c:if test="${listP.status=='pending' }">
                                	<td>Chờ phê duyệt</td>
                                </c:if>
                                <c:if test="${listP.status=='delivery' }">
                                	<td>Đang giao hàng</td>
                                </c:if>
                                <c:if test="${listP.status=='success' }">
                                	<td>Thành công</td>
                                </c:if>
                                <c:if test="${listP.status=='cancel' }">
                                	<td>Đã hủy</td>
                                </c:if>
                                <c:if test="${listP.paidStatus == true }">
                                	<td>Đã thanh toán</td>
                                </c:if>
                                <c:if test="${listP.paidStatus == false }">
                                	<td>Thanh toán khi nhận hàng</td>
                                </c:if>
                                <td>${listP.note }</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- <div class="pagination">
                        <a href="#"><ion-icon name="arrow-back-outline"></ion-icon></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><ion-icon name="arrow-forward-outline"></ion-icon></a>
                    </div> -->
                </div>
            </div>
            <div class="tab-pane ">
                <div class="all-orders">
                    <h4>Đơn đang giao</h4>
                    <table class="order-table" id="order-table">
                        <thead>
                            <tr>

                                <th>Mã đơn</th>
                                <th>Mã khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng thanh toán</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái đơn hàng</th>
                                <th>Trạng thái thanh toán</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
								<c:forEach var="listD" items="${listShipping }">
		                            <tr>
		                                <td>${listD.sellID }</td>
		                                <td>${listD.customerID }</td>
		                                <td>${listD.orderDate }</td>
		                                <td>${listD.totalMoney }</td>
		                                <td>${listD.address }</td>
		                                <c:if test="${listD.status=='pending' }">
		                                	<td>Chờ phê duyệt</td>
			                                </c:if>
			                                <c:if test="${listD.status=='delivery' }">
			                                	<td>Đang giao hàng</td>
			                                </c:if>
			                                <c:if test="${listD.status=='success' }">
			                                	<td>Thành công</td>
			                                </c:if>
			                                <c:if test="${listD.status=='cancel' }">
			                                	<td>Đã hủy</td>
	                                	</c:if>
		                                <c:if test="${listP.paidStatus == true }">
                                			<td>Đã thanh toán</td>
                                		</c:if>
                                		<c:if test="${listP.paidStatus == false }">
                                			<td>Thanh toán khi nhận hàng</td>
                                		</c:if>
		                                <td>
		                                    <button class="btn btn-confirm">Đã nhận hàng</button>
		                                </td>
		                            </tr>
								</c:forEach>
                        </tbody>
                    </table>
                    <!-- <div class="pagination">
                        <a href="#"><ion-icon name="arrow-back-outline"></ion-icon></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><ion-icon name="arrow-forward-outline"></ion-icon></a>
                    </div> -->
                </div>
            </div>
            <div class="tab-pane ">
                <div class="all-orders">
                    <h4>Đơn đã hủy</h4>
                    <table class="order-table" id="order-table">
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Mã khách hàng</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tổng thanh toán</th>
                                <th>Địa chỉ</th>
                                <th>Trạng thái đơn hàng</th>
                                <th>Trạng thái thanh toán</th>
                                <th>Ghi chú</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="listCancel" items="${listCancel }">
                            <tr>
                                <td>${listCancel.sellID }</td>
                                <td>${listCancel.customerID }</td>
                                <td>${listCancel.orderDate }</td>
                                <td>${listCancel.totalMoney }</td>
                                <td class="column-address">${listCancel.address }</td>
                                <c:if test="${listCancel.status=='pending' }">
                                	<td>Chờ phê duyệt</td>
                                </c:if>
                                <c:if test="${listCancel.status=='delivery' }">
                                	<td>Đang giao hàng</td>
                                </c:if>
                                <c:if test="${listCancel.status=='success' }">
                                	<td>Thành công</td>
                                </c:if>
                                <c:if test="${listCancel.status=='cancel' }">
                                	<td>Đã hủy</td>
                                </c:if>
                                <c:if test="${listCancel.paidStatus == true }">
                            		<td>Đã thanh toán</td>
                                </c:if>
                                <c:if test="${listCancel.paidStatus == false }">
                                	<td>Thanh toán khi nhận hàng</td>
                             	</c:if>
                                <td></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- <div class="pagination">
                        <a href="#"><ion-icon name="arrow-back-outline"></ion-icon></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><ion-icon name="arrow-forward-outline"></ion-icon></a>
                    </div> -->
                </div>
            </div>
        </div>
        <h4 class="page-details">Chi tiết đơn hàng</h4>
        <table class="order-table details-table" id="order-table">
                        <thead>
                            <tr>
                                <th>Mã đơn</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá tiền</th>
                                <th>Tổng</th>                         
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" items="${listDetails }">                      
                            <tr>                            
                                <td>${list.sellID }</td>
                                <td>${list.productID }</td>
                                <td>${list.name }</td>
                                <td>${list.amount }</td>
                                <td>${list.price }</td>
                                <td>${list.price * list.amount}</td>                                
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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