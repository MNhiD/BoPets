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