/* Set rates + misc */

var taxRate = $("div#cart-subtotal").val();
var shippingRate = 35000; 
var fadeTime = 300;


/* Assign actions */
$('.product-quantity input').change( function() {
  updateQuantity(this);
});

$('.product-removal button').click( function() {
  removeItem(this);
});


/* Recalculate cart */
function recalculateCart()
{
  var subtotal = 0;
  
  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseInt($(this).children('.product-line-price').text());
  });
  /* Calculate totals */
/*alert("Taxt: "+ taxRate);
  var tax = subtotal * taxRate;
alert("TAX: "+tax);*/
  var shipping = (subtotal > 0 ? shippingRate : 0);
  var total =subtotal  + shipping;
  
  /* Update totals display */
  $('.totals-value').fadeOut(fadeTime, function() {
    $('#cart-subtotal').html(subtotal);
    /*$('#cart-tax').html(tax);*/
    $('#cart-shipping').html(shipping);
    $('#cart-total').html(total);
    if(total == 0){
      $('.checkout').fadeOut(fadeTime);
    }else{
      $('.checkout').fadeIn(fadeTime);
    }
    $('.totals-value').fadeIn(fadeTime);
  });
}


/* Update quantity */
function updateQuantity(quantityInput)
{	
	var id = $(quantityInput).parent().parent().closest("div").attr("data-id");
	var amount = $(quantityInput).val();
	$.ajax({
			
			url: "cart/update.htm",
			type:"GET",
			data:{
				amount: amount,
				productId: id
			},
			dataType: 'text',
			success: function(value){			
				$(".amount-cart").html(value);
			}
		})
	
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseInt(productRow.children('.product-price').text());
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;

  
  /* Update line price display and recalc cart totals */
  productRow.children('.product-line-price').each(function () {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice);
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });  
}


/* Remove item from cart */
function removeItem(removeButton)
{
	var id = $(removeButton).parent().parent().closest("div").attr("data-id");
	$.ajax({
			
			url: "cart/remove.htm",
			type:"GET",
			data:{
				productId: id
			},
			dataType: 'text',
			success: function(value){				
			}
		})
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();

    recalculateCart();
  });

}