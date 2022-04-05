<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
        <%@include file="/WEB-INF/views/admin/include/navbar.jsp"%>
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Trang chủ</h4>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <%-- <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- title -->
                                <!-- <div class="d-md-flex">
                                    <div>
                                        <h4 class="card-title">SẢN PHẨM BÁN CHẠY</h4>
                                        <h5 class="card-subtitle">Overview of Top Selling Items</h5>
                                    </div>
                                    
                                </div>
                                title
                            </div>
                            <div class="table-responsive">
                                <table class="table v-middle">
                                    <thead>
                                        <tr class="bg-light">
                                        	<th class="border-top-0">Mã sản phẩm</th>
                                            <th class="border-top-0">Tên sản phẩm</th>
                                            <th class="border-top-0">Danh mục</th>
                                            <th class="border-top-0">Bán ra</th>
                                            <th class="border-top-0">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody> -->
                                    	<c:forEach var="s" items="${list}">
                                    		<tr>
												<td>${s.productID}</td>
												<td>${s.categories.name}</td>
												<td>${s.amount}</td>
												<td>${s.price}</td>
											</tr> 
                                    	</c:forEach>                   
                                    </tbody>                                                                                                        
                                </table>
                            </div>
                        </div>
                    </div>
                </div> --%>
                
           
          	<div class="container-fluid">
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- title -->
                                <div class="d-md-flex">
                                    <div>
                                        <h4 class="card-title">DOANH THU THEO DANH MỤC</h4>
                                    </div>                              
                                </div>
                                <!-- title -->
                            </div>
                            <div class="table-responsive">
                                <table class="table v-middle">
                                    <thead>
                                        <tr class="bg-light">
                                        	<th>Danh mục</th>
											<th>Số lượng</th>
											<th>Doanh thu</th>
											<th>Giá thấp nhất</th>
											<th>Giá cao nhất</th>
											<th>Giá trung bình</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach var="a" items="${dataC}">
											<tr>
												<td>${a[0]}</td>
												<td>${a[1]}</td>
												<td>${a[2]}</td>
												<td>${a[3]}</td>
												<td>${a[4]}</td>
												<td>${a[5]}</td>
											</tr>
										</c:forEach>
									</tbody>                                                                                                            
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                
       		<div class="container-fluid">
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- title -->
                                <div class="d-md-flex">
                                    <div>
                                        <h4 class="card-title">DOANH THU THEO THÁNG</h4>
                                    </div>                              
                                </div>
                                <!-- title -->
                            </div>
                            <div class="table-responsive">
                                <table class="table v-middle">
                                    <thead>
                                        <tr class="bg-light">
                                        	<th>Tháng</th>
											<th>Số lượng</th>
											<th>Doanh thu</th>
											<th>Giá thấp nhất</th>
											<th>Giá cao nhất</th>
											<th>Giá trung bình</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<c:forEach var="a" items="${dataM}">
											<tr>
												<td>${a[0]}</td>
												<td>${a[1]}</td>
												<td>${a[2]}</td>
												<td>${a[3]}</td>
												<td>${a[4]}</td>
												<td>${a[5]}</td>
											</tr>
										</c:forEach>
									</tbody>                                                                                                            
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                
			
                <%-- <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Recent Comments</h4>
                            </div>
                            <div class="comment-widgets scrollable">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="${url }/images/1.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">James Anderson</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing
                                            and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-end">April 14, 2021</span> <span class="label label-rounded label-primary">Pending</span> <span class="action-icons">
                                                <a href="#"><i class="ti-pencil-alt"></i></a>
                                                <a href="#"><i class="ti-check"></i></a>
                                                <a href="#"><i class="ti-heart"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="${url }/images/1.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium">Michael Jorden</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing
                                            and type setting industry. </span>
                                        <div class="comment-footer ">
                                            <span class="text-muted float-end">April 14, 2021</span>
                                            <span class="label label-success label-rounded">Approved</span>
                                            <span class="action-icons active">
                                                <a href="#"><i class="ti-pencil-alt"></i></a>
                                                <a href="#"><i class="icon-close"></i></a>
                                                <a href="#"><i class="ti-heart text-danger"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="${url }/images/1.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">Johnathan Doeting</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing
                                            and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-end">April 14, 2021</span>
                                            <span class="label label-rounded label-danger">Rejected</span>
                                            <span class="action-icons">
                                                <a href="#"><i class="ti-pencil-alt"></i></a>
                                                <a href="#"><i class="ti-check"></i></a>
                                                <a href="#"><i class="ti-heart"></i></a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- column -->
                </div> --%>
            </div>
            <%@include file="/WEB-INF/views/admin/include/footer.jsp"%>			    
          </body>
</html>