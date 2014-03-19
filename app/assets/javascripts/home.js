var pageInitialized = false;

jQuery(document).ready(function() {
    
    if(pageInitialized) return;
    pageInitialized = true;
    incrementCount();

});


var incrementCount = function() {

    var file = window.location.pathname;
    var info;
    n = file.lastIndexOf('/');
    if (n >= 0) {
        file = file.substring(n + 1);
    }
    page = (file == "") ? "home" : file
    ip = client_ip;
    browser = BrowserDetection();
    
};

function BrowserDetection() {

        if (/Firefox[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {

            var ffversion = new Number(RegExp.$1) ; 
            return "Firefox";   
        }

        else if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {

            var ieversion = new Number(RegExp.$1);       
        }

        else if (/Chrome[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
            var chromeversion = new Number(RegExp.$1);
            // capture x.x portion and store as a number
            return "Chrome";

        }
        else if (/Opera[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {

            var oprversion = new Number(RegExp.$1) 
        }
        else if (/Safari[\/\s](\d+\.\d+)/.test(navigator.userAgent)) {
            var safariversion = new Number(RegExp.$1);


        }
}