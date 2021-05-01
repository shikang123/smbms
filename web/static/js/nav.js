$(function () {
    $(".li").on("click", function (e) {
        let id = e.target.id;
        if (id === "userManager") {
            window.location.href = path + "/user/list";
            return;
        }
        if (id === "billManager") {
            window.location.href = path + "/bill/list";
            return;
        }
        if (id === "roleManager") {
            window.location.href = path + "/role/list";
            return;
        }
        if (id === "providerManager") {
            window.location.href = path + "/provider/list";
        }
        if (id === "logout") {
            window.location.href = path + "/user/logout";
            return;
        }
        if (id === "modifyPassword") {
            window.location.href = path + "/user/modifyPwd";
        }
    })
})