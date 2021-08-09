window.addEventListener('load', () => {
	var priceSwitch = $('#priceSwitch');
	priceSwitch.on('change', function () {
		if ($(this).is(':checked')) {
			document.getElementById('data_topup').hidden = false;
			document.getElementById('data_package').hidden = true;
		} else {
			document.getElementById('data_package').hidden = false;
			document.getElementById('data_topup').hidden = true;
		}
	});
});	