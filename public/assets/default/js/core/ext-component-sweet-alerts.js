/*=========================================================================================
	File Name: ext-component-sweet-alerts.js
	Description: A beautiful replacement for javascript alerts
	----------------------------------------------------------------------------------------
	Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
	Author: Pixinvent
	Author URL: hhttp://www.themeforest.net/user/pixinvent
==========================================================================================*/
$(function () {
  'use strict';

  var basicAlert = $('#basic-alert');
  var withTitle = $('#with-title');
  var withFooter = $('#footer-alert');
  var htmlAlert = $('#html-alert');

  var positionTopStart = $('#position-top-start');
  var positionTopEnd = $('#position-top-end');
  var positionBottomStart = $('#position-bottom-start');
  var positionBottomEnd = $('#position-bottom-end');

  var bounceIn = $('#bounce-in-animation');
  var fadeIn = $('#fade-in-animation');
  var flipX = $('#flip-x-animation');
  var tada = $('#tada-animation');
  var shake = $('#shake-animation');

  var success = $('#type-success');
  var error = $('#type-error');
  var warning = $('#type-warning');
  var info = $('#type-info');

  var customImage = $('#custom-image');
  var autoClose = $('#auto-close');
  var outsideClick = $('#outside-click');
  var question = $('#prompt-function');
  var ajax = $('#ajax-request');

  var confirmText = $('#confirm-text');
  var confirmColor = $('#confirm-color');

  var assetPath = '../../../app-assets/';
  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  }

  //--------------- Basic Examples ---------------

  // Basic
  if (basicAlert.length) {
    basicAlert.on('click', function () {
      Swal.fire({
        title: 'Any fool can use a computer',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // With Title
  if (withTitle.length) {
    withTitle.on('click', function () {
      Swal.fire({
        title: 'The Internet?,',
        text: 'That thing is still around?',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // With Footer
  if (withFooter.length) {
    withFooter.on('click', function () {
      Swal.fire({
        icon: 'error',
        title: 'Oops...',
        text: 'Something went wrong!',
        footer: '<a href>Why do I have this issue?</a>',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // HTML Alert
  if (htmlAlert.length) {
    htmlAlert.on('click', function () {
      Swal.fire({
        title: '<strong>HTML <u>example</u></strong>',
        icon: 'info',
        html:
          'You can use <b>bold text</b>, ' +
          '<a href="https://pixinvent.com/" target="_blank">links</a> ' +
          'and other HTML tags',
        showCloseButton: true,
        showCancelButton: true,
        focusConfirm: false,
        confirmButtonText: feather.icons['thumbs-up'].toSvg({ class: 'font-medium-1 mr-50' }) + 'Great!',
        confirmButtonAriaLabel: 'Thumbs up, great!',
        cancelButtonText: feather.icons['thumbs-down'].toSvg({ class: 'font-medium-1' }),
        cancelButtonAriaLabel: 'Thumbs down',
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
      });
    });
  }

  //--------------- Position ---------------

  // Top Start
  if (positionTopStart.length) {
    positionTopStart.on('click', function () {
      Swal.fire({
        position: 'top-start',
        icon: 'success',
        title: 'Your work has been saved',
        showConfirmButton: false,
        timer: 1500,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Top End
  if (positionTopEnd.length) {
    positionTopEnd.on('click', function () {
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Your work has been saved',
        showConfirmButton: false,
        timer: 1500,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Bottom Start
  if (positionBottomStart.length) {
    positionBottomStart.on('click', function () {
      Swal.fire({
        position: 'bottom-start',
        icon: 'success',
        title: 'Your work has been saved',
        showConfirmButton: false,
        timer: 1500,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Bottom End
  if (positionBottomEnd.length) {
    positionBottomEnd.on('click', function () {
      Swal.fire({
        position: 'bottom-end',
        icon: 'success',
        title: 'Your work has been saved',
        showConfirmButton: false,
        timer: 1500,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  //--------------- Animations ---------------

  // Bounce In
  if (bounceIn.length) {
    bounceIn.on('click', function () {
      Swal.fire({
        title: 'Bounce In Animation',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        showClass: {
          popup: 'animate__animated animate__bounceIn'
        },
        buttonsStyling: false
      });
    });
  }

  // Fade In
  if (fadeIn.length) {
    fadeIn.on('click', function () {
      Swal.fire({
        title: 'Fade In Animation',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        showClass: {
          popup: 'animate__animated animate__fadeIn'
        },
        buttonsStyling: false
      });
    });
  }

  // FlipX
  if (flipX.length) {
    flipX.on('click', function () {
      Swal.fire({
        title: 'Flip In Animation',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        showClass: {
          popup: 'animate__animated animate__flipInX'
        },
        buttonsStyling: false
      });
    });
  }

  // Tada
  if (tada.length) {
    tada.on('click', function () {
      Swal.fire({
        title: 'Tada Animation',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        showClass: {
          popup: 'animate__animated animate__tada'
        },
        buttonsStyling: false
      });
    });
  }

  // Shake
  if (shake.length) {
    shake.on('click', function () {
      Swal.fire({
        title: 'Shake Animation',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        showClass: {
          popup: 'animate__animated animate__shakeX'
        },
        buttonsStyling: false
      });
    });
  }

  //--------------- Types ---------------

  // Success
  if (success.length) {
    success.on('click', function () {
      Swal.fire({
        title: 'Good job!',
        text: 'You clicked the button!',
        icon: 'success',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Error
  if (error.length) {
    error.on('click', function () {
      Swal.fire({
        title: 'Error!',
        text: ' You clicked the button!',
        icon: 'error',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Warning
  if (warning.length) {
    warning.on('click', function () {
      Swal.fire({
        title: 'Warning!',
        text: ' You clicked the button!',
        icon: 'warning',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Info
  if (info.length) {
    info.on('click', function () {
      Swal.fire({
        title: 'Info!',
        text: 'You clicked the button!',
        icon: 'info',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  //--------------- Options ---------------

  // Custom Image
  if (customImage.length) {
    customImage.on('click', function () {
      Swal.fire({
        title: 'Sweet!',
        text: 'Modal with a custom image.',
        imageUrl: assetPath + 'images/slider/04.jpg',
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Custom image',
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Auto Close
  if (autoClose.length) {
    autoClose.on('click', function () {
      var timerInterval;
      Swal.fire({
        title: 'Auto close alert!',
        html: 'I will close in <strong></strong> seconds.',
        timer: 2000,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false,
        onBeforeOpen: function () {
          Swal.showLoading();
          timerInterval = setInterval(function () {
            Swal.getContent().querySelector('strong').textContent = Swal.getTimerLeft();
          }, 100);
        },
        onClose: function () {
          clearInterval(timerInterval);
        }
      });
    });
  }

  // Click Outside
  if (outsideClick.length) {
    outsideClick.on('click', function () {
      Swal.fire({
        title: 'Click outside to close!',
        text: 'This is a cool message!',
        allowOutsideClick: true,
        customClass: {
          confirmButton: 'btn btn-primary'
        },
        buttonsStyling: false
      });
    });
  }

  // Question
  if (question.length) {
    question.on('click', function () {
      Swal.mixin({
        input: 'text',
        confirmButtonText: 'Next &rarr;',
        showCancelButton: true,
        progressSteps: ['1', '2', '3'],
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
      })
        .queue([
          {
            title: 'Question 1',
            text: 'Chaining swal2 modals is easy'
          },
          'Question 2',
          'Question 3'
        ])
        .then(function (result) {
          if (result.value) {
            Swal.fire({
              title: 'All done!',
              html: 'Your answers: <pre><code>' + JSON.stringify(result.value) + '</code></pre>',
              confirmButtonText: 'Lovely!',
              customClass: { confirmButton: 'btn btn-primary' }
            });
          }
        });
    });
  }

  // Ajax
  if (ajax.length) {
    ajax.on('click', function () {
      Swal.fire({
        title: 'Search for a user',
        input: 'text',
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false,
        inputAttributes: {
          autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'Look up',
        showLoaderOnConfirm: true,
        preConfirm: function (login) {
          return fetch('//api.github.com/users/' + login + '')
            .then(function (response) {
              if (!response.ok) {
                throw new Error(response.statusText);
              }
              return response.json();
            })
            .catch(function (error) {
              Swal.showValidationMessage('Request failed:  ' + error + '');
            });
        },
        allowOutsideClick: function () {
          !Swal.isLoading();
        }
      }).then(function (result) {
        if (result.value) {
          Swal.fire({
            title: '' + result.value.login + "'s avatar",
            imageUrl: result.value.avatar_url,
            customClass: { confirmButton: 'btn btn-primary' }
          });
        }
      });
    });
  }

  //--------------- Confirm Options ---------------

  // Confirm Text
  if (confirmText.length) {
    confirmText.on('click', function () {
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
      }).then(function (result) {
        if (result.value) {
          Swal.fire({
            icon: 'success',
            title: 'Deleted!',
            text: 'Your file has been deleted.',
            customClass: {
              confirmButton: 'btn btn-success'
            }
          });
        }
      });
    });
  }

  // Confirm Color
  if (confirmColor.length) {
    confirmColor.on('click', function () {
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        customClass: {
          confirmButton: 'btn btn-primary',
          cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
      }).then(function (result) {
        if (result.value) {
          Swal.fire({
            icon: 'success',
            title: 'Deleted!',
            text: 'Your file has been deleted.',
            customClass: {
              confirmButton: 'btn btn-success'
            }
          });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          Swal.fire({
            title: 'Cancelled',
            text: 'Your imaginary file is safe :)',
            icon: 'error',
            customClass: {
              confirmButton: 'btn btn-success'
            }
          });
        }
      });
    });
  }
});
