var pageInitialized = false;

jQuery(document).ready(function() {
    
    if(pageInitialized) return;
    pageInitialized = true;
    incrementCount();
});

$.getJSON("http://smart-ip.net/geoip-json?callback=?", function(data){
    var info = data;
    return data.host
});

var incrementCount = function() {

    var file = window.location.pathname;
    var info;
    n = file.lastIndexOf('/');
    if (n >= 0) {
        file = file.substring(n + 1);
    }
    file = (file == "") ? "home" : file
    $.getJSON("http://smart-ip.net/geoip-json?callback=?", function(data){
        alert(data.host);
    });

};