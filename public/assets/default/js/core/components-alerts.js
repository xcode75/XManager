/*=========================================================================================
    File Name: components-alert.js
    ----------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: Pixinvent
    Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function (window, document, $) {
  'use strict';

  var alertValidationInput = $('.alert-validation'),
    alertRegex = /^[0-9]+$/,
    alertValidationMsg = $('.alert-validation-msg');

  /* validation with alert */
  alertValidationInput.on('input', function () {
    if (alertValidationInput.val().match(alertRegex)) {
      alertValidationMsg.css('display', 'none');
    } else {
      alertValidationMsg.css('display', 'block');
    }
  });
})(window, document, jQuery);
