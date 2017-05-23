$(document).ready(function(){
  newLinkListener();
});

function newLink(){
  var url = $("#link_url").val();
  var title = $("#link_title").val();
  createLink(url, title)
};

var createLink = function(url, title){
  var link = {'url': url,
               'title': title}
  return $.ajax({
    url:"api/v1/links",
    method: "POST",
    data: link
  })
  .done(function(response){
    $("#all-links").prepend(response)
  })
  .fail(function(error) {
    console.log(error)
  });
};

function newLinkListener(){
  $("#add-link").on("click", function(event){
    event.preventDefault(),
    newLink();
  });
};