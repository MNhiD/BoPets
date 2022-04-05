document.getElementById('categories').addEventListener('change', function() {
    if (this.value == '1' || this.value == '2') {
        document.getElementById("brand").readOnly = false;
        document.getElementById("weight").readOnly = false;
        document.getElementById("exp").readOnly = true;
        document.getElementById("fabric").readOnly = true;
        document.getElementById("volume").readOnly = true;
        document.getElementById("type").readOnly = false;
    } else if (this.value == '3') {
        document.getElementById("brand").readOnly = false;
        document.getElementById("weight").readOnly = false;
        document.getElementById("exp").readOnly = false;
        document.getElementById("fabric").readOnly = true;
        document.getElementById("volume").readOnly = false;
        document.getElementById("type").readOnly = false;
    } else {
        document.getElementById("brand").readOnly = false;
        document.getElementById("weight").readOnly = false;
        document.getElementById("exp").readOnly = false;
        document.getElementById("fabric").readOnly = false;
        document.getElementById("volume").readOnly = true;
        document.getElementById("type").readOnly = false;

    }
});

$(function() {
    const realFileBtn = document.getElementById("image-file");
    const customBtn = document.getElementById("custom-button");
    const customTxt = document.getElementById("custom-text");

    customBtn.addEventListener("click", function() {
        realFileBtn.click();
    });

    realFileBtn.addEventListener("change", function() {
        if (realFileBtn.value) {
            customTxt.innerHTML = realFileBtn.value.match(
                /[\/\\]([\w\d\s\.\-\(\)]+)$/
            )[1];
        } else {
            customTxt.innerHTML = "No file chosen, yet.";
        }
    });

});