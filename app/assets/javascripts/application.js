// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR.js

//= require cocoon
//= require select2
//= require select2_locale_"pt-BR"
//= require jsapi
//= require knob
//= require chartkick
//= require_tree .
//= stub pdfjs/pdf.js
//= stub pdfjs/pdf.worker.js
//= stub pdfjs/compatibility.js
//= stub pdfjs/jquery-pdfdoc.js

$(function() {

  Ged.actual = {};
  Ged.actual.controller = $('body').attr('data-controller');
  Ged.actual.action = $('body').attr('data-action');

  try {
    Ged[Ged.actual.controller][Ged.actual.action]['init'].call();
  } catch (e) {
  }

  //$('[data-toggle="tooltip"]').tooltip();

  $('select.select2').select2();

  Ged.make_date_field($('input.datepicker'));
});

