var pageInitialized = false;

jQuery(document).ready(function() {
    if(pageInitialized) return;
    pageInitialized = true;
    incrementCount();
});

var incrementCount = function() {

    page = findPage();
    if(page == "dashboard") return;
    ip = "127.0.0.1";
    browser = browserDetection();
    jQuery.ajax({
            type: "get",
            async: true,
            data: {
                website_id : 4, // Client website ID needs to be given
                page : page,
                ip : ip,
                browser : browser,
                device: "Desktop"
            },
            url: 'http://localhost:3000/send_to_analytics',
            success: function(data) {
            }
        });

};

var findPage = function() {
    var file = window.location.pathname;
    n = file.lastIndexOf('/');
    if (n >= 0) {
        file = file.substring(n + 1);
    }
    return (file == "") ? "home" : file
}

function browserDetection() {
    if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
        var ffversion = new Number(RegExp.$1) ; 
        return "Firefox";   
    }
    else if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
        var ieversion = new Number(RegExp.$1);
        return "IE"       
    }
    else if (/Chrome[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
        var chromeversion = new Number(RegExp.$1);
        // capture x.x portion and store as a number
        return "Chrome";
    }
    else if (/Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
        var oprversion = new Number(RegExp.$1)
        return "Opera"
    }
    else if (/Safari[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
        var safariversion = new Number(RegExp.$1);
        return "Safari"
    }
}