<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@include file="/WEB-INF/views/admin/include/header.jsp"%>
		<%@ taglib prefix="tg" tagdir="/WEB-INF/tags/"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
        <%@include file="/WEB-INF/views/admin/include/navbar.jsp"%>

        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="tabs">
                    <div class="tab-item active"><span>Sản phẩm</span></div>
                    <div class="line"></div>
                </div>

                <div class="table-content">
                    <div class="tab-pane active">
                        <div class="form-details">
                            <h2>Thông tin chi tiết</h2>
                            <form action="product.htm" method="post">
                                <div class="list-row">
                                    <div class=" add-item add-id">
                                        <label for="id" class="product-id">Mã sản phẩm</label>
                                        <c:if test="${listP==null }">
                                        <input class="add-form-input" value="${pid }" type="text" name="productId" id="id" disabled>
                                        </c:if>
                                        <c:if test="${listP!=null }">
                                        <input class="add-form-input" value="${listP.productId }" type="text" name="productId" id="productId"  readonly="readonly">
                                        </c:if>
                                    </div>
                                    <div class=" add-item add-name">
                                        <label for="name" class="product-name">Tên sản phẩm</label>
                                        <c:if test="${listP==null }">
                                        
                                        	<input class="add-form-input" type="text" minlength="10" name="name" id="name" placeholder="Nhập tên sản phẩm" required>
                                        </c:if>
                                        <c:if test="${listP != null }">
                                        	<input class="add-form-input" value="${listP.name }" type="text" minlength="10" name="name" id="name" placeholder="Nhập tên sản phẩm" required>
                                        </c:if>
                                        
                                    </div>
                                    <div class=" add-item add-price">
                                        <label for="price" class="product-price">Giá bán</label>
                                        <c:if test="${listP==null }">
                                        	<input class="add-form-input" type="number" name="price" id="price" placeholder="Nhập giá bán" min="1" required>
                                        </c:if>
                                        <c:if test="${listP!=null }">
                                        	<input class="add-form-input" value="${listP.price }" type="number" name="price" id="price" placeholder="Nhập giá bán" min="1" required>
                                        </c:if>
                                    </div>
                                    <div class=" add-item add-cost">
                                        <label for="cost" class="product-cost">Giá gốc</label>
                                        <c:if test="${listP==null }">
                                        
                                        	<input class="add-form-input" type="number" min="0" name="cost" id="cost" placeholder="Nhập giá gốc" required>
                                        </c:if>
                                        <c:if test="${listP!=null }">
                                        
                                        	<input class="add-form-input" value="${listP.cost }" type="number" min="0" name="cost" id="cost" placeholder="Nhập giá gốc" required>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="list-row">
                                    <div class=" add-item add-amount">
                                        <label for="amount" class="product-amount">Số lượng</label>
                                        <c:if test="${listP==null }">
                                        	<input class="add-form-input" type="number" min="1" name="amount" id="amount" placeholder="Nhập số lượng" required>
                                        
                                        </c:if>
                                        <c:if test="${listP!=null }">
                                        	<input class="add-form-input" type="number" value="${listP.amount }" min="1" name="amount" id="amount" placeholder="Nhập số lượng" required>
                                        
                                        </c:if>
                                    </div>
                                    <div class=" add-item add-categories">
                                        <label for="categories" class="product-categories">Danh mục</label>
                                        	<c:if test="${listP !=null}">
                                        		<select name="categories" id="categories"  required> 	                                     
	                                        		<c:forEach var="cate" items="${cates }">
	                                        			<c:if test="${cate.categoryId==listP.categories.categoryId }">
	                                        			
			                                            <option value="${cate.categoryId }" selected>${cate.name }</option>                                       
	                                        			</c:if>
	                                        			<c:if test="${cate.categoryId != listP.categories.categoryId }">
	                                        				<option value="${cate.categoryId }">${cate.name }</option>
	                                        			</c:if>
			                                        </c:forEach>
                                        		</select>
                                        	</c:if>
                                        	<c:if test="${listP == null }">
	                                        		<select name="categories" id="categories"  required> 
		                                            <option value=""  disabled selected>Danh mục</option>
			                                        <c:forEach var="cate" items="${cates }">
			                                            <option value="${cate.categoryId }">${cate.name }</option>                                       
			                                        </c:forEach>
		                                        </select>
                                        	</c:if>
                                       
                                    </div>
                                    <div class=" add-item add-state">
                                        <label for="state" class="product-state">Trạng thái</label>
                                        <c:if test="${listP==null }">
                                        	<input class="add-form-input" type="text" name="status" id="state" value="Còn hàng" readonly="true">
                                        </c:if>
                                        <c:if test="${listP!=null }">
                                        	<input class="add-form-input" type="text" name="status" id="state" value="${listP.status }" readonly="true">
                                        </c:if>
                                    </div>
                                    <div class=" add-item add-img">
                                        <label for="image-file" class="product-image">Hình ảnh</label>
                                        <div class="choose-img">
                                        
                                            <c:if test="${listP==null }">
	                                            <input class="add-form-input" type="file" name="image" hidden="hidden" id="image-file">
	                                            <button type="button" id="custom-button">Chọn tệp</button>
	                                            <span  id="custom-text">No file chosen, yet.</span>
                                            	
                                            </c:if>
                                            <c:if test="${listP!=null }">
                                				<input class="add-form-input" type="file"  hidden="hidden" id="image-file">
	                                            <button  type="button" id="custom-button">Chọn tệp</button>
	                                            <span  id="custom-text" >${listP.image } </span>                                     
                                        	</c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-row">
                                    <div class=" add-item add-desc">
                                        <label for="desc" class="product-desc">Mô tả</label>
                                        <c:if test="${listP ==null }">
                                        	<textarea  name="desc" id="desc" cols="30" rows="10" placeholder="Mô tả sản phẩm"></textarea>
                                        </c:if>
                                        <c:if test="${listP !=null }">
                                        	<textarea name="desc" id="desc" cols="30" rows="10" placeholder="Mô tả sản phẩm">${listP.description }</textarea>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="products-details">
                                    <h3>Chi tiết sản phẩm</h3>
                                    <div class="add-details">
                                        <div class="add-details-item add-brand">
                                            <label for="brand">*Thương hiệu</label>
                                            <c:if test="${proDetails.brand ==null }">
                                            
	                                            <input class="add-form-input"  name="brand" type="text" id="brand" required placeholder="Thương hiệu" readonly="false">
                                            </c:if>
                                            <c:if test="${proDetails.brand !=null }">
												<input class="add-form-input" value="${proDetails.brand }" name="brand" type="text" id="brand" required placeholder="Thương hiệu" readonly="false">
                                            </c:if>
                                        </div>
                                        <div class="add-details-item add-weight">
                                            <label for="weight">Trọng lượng</label>
                                            <c:if test="${proDetails.weight==null }">
                                            	<input class="add-form-input"  name = "weight" type="text" id="weight" placeholder="Trọng lượng" readonly="false">
                                            </c:if>
                                            <c:if test="${proDetails.weight!=null }">
                                            	<input class="add-form-input" value="${proDetails.weight }" name = "weight" type="text" id="weight" placeholder="Trọng lượng" readonly="false">
                                            </c:if>
                                        </div>
                                        <div class="add-details-item add-exp">
                                            <label for="exp">Hạn sử dụng</label>
                                            <c:if test="${proDetails.expDate==null }">
                                            <input class="add-form-input" name="expDate" type="date" id="exp" readonly="false">
                                            </c:if>
                                            <c:if test="${proDetails.expDate!=null }">
                                            <input class="add-form-input" value="${proDetails.expDate }" name="expDate" type="date" id="exp"  readonly="false" >
                                            </c:if>
                                        </div>
                                        <div class="add-details-item add-fabric">
                                            <label for="fabric">Chất liệu</label>
                                            <c:if test="${proDetails.material==null }">
                                            <input class="add-form-input" name="fabric" type="text" id="fabric" placeholder="Chất liệu" readonly="false">
                                            </c:if>
                                            <c:if test="${proDetails.material!=null }">
                                            <input class="add-form-input" value="${proDetails.material }" name="fabric" type="text" id="fabric" placeholder="Chất liệu" readonly="false">
                                            </c:if>
                                        </div>
                                        <div class="add-details-item add-volumn">
                                            <label for="volume">Thể tích</label>
                                             <c:if test="${proDetails.volume==null }">
                                            <input class="add-form-input"  name="volume" type="text" id="volume" placeholder="Thể tích" readonly="false">
                                             </c:if>
                                              <c:if test="${proDetails.volume!=null }">
                                            <input class="add-form-input" value="${proDetails.volume }" name="volume" type="text" id="volume" placeholder="Thể tích" readonly="false">
                                             </c:if>
                                        </div>
                                        <div class="add-details-item add-type">
                                            <label for="type" class="product-type">Phân loại</label>
                                            <c:if test="${proDetails.classify==null }">
                                            
                                            <input class="add-form-input"  name="classify" type="text" name="" id="type" placeholder="Màu sắc, hương vị..." readonly="false">
                                            </c:if>
                                            <c:if test="${proDetails.classify!=null }">
                                            
                                            <input class="add-form-input" value="${proDetails.classify }" name="classify" type="text" name="" id="type" placeholder="Màu sắc, hương vị..." readonly="false">
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="edit-products">
                                   <c:if test="${listP == null }">
                                   		 <button type="submit" class="btn btn-add-product">Thêm</button>
                                   </c:if>
                                   <c:if test="${listP != null }">
                                   
	                                    <button name="btnEdit" class="btn btn-edit">Cập Nhật</button>
                                   </c:if>
                                    <!-- <button id="btnReset" class="btn btn-clear">Nhập Lại</button> -->
                                </div>
                            </form>
                        </div>
                        <div class="tab-header">
                            <h2>Tìm kiếm</h2>
                            <div class="tab-search">
                            <form action="filter-by-keyword.htm" method="post">
                            
                                <input class="search-product" name="key" type="text" placeholder="Nhập mã sản phẩm hoặc tên sản phẩm">
                            </form>
                                <%-- <select name="tab-categories" id="tab-categories">
                                    <option value=""  disabled selected>Danh mục</option>
                                    <c:forEach var="cate" items="${cates }">
                                            <option value="${cate.categoryId }">${cate.name }</option>                                       
                                    </c:forEach>
                                </select> --%>
                                <div class="tab-icon"><i class=" mdi mdi-search-web"></i></div>
                            </div>
                        </div>
                        <div class="tab-table">
                            <h2>Danh sách sản phẩm</h2>
                            <table class="product-table" id="table">
                                <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá</th>
                                        <th>Danh mục</th>
                                        <th>Trạng thái</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="pg" items="${pagedListHolder.pageList }">

                                    <tr>
                                        <td>${pg.productId }</td>
                                        <td>${pg.name }</td>
                                        <td>${pg.amount }</td>
                                        <td>${pg.price }</td>
                                        <td>${pg.categories.name }</td>
                                        <td>${pg.status }</td>
                                        <td>
                                            <a href="${pg.productId}.htm?linkEdit" class="btn btn-update "><i class="mdi mdi-account-edit"></i></a>
                                            <a href="${pg.productId }.htm?linkDel" class="btn  btn-delete"><i class="mdi mdi-delete-forever"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                    
                                </tbody>
                            </table>
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
                </div>
		 <%@include file="/WEB-INF/views/admin/include/footer.jsp"%>
		     <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="${url }/js/app-style-switcher.js"></script>
        <script src="${url }/js/waves.js"></script>
        <script src="${url }/js/product.js"></script>
 
</body>

</html>