function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}

function getCookie(cookieName, defaultValue) {
    var i, x, y, zcookies = document.cookie.split(";");
    for (i = 0; i < zcookies.length; i++) {
        x = zcookies[i].substr(0, zcookies[i].indexOf("="));
        y = zcookies[i].substr(zcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == cookieName) {
            return unescape(y);
        }
    }

    return defaultValue;
}
