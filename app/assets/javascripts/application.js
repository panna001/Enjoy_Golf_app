// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require chartkick
//= require Chart.bundle



$(document).on('turbolinks:load', function(){
  $('.read-more').on('click', function(){
    $(this).prev('span').addClass("d-none");
    $(this).addClass("d-none");
    $(this).next('p').removeClass("d-none");
  });

  $('.comment-new').on('click', function(){
    $(this).next('div').toggleClass("d-none");
  });

  $('.detail-btn').on('click', function(){
    $(this).next().slideToggle();
  });

});

$(document).on('change keyup keydown paste cut', 'textarea', function(){
  if ($(this).outerHeight() > this.scrollHeight){
    $(this).height(1);
  };
  while ($(this).outerHeight() < this.scrollHeight){
    $(this).height($(this).height() + 1)
  };
});

