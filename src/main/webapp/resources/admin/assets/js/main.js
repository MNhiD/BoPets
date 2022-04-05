$(function() {
    const a = document.querySelector.bind(document);
    const arr = document.querySelectorAll.bind(document);

    const tabs = arr(".tab-item");
    const panes = arr(".tab-pane");

    const tabActive = a(".tab-item.active");
    const line = a(".tabs .line");

    line.style.left = tabActive.offsetLeft + "px";
    line.style.width = tabActive.offsetWidth + "px";

    tabs.forEach((tab, index) => {
        const pane = panes[index];

        tab.onclick = function() {
            a(".tab-item.active").classList.remove("active");
            a(".tab-pane.active").classList.remove("active");

            line.style.left = this.offsetLeft + "px";
            line.style.width = this.offsetWidth + "px";

            this.classList.add("active");
            pane.classList.add("active");
        };
    });

});

/*function remove_tr(This) {
    var check = confirm("Bạn có muốn xóa sản phẩm này không?");
    if (check == 1) {
        if (This.closest('tbody').childElementCount == 0) {
            alert("Không còn gì để xóa!");
        } else {
            This.closest('tr').remove();
        }
    }
}
*/
/*function confirm_tr(This) {
    var check = confirm("Bạn muốn duyệt đơn hàng này?");
    if (check == 1) {
        if (This.closest('tbody').childElementCount == 0) {
            alert("Không còn gì để xóa!");
        } else {
            var item = $('tr.active-row td.status').text().toString();
            console.log(item);
            if (item == 'Đã hủy') {

                console.log('Không thể duyệt đơn hàng!');
            }

        }
    }
}*/
$(document).ready(function(){
	
	$(".forgot-password-link").click(function(){
		$(".login-admin").css("display","none");
		$(".login-btn").css("display","none");
		$.ajax({
			
			url: "admin-forgot.htm",
			type:"GET",
			data:{},
			dataType: 'text',
			success: function(value){					
				//$(".amount-cart").html(value);
				
				
			}
		})
	});
	$("#btnReset").click(function(){
		document.getElementById("name").reset();
		document.getElementById("price").reset();
		document.getElementById("cost").reset();
		document.getElementById("amount").reset();
		document.getElementById("categories").reset();
		document.getElementById("image-file").reset();
		document.getElementById("desc").reset();
		document.getElementById("brand").reset();
		document.getElementById("desc").reset();
		document.getElementById("weight").reset();
		document.getElementById("exp").reset();
		document.getElementById("fabric").reset();
		document.getElementById("volume").reset();
		document.getElementById("type").reset();
	});
});
// $(function() {
//     var table = document.getElementById('order-table'),
//         index;
//     for (i = 1; i < table.rows.length; i++) {
//         for (var j = 0; j < table.rows[i].cells.length; j++) {
//             if (table.rows[i].cells[j].innerHTML === 'Chờ phê duyệt') {
//                 // let input
//             }
//         }
//     }
// });
/*order  js*/
$(document).ready(function(){
	$(".btn-confirm-all").click(function(){
		
		var sellID = $(".sell-code-all").val();
		var check = confirm("Would you like to confirm this order?");
		if(check == true){
			$.ajax({
				url:"confirm"+sellID+".htm",
				type:"GET",
				data:{
					sellID : sellID
				},
				dataType:'text',
				success:function(value){
					if(value=="delivery"){
						$(".sell-status-all").html("Đang giao hàng");
					}
					else if(value=="success"){
						alert("Đơn hàng đã được duyệt");
					}
					else{
						alert("Đơn hàng đã bị hủy");
					}
				}
			})
		}
		
	})
	$(".btn-cancel-all").click(function(){
		
		var sellID = $(".sell-code-all").val();
		var check = confirm("Would you like to delete this order?");
		if(check == true){
			$.ajax({
				url:"order-cancel.htm",
				type:"GET",
				data:{
					sellID : sellID
				},
				dataType:'text',
				success:function(value){
					if(value=="success"){
						$(".sell-status-all").html("Đã hủy");
					}
					
					else{
						alert("Không thể hủy đơn");
					}
				}
			})
		}
		
	})
	
});
