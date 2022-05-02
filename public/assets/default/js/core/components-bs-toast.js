'use strict';

// Basic toast
$('.toast-basic-toggler').on('click', function () {
  $('.toast-basic').toast('show');
});

// Auto Hide Off toast
$('.toast-autohide-toggler').on('click', function () {
  $('.toast-autohide').toast('show');
});

// Auto Hide Off toast
$('.toast-stacked-toggler').on('click', function () {
  $('.toast-stacked').toast('show');
});

// Placement toast
$('.placement').on('click', function () {
  $('.toast-placement .toast').toast('show');
});
