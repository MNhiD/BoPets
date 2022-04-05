<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
        <%@include file="/WEB-INF/views/admin/include/navbar.jsp"%>
        <div class="page-wrapper">

            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Đơn hàng</h4>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="tabs">
                    <div class="tab-item active"><span>Tất cả</span></div>
                    <div class="tab-item"><span>Chờ phê duyệt</span></div>
                    <div class="tab-item"><span>Đang giao</span></div>
                    <div class="tab-item"><span>Đã giao</span></div>
                    <div class="tab-item"><span>Đã hủy</span></div>
                    <div class="line"></div>
                </div>

                <div class="table-content">
                    <div class="tab-pane active">

						<!-- DS tất cả đơn hàng -->
                        <div class="all-orders">
                            <h3>Danh sách đơn hàng</h3>
                            <table class="order-table" id="order-table">
                                <thead>
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Mã khách hàng</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th>Hình thức thanh toán</th>
                                        <th>Địa chỉ</th>
                                        <th>Ghi chú</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="s" items="${list}">
	                                    <tr>
	                                        <td class="sell-code-all">${s.sellID}</td>
	                                        <td>${s.customerID}</td>
	                                        <td><f:formatNumber value="${s.totalMoney}" pattern="##,###,###.0"></f:formatNumber></td>
	                                        <c:if test="${s.status=='pending' }">
	                                        	<td class="sell-status-all">Chờ phê duyệt</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='success' }">
	                                        	<td class="sell-status-all">Đã giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='cancel' }">
	                                        	<td class="sell-status-all">Đã hủy</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='delivery' }">
	                                        	<td class="sell-status-all">Đang giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==false }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==true }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        
	                                        <td>${s.address}</td>
	                                        <td>${s.note}</td>
	                                        <td class ="status">
	                                        	<a href="${s.sellID }.htm?linkConfirm" class="btn btn-confirm"><i class="mdi mdi-check"></i></a>
	                                            <button class="btn btn-info"><i class="mdi mdi-information-outline"></i></button>
	                                            <a href="${s.sellID }.htm?linkCancel" class="btn btn-cancel" ><i class="mdi mdi-close"></i></a>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <a href="#"><i class="mdi mdi-arrow-left"></i></a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="mdi mdi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
				

					<!-- DS đơn hàng chờ phê duyệt -->
                    <div class="tab-pane ">
                        <div class="all-orders">
                            <h3>Danh sách đơn hàng</h3>
                            <table class="order-table" id="order-table">
                                <thead>
                                    <tr>
                                      
                                        <th>Mã đơn</th>
                                        <th>Mã khách hàng</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th>Hình thức thanh toán</th>
                                        <th>Địa chỉ</th>
                                        <th>Ghi chú</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="s" items="${listPending}">
	                                    <tr>
	                                     
	                                        <td>${s.sellID}</td>
	                                        <td>${s.customerID}</td>
	                                        <td>${s.totalMoney}</td>
	                                       <c:if test="${s.status=='pending' }">
	                                        	<td class="sell-status-all">Chờ phê duyệt</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='success' }">
	                                        	<td class="sell-status-all">Đã giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='cancel' }">
	                                        	<td class="sell-status-all">Đã hủy</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='delivery' }">
	                                        	<td class="sell-status-all">Đang giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==false }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==true }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <td>${s.address}</td>
	                                        <td>${s.note}</td>
	                                        <td class ="status">
	                                        	<button class="btn btn-confirm" onclick="confirm_tr(this)"><i class="mdi mdi-check"></i></button>
	                                            <button class="btn btn-info"><i class="mdi mdi-information-outline"></i></button>
	                                            <button class="btn  btn-cancel" onclick="remove_tr(this)"><i class="mdi mdi-close"></i></button>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <a href="#"><i class="mdi mdi-arrow-left"></i></a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="mdi mdi-arrow-right"></i></a>
                            </div>
                         </div>
                    </div>
                    
                    <!-- DS đơn hàng đang giao -->
                    <div class="tab-pane ">
                        <div class="all-orders">
                            <h3>Danh sách đơn hàng</h3>
                            <table class="order-table" id="order-table">
                                <thead>
                                    <tr>
                                    
                                        <th>Mã đơn</th>
                                        <th>Mã khách hàng</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th>Hình thức thanh toán</th>
                                        <th>Địa chỉ</th>
                                        <th>Ghi chú</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="s" items="${listShipping}">
	                                    <tr>
	                                        
	                                        <td>${s.sellID}</td>
	                                        <td>${s.customerID}</td>
	                                        <td>${s.totalMoney}</td>
	                                        <c:if test="${s.status=='pending' }">
	                                        	<td class="sell-status-all">Chờ phê duyệt</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='success' }">
	                                        	<td class="sell-status-all">Đã giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='cancel' }">
	                                        	<td class="sell-status-all">Đã hủy</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='delivery' }">
	                                        	<td class="sell-status-all">Đang giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==false }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==true }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <td>${s.address}</td>
	                                        <td>${s.note}</td>
	                                        <td class ="status">
	                                        	
	                                            <button class="btn btn-info"><i class="mdi mdi-information-outline"></i></button>
	                                            
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <a href="#"><i class="mdi mdi-arrow-left"></i></a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="mdi mdi-arrow-right"></i></a>
                            </div>
                    	</div>
                    </div>
                    <!-- DS đơn hàng đã giao -->
                    <div class="tab-pane ">
                        <div class="all-orders">
                            <h3>Danh sách đơn hàng</h3>
                            <table class="order-table" id="order-table">
                                <thead>
                                    <tr>
                                      
                                        <th>Mã đơn</th>
                                        <th>Mã khách hàng</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th>Hình thức thanh toán</th>
                                        <th>Địa chỉ</th>
                                        <th>Ghi chú</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="s" items="${listSuccess}">
	                                    <tr>
	                                       
	                                        <td>${s.sellID}</td>
	                                        <td>${s.customerID}</td>
	                                        <td>${s.totalMoney}</td>
	                                        <c:if test="${s.status=='pending' }">
	                                        	<td class="sell-status-all">Chờ phê duyệt</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='success' }">
	                                        	<td class="sell-status-all">Đã giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='cancel' }">
	                                        	<td class="sell-status-all">Đã hủy</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='delivery' }">
	                                        	<td class="sell-status-all">Đang giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==false }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==true }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <td>${s.address}</td>
	                                        <td>${s.note}</td>
	                                        <td class ="status">
	                                        	
	                                            <button class="btn btn-info"><i class="mdi mdi-information-outline"></i></button>
	                                            
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <a href="#"><i class="mdi mdi-arrow-left"></i></a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="mdi mdi-arrow-right"></i></a>
                            </div>
                    	</div>
                   	</div> 
                    <!-- DS đơn hàng đã hủy -->
                    <div class="tab-pane ">
                        <div class="all-orders">
                            <h3>Danh sách đơn hàng</h3>
                            <table class="order-table" id="order-table">
                                <thead>
                                    <tr>
                                      
                                        <th>Mã đơn</th>
                                        <th>Mã khách hàng</th>
                                        <th>Tổng thanh toán</th>
                                        <th>Trạng thái</th>
                                        <th>Hình thức thanh toán</th>
                                        <th>Địa chỉ</th>
                                        <th>Ghi chú</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="s" items="${listCancel}">
	                                    <tr>
	                                       
	                                        <td>${s.sellID}</td>
	                                        <td>${s.customerID}</td>
	                                        <td>${s.totalMoney}</td>
	                                        <c:if test="${s.status=='pending' }">
	                                        	<td class="sell-status-all">Chờ phê duyệt</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='success' }">
	                                        	<td class="sell-status-all">Đã giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='cancel' }">
	                                        	<td class="sell-status-all">Đã hủy</td>
	                                        </c:if>
	                                        <c:if test="${s.status=='delivery' }">
	                                        	<td class="sell-status-all">Đang giao hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==false }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <c:if test="${s.paidStatus==true }">
	                                        	<td>Thanh toán khi nhận hàng</td>
	                                        </c:if>
	                                        <td>${s.address}</td>
	                                        <td>${s.note}</td>
	                                        <td class ="status">                                        
	                                        	
	                                            <button class="btn btn-info"><i class="mdi mdi-information-outline"></i></button>
	                                            
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <a href="#"><i class="mdi mdi-arrow-left"></i></a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#"><i class="mdi mdi-arrow-right"></i></a>
                            </div>
                    	</div>               
                	</div>
				</div>               	
            </div>

            <%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
		    <script src="${url}/js/order.js" type="text/javascript"></script>
		    <script src="${url}/js/app-style-switcher.js" type="text/javascript"></script>
		    <script src="${url}/js/waves.js" type="text/javascript"></script>
		    
		
		</body>
		
		</html>