		//layui.use('layer', function(){});
		
		var wait=60;
		function time(o) {
				if (wait == 0) {
					o.removeAttr("disabled");			
					o.text(panel.getcode);
					wait = 120;
				} else {
					o.attr("disabled","disabled");
					o.text(wait);
					wait--;
					setTimeout(function() {
						time(o)
					},
					1000)
				}
		}


				
		$("#mobilecode").click(function () {
				if($('#phonecode').val()==''){
					toastr['error'](panel.selectcountry, panel['errors'], {
						  closeButton: false,
						  tapToDismiss: false,
						  progressBar: true,
						  timeOut: 2000,
						  positionClass: 'toast-top-center',
						  rtl: isRtl
					});
					return;
				}
						
				var phonecode = $('#phonecode').val();
				
				
				$.ajax({
					type: "POST",
					url: "/portal/mobilecode",
					dataType: "json",
					data: {
						mobile: $("#mobile").val(),
						phonecode: phonecode
					},
					success: function (data) {
						if (data.ret) {
							toastr['success'](data.msg, panel['successfully'], {
							  closeButton: false,
							  tapToDismiss: false,
							  progressBar: true,
							  timeOut: 2000,
							  positionClass: 'toast-top-center',
							  rtl: isRtl
							});
							time($("#mobilecode")); 
							
						} else {
							toastr['error'](data.msg, panel['errors'], {
							  closeButton: false,
							  tapToDismiss: false,
							  progressBar: true,
							  timeOut: 2000,
							  positionClass: 'toast-top-center',
							  rtl: isRtl
							});	 
						}
					},
					error: function (jqXHR) {
						toastr['error'](panel.error, panel['errors'], {
						  closeButton: false,
						  tapToDismiss: false,
						  progressBar: true,
						  timeOut: 2000,
						  positionClass: 'toast-top-center',
						  rtl: isRtl
						});
					}
				})

			
		})

		$("#mobileverify").click(function () {
		
				if($('#phonecode').val()==''){
					//layer.msg(panel.selectcountry);
					toastr['error'](panel.selectcountry, panel['errors'], {
						  closeButton: false,
						  tapToDismiss: false,
						  progressBar: true,
						  timeOut: 2000,
						  positionClass: 'toast-top-center',
						  rtl: isRtl
					});
					return;
				}
						
				var phonecode = $('#phonecode').val();
				
				
				$.ajax({
					type: "POST",
					url: "/portal/mobileverify",
					dataType: "json",
					data: {
						mobile: $("#mobile").val(),
						phonecode: phonecode,
						mobile_code: $("#mobile_code").val()
					},
					success: function (data) {
						if (data.ret) {
							toastr['success'](data.msg, panel['successfully'], {
							  closeButton: false,
							  tapToDismiss: false,
							  progressBar: true,
							  timeOut: 2000,
							  positionClass: 'toast-top-center',
							  rtl: isRtl
							});
							window.setTimeout("location.href=window.location.href", 2000);							
						} else {
							toastr['error'](data.msg, panel['errors'], {
							  closeButton: false,
							  tapToDismiss: false,
							  progressBar: true,
							  timeOut: 2000,
							  positionClass: 'toast-top-center',
							  rtl: isRtl
							});	 
						}
					},
					error: function (jqXHR) {
						toastr['error'](panel.error, panel['errors'], {
						  closeButton: false,
						  tapToDismiss: false,
						  progressBar: true,
						  timeOut: 2000,
						  positionClass: 'toast-top-center',
						  rtl: isRtl
						});
					}
				})

			
		})