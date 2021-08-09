(function (window, document, $) {
   'use strict';
    $(".reset-link").click(function () {
		toastr['success'](panel.resetlinkalert, panel['successfully'], {
		  closeButton: false,
		  tapToDismiss: false,
		  progressBar: true,
		  timeOut: 2000,
		  positionClass: 'toast-top-center',
		  rtl: isRtl
		});
        window.setTimeout("location.href='/portal/affiliate_reset'", 2000);
    });   
})(window, document, jQuery);  
  