<%@ page pageEncoding="utf-8"%>
<%@include file="/WEB-INF/views/user/include/header.jsp"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <link rel="stylesheet" href="${url }/css/style-liberty.css">
    <link rel="stylesheet" href="${url }/css/list-product.css">
    <link rel="stylesheet" href="${url }/css/common.css">
    <link rel="stylesheet" href="${url }/css/cart-style.css">
    
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
                                <li><a href="index.htm">Home</a>
                                    <ion-icon class="path-icon" name="chevron-forward-outline"></ion-icon></li>
                                <li class="active">Cart</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
    </section>
    <section class="w3l-ecommerce-main-inn">
       <h1>Shopping <span class="lohny">Cart</span></h1>
	<c:if test="${not empty sessionScope.cart  }">
		<div class="shopping-cart">
		
		  <div class="column-labels">
		    <label class="product-image">Image</label>
		    <label class="product-details">Product</label>
		    <label class="product-price">Price</label>
		    <label class="product-quantity">Quantity</label>
		    <label class="product-removal">Remove</label>
		    <label class="product-line-price">Total</label>
		  </div> 
		  	
				<c:forEach var="list" items="${sessionScope.cart }">
				
				  <div class="product" data-id="${list.productId }">
				    <div class="product-image">
				      <img src="<c:url value='/images/${list.image}'/>">
				    </div>
				    <div class="product-details">
				      <div class="product-title">${list.name }</div>
				      <p class="product-description">${list.description }</p>
				    </div>
				    <div class="product-price">${list.price }</div>
				    <div class="product-quantity">
				      <input type="number" value="${list.amount }" min="1" >
				    </div>
				    <div class="product-removal">
				      <button class="remove-product">
				       <ion-icon name="close"></ion-icon>
				      </button>
				    </div>
				    <div class="product-line-price">${list.amount * list.price }</div>
				  </div>
				</c:forEach>
			
			
		
		  <div class="totals">
		    <div class="totals-item">
		      <label>Subtotal</label>
		      <div class="totals-value" id="cart-subtotal">${sessionScope.count }</div>
		    </div>
		    <div class="totals-item">
		      <label>Shipping</label>
		      <div class="totals-value" id="cart-shipping">35000</div>
		    </div>
		    <div class="totals-item totals-item-total">
		      <label>Grand Total</label>
		      <div class="totals-value" id="cart-total">${35000 + sessionScope.count }</div>
		    </div>
		  </div>
		       
		      <a href="order.htm" class="checkout">Checkout</a>
		
		</div>
	</c:if>
	<c:if test="${empty sessionScope.cart}">
		<p class="cart-empty" >Giỏ hàng trống.</p>
		
	</c:if>
    </section>
    <div style="margin: 8px auto; display: block; text-align:center;">
    </div>
    <%@include file="/WEB-INF/views/user/include/footer.jsp"%>
    <%@include file="/WEB-INF/views/user/include/modal.jsp"%>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="${url }/js/jquery-3.3.1.min.js"></script>
	<script src="${url }/js/jquery-2.1.4.min.js"></script>
	<script src="${url }/js/minicart.js"></script>
	<script src="${url }/js/bootstrap.min.js"></script>
	<script src="${url }/js/main.js"></script>
	<script src="${url }/js/shopping-cart.js"></script>
</body>

</html>
