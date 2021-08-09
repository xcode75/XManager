	

    function AddSub(url,jumpurl="") {
	    let tmp = window.btoa(url);
	    window.location.href = jumpurl + tmp;
    }
    function Copyconfig(url,id,jumpurl="") {
        $.ajax({
            url: url,
            type: 'get',
            async: false,
            success: function(res) {
                if(res) {
					toastr['success'](panel.copied, panel['successfully'], {
					  closeButton: false,
					  tapToDismiss: false,
					  progressBar: true,
					  timeOut: 2000,
					  positionClass: 'toast-top-center',
					  rtl: isRtl
					});
                    $(id).data('data', res);
		    		console.log(res);
                } else {
					toastr['error'](panel.unsuccess, panel['errors'], {
					  closeButton: false,
					  tapToDismiss: false,
					  progressBar: true,
					  timeOut: 2000,
					  positionClass: 'toast-top-center',
					  rtl: isRtl
					});					
               }
            }
        });
        const clipboard = new Clipboard('.copy-config', {
            text: function() {
                return $(id).data('data');
            }
        });
        clipboard.on('success', function(e) {
				    $("#result").modal();
				    if (jumpurl != "") {
					    window.setTimeout(function () {
						    window.location.href = jumpurl;
					    }, 1000);

				    } else {
					toastr['success'](panel.copied, panel['successfully'], {
					  closeButton: false,
					  tapToDismiss: false,
					  progressBar: true,
					  timeOut: 2000,
					  positionClass: 'toast-top-center',
					  rtl: isRtl
					});					
				    }
			    }
        );
        clipboard.on("error",function(e){
		    console.error('Action:', e.action);
		    console.error('Trigger:', e.trigger);
		    console.error('Text:', e.text);
			}
	    );
    }

	
    if ((index['transfer_enable'] - index['u'] + index['d'] <= 0) && index['class'] >-1){
		window.onload = function () {
			Swal.fire({
			  title: index['datausedup'],
			  padding: '2em',
			  type: 'warning',
			  confirmButtonText: panel['ok'],
			  allowOutsideClick: false
			})
		};
    }
    if (index['userexpire_in'] < index['date'] || index['class'] < 0){
		window.onload = function () {
			Swal.fire({
			  title: index['planexpired'],
			  padding: '2em',
			  type: 'warning',
			  confirmButtonText: panel['ok'],
			  allowOutsideClick: false
			})
		};
    }	
