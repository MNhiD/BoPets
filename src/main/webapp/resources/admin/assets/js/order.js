$(function() {
    var table = document.getElementById('order-table'),
        index;
    for (i = 1; i < table.rows.length; i++) {
        table.rows[i].onclick = function() {
            if (typeof index !== "undefined") {
                table.rows[index].classList.toggle("active-row");
            }
            index = this.rowIndex;
            this.classList.toggle("active-row");

        };
    }
});
