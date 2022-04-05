<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/user/assets" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Title</title>
<link rel="stylesheet" href="${url }/css/order.css">
</head>
<body>
	<div class="container">
        <div class="title">
            <h2>Thanh Toán</h2>
            <a href="checkout.htm" class="order-close">
                <ion-icon name="close-outline"></ion-icon>
            </a>
        </div>
        <div class="d-flex">
            <form action="order.htm" method="post">
                <div class="customer-info">
                	<label class="fname"><span>Họ Tên <span class="required">*</span></span>
                    	<input type="text" required name="fname" value="${cus.name }">
                	</label>
                	<label class="address">
            			<span>Địa chỉ (Cụ thể)<span class="required">*</span></span>
            			<input type="text" name="address" value="">
            		</label>
               
                	<label>
			            <span>Số điện thoại<span class="required">*</span></span>
			            <input required type="text" name="phone" value="${cus.phoneNumber }"> 
          			</label>
                	<label>
		                <span>Địa chỉ email <span class="required">*</span></span>
		                <input required  type="email" name="email" value="${cus.email }"> 
            		</label>
                	<label>
		                <span>Ghi chú <span class="required">*</span></span>
		                <input type="text" maxlength="50" value="" name="notes">
           			 </label>
           			 ${message }
                </div>
                <div class="Yorder">
	                <table>
	                    <tr>
	                        <th colspan="2">Tổng thanh toán</th>
	                    </tr>
	                    <tr>
	                        <td>Tổng sản phẩm x Số lượng</td>
	                        <td>${total}</td>
	                    </tr>
	                    <tr>
	                        <td>Phí vận chuyển</td>
	                        <td>35000</td>
	                    </tr>
	                    <tr>
	                        <td>Tổng phải trả</td>
	                        <td>${35000 + total }</td>
	                    </tr>
	                </table><br>
	                <div>
	                    <input type="radio" name="dbt" value="dbt" disabled="disabled"> Thanh toán qua ví điện tử
	                </div>
	                <p>
	                    Đơn hàng sẽ được duyệt khi chuyển khoản thành công.
	                </p>
	                <div>
	                    <input type="radio" name="dbt" value="cd" checked > Thanh toán khi nhận hàng
	                </div>
	                <button type="submit">Đặt hàng</button>
            </div>
            <!-- Yorder -->
            </form>
           
            
             
        </div>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${url }/js/jquery-3.3.1.min.js"></script>
</body>
</html>