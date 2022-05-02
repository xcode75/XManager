/*=========================================================================================
    File Name: ext-component-blockui.js
    Description: BlockUI
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

$(function () {
  'use strict';

  var section = $('#section-block'),
    sectionBlock = $('.btn-section-block'),
    sectionBlockOverlay = $('.btn-section-block-overlay'),
    sectionBlockSpinner = $('.btn-section-block-spinner'),
    sectionBlockCustom = $('.btn-section-block-custom'),
    sectionBlockMultiple = $('.btn-section-block-multiple'),
    cardSection = $('#card-block'),
    cardBlock = $('.btn-card-block'),
    cardBlockOverlay = $('.btn-card-block-overlay'),
    cardBlockSpinner = $('.btn-card-block-spinner'),
    cardBlockCustom = $('.btn-card-block-custom'),
    cardBlockMultiple = $('.btn-card-block-multiple'),
    pageBlock = $('.btn-page-block'),
    pageBlockOverlay = $('.btn-page-block-overlay'),
    pageBlockSpinner = $('.btn-page-block-spinner'),
    pageBlockCustom = $('.btn-page-block-custom'),
    pageBlockMultiple = $('.btn-page-block-multiple'),
    formSection = $('.form-block'),
    formBlock = $('.btn-form-block'),
    formBlockOverlay = $('.btn-form-block-overlay'),
    formBlockSpinner = $('.btn-form-block-spinner'),
    formBlockCustom = $('.btn-form-block-custom'),
    formBlockMultiple = $('.btn-form-block-multiple');

  // Section Blocking
  // --------------------------------------------------------------------

  // Default
  if (sectionBlock.length && section.length) {
    sectionBlock.on('click', function () {
      section.block({
        message: '<div class="spinner-border text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Overlay Color
  if (sectionBlockOverlay.length && section.length) {
    sectionBlockOverlay.on('click', function () {
      section.block({
        message: '<div class="spinner-border text-primary" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          backgroundColor: '#fff',
          opacity: 0.8
        }
      });
    });
  }

  // Custom Spinner
  if (sectionBlockSpinner.length && section.length) {
    sectionBlockSpinner.on('click', function () {
      section.block({
        message: '<div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Custom Message
  if (sectionBlockCustom.length && section.length) {
    sectionBlockCustom.on('click', function () {
      section.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p><div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Multiple Message
  if (sectionBlockMultiple.length && section.length) {
    sectionBlockMultiple.on('click', function () {
      section.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        },
        timeout: 1000,
        onUnblock: function () {
          section.block({
            message: '<p class="mb-0">Almost Done...</p>',
            timeout: 1000,
            css: {
              backgroundColor: 'transparent',
              color: '#fff',
              border: '0'
            },
            overlayCSS: {
              opacity: 0.25
            },
            onUnblock: function () {
              section.block({
                message: '<div class="p-1 bg-success">Success</div>',
                timeout: 500,
                css: {
                  backgroundColor: 'transparent',
                  color: '#fff',
                  border: '0'
                },
                overlayCSS: {
                  opacity: 0.25
                }
              });
            }
          });
        }
      });
    });
  }

  // Card Blocking
  // --------------------------------------------------------------------

  // Default
  if (cardBlock.length && cardSection.length) {
    cardBlock.on('click', function () {
      cardSection.block({
        message: '<div class="spinner-border text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Overlay Color
  if (cardBlockOverlay.length && cardSection.length) {
    cardBlockOverlay.on('click', function () {
      cardSection.block({
        message: '<div class="spinner-border text-primary" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          backgroundColor: '#fff',
          opacity: 0.8
        }
      });
    });
  }

  // Custom Spinner
  if (cardBlockSpinner.length && cardSection.length) {
    cardBlockSpinner.on('click', function () {
      cardSection.block({
        message: '<div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Custom Message
  if (cardBlockCustom.length && cardSection.length) {
    cardBlockCustom.on('click', function () {
      cardSection.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p><div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Multiple Message
  if (cardBlockMultiple.length && cardSection.length) {
    cardBlockMultiple.on('click', function () {
      cardSection.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        },
        timeout: 1000,
        onUnblock: function () {
          cardSection.block({
            message: '<p class="mb-0">Almost Done...</p>',
            timeout: 1000,
            css: {
              backgroundColor: 'transparent',
              color: '#fff',
              border: '0'
            },
            overlayCSS: {
              opacity: 0.25
            },
            onUnblock: function () {
              cardSection.block({
                message: '<div class="p-1 bg-success">Success</div>',
                timeout: 500,
                css: {
                  backgroundColor: 'transparent',
                  color: '#fff',
                  border: '0'
                },
                overlayCSS: {
                  opacity: 0.25
                }
              });
            }
          });
        }
      });
    });
  }

  // Page Blocking
  // --------------------------------------------------------------------

  // Default
  if (pageBlock.length) {
    pageBlock.on('click', function () {
      $.blockUI({
        message: '<div class="spinner-border text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Overlay Color
  if (pageBlockOverlay.length) {
    pageBlockOverlay.on('click', function () {
      $.blockUI({
        message: '<div class="spinner-border text-primary" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          backgroundColor: '#fff',
          opacity: 0.8
        }
      });
    });
  }

  // Custom Spinner
  if (pageBlockSpinner.length) {
    pageBlockSpinner.on('click', function () {
      $.blockUI({
        message: '<div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Custom Message
  if (pageBlockCustom.length) {
    pageBlockCustom.on('click', function () {
      $.blockUI({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Multiple Message
  if (pageBlockMultiple.length) {
    pageBlockMultiple.on('click', function () {
      $.blockUI({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        },
        timeout: 1000,
        onUnblock: function () {
          $.blockUI({
            message: '<p class="mb-0">Almost Done...</p>',
            timeout: 1000,
            css: {
              backgroundColor: 'transparent',
              color: '#fff',
              border: '0'
            },
            overlayCSS: {
              opacity: 0.5
            },
            onUnblock: function () {
              $.blockUI({
                message: '<div class="p-1 bg-success">Success</div>',
                timeout: 500,
                css: {
                  backgroundColor: 'transparent',
                  color: '#fff',
                  border: '0'
                },
                overlayCSS: {
                  opacity: 0.5
                }
              });
            }
          });
        }
      });
    });
  }

  // Form Blocking
  // --------------------------------------------------------------------

  // Default
  if (formBlock.length && formSection.length) {
    formBlock.on('click', function () {
      formSection.block({
        message: '<div class="spinner-border text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Overlay Color
  if (formBlockOverlay.length && formSection.length) {
    formBlockOverlay.on('click', function () {
      formSection.block({
        message: '<div class="spinner-border text-primary" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          border: '0'
        },
        overlayCSS: {
          backgroundColor: '#fff',
          opacity: 0.8
        }
      });
    });
  }

  // Custom Spinner
  if (formBlockSpinner.length && formSection.length) {
    formBlockSpinner.on('click', function () {
      formSection.block({
        message: '<div class="spinner-grow spinner-grow-sm text-white" role="status"></div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Custom Message
  if (formBlockCustom.length && formSection.length) {
    formBlockCustom.on('click', function () {
      formSection.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        timeout: 1000,
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        }
      });
    });
  }

  // Multiple Message
  if (formBlockMultiple.length && formSection.length) {
    formBlockMultiple.on('click', function () {
      formSection.block({
        message:
          '<div class="d-flex justify-content-center align-items-center"><p class="mr-50 mb-0">Please wait...</p> <div class="spinner-grow spinner-grow-sm text-white" role="status"></div> </div>',
        css: {
          backgroundColor: 'transparent',
          color: '#fff',
          border: '0'
        },
        overlayCSS: {
          opacity: 0.5
        },
        timeout: 1000,
        onUnblock: function () {
          formSection.block({
            message: '<p class="mb-0">Almost Done...</p>',
            timeout: 1000,
            css: {
              backgroundColor: 'transparent',
              color: '#fff',
              border: '0'
            },
            overlayCSS: {
              opacity: 0.25
            },
            onUnblock: function () {
              formSection.block({
                message: '<div class="p-1 bg-success">Success</div>',
                timeout: 500,
                css: {
                  backgroundColor: 'transparent',
                  color: '#fff',
                  border: '0'
                },
                overlayCSS: {
                  opacity: 0.25
                }
              });
            }
          });
        }
      });
    });
  }
});
