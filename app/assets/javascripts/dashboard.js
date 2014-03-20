
function populatePages(){
      var locElem = $("select[name$='[page]']");
      jQuery.ajax({
        type: "get",
        async: true,
        data: {
          website_id : jQuery('#website_id').val()
        },
        url: '/dashboard',
        complete: function(data) {
          document.getElementById('page').disabled=false;
          
        }
      });
}