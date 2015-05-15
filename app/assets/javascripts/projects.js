$(document).on('ready page:load', function() {
  console.log("page load")
  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();
    console.log("search submit")

    $.ajax({
      url: '/projects?search=' + searchValue,
      type: 'GET',
      dataType: 'script'
    })
  });

});