function page_nav(num) {
    let form = document.forms[0];
    form.pageIndex.value = num;
    form.submit();
}
function jump_to() {
    let selIndex = document.getElementById("selIndex").value;
    page_nav(selIndex);
}