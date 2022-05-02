/*=========================================================================================
    File Name: components-modal.js
    Description: Modals are streamlined, but flexible, dialog prompts with the minimum
				required functionality and smart defaults.
    ----------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: Pixinvent
    Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function (window, document, $) {
  'use strict';

  var onShowEvent = $('#onshow'),
    onShownEvent = $('#onshown'),
    onHideEvent = $('#onhide'),
    onHiddenEvent = $('#onhidden');

  // onShow event
  onShowEvent.on('show.bs.modal', function () {
    alert('onShow event fired.');
  });

  // onShown event
  onShownEvent.on('shown.bs.modal', function () {
    alert('onShown event fired.');
  });

  // onHide event
  onHideEvent.on('hide.bs.modal', function () {
    alert('onHide event fired.');
  });

  // onHidden event
  onHiddenEvent.on('hidden.bs.modal', function () {
    alert('onHidden event fired.');
  });
})(window, document, jQuery);
