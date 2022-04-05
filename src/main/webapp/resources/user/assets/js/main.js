$(document).ready(function(){
	
	$(".add-to-cart").click(function(){
		var id = $(this).closest("div").attr("data-id");
		$.ajax({
			
			url: "addToCart.htm",
			type:"GET",
			data:{
				productId: id
			},
			dataType: 'text',
			success: function(value){	
				$(".amount-cart").html(value);
				
				
			}
		})
	});
	
	
});

$(document).ready(function(){
	$(".btn-login").click(function(){
		if(!($('span.foggot').html()) ==''){
			confirm("Đúng mật khẩu");
		}
		else{
			$('div.modal-login').removeClass("close-login")
		}
	})
});
/*end cart*/
$(document).ready(function() {
    $('.js-click-login').click(function(e) {
        e.preventDefault();
        $('.modal-login').toggleClass("open-login");
    });
    $('.modal-login__overlay').click(function(e) {
        e.preventDefault();
        $('.modal-login').removeClass("open-login");

    });
});

$(document).ready(function() {
    $('.js-click-register').click(function(e) {
        e.preventDefault();
        $('.modal-register').toggleClass("open-register");
    });
    $('.modal-register__overlay').click(function(e) {
        e.preventDefault();
        $('.modal-register').removeClass("open-register");

    });
});

//search-bar
// disable body scroll which navbar is in active 

$(function() {
    $('.navbar-toggler').click(function() {
        $('body').toggleClass('noscroll');
    })
});
// disable body scroll which navbar is in active
// cart-js 
transmitv.render();

transmitv.cart.on('transmitv_checkout', function(evt) {
    var items, len, i;

    if (this.subtotal() > 0) {
        items = this.items();

        for (i = 0, len = items.length; i < len; i++) {}
    }
});
// cart-js
// slider transform 
// optional

$(document).load(function() {
    $('#customerhnyCarousel').carousel({
    interval: 5000
})
});

$(document).load(function() {
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: 9000,
        values: [50, 6000],
        slide: function(event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

});
// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
// scroll move top 

/*window.onscroll = function() {
    scrollFunction()
};*/
$(document).ready(function() {
    window.onscroll = function() {
        scrollFunction();

    }
});

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("movetop").style.display = "block";
    } else {
        document.getElementById("movetop").style.display = "none";
    }
}


//message


