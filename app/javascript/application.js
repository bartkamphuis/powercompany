// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('ajax:success', 'a[data-remote]', function(event) {
    var detail = event.detail;
    var data = detail[0], status = detail[1], xhr = detail[2];
    $('#main-content').html(data);
});