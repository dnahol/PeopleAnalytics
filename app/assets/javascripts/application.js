// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .

// Disabling turbolinks due to infinite recursion bug in turbolinks
// require turbolinks
// require jquery.turbolinks


//= require highcharts
//= require highcharts/highcharts-more
//= require materialize

// more features, include as needed:
//= require highcharts/modules/annotations
//= require highcharts/modules/data
//= require highcharts/modules/drilldown
//= require highcharts/modules/exporting
//= require highcharts/modules/funnel
//= require highcharts/modules/heatmap
//= require highcharts/modules/no-data-to-display
//= require highcharts/modules/offline-exporting

// themes:
//= require highcharts/themes/dark-blue
//= require highcharts/themes/dark-green
//= require highcharts/themes/gray
//= require highcharts/themes/grid
//= require highcharts/themes/skies

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.collapsible')
  var instances = M.Collapsible.init(elems, {accordion: true})
});
