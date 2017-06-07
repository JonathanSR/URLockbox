const host = "https://protected-woodland-35657.herokuapp.com/"

$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
});
 
function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link')[0];
  var linkId = $($link).find('#link-id')[0].value;

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  })
  .then(updateLinkStatusRead)
  .fail(displayFailure);
  $($link).addClass('already-read')
}

function updateLinkStatusRead(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
  $(`.link[data-link-id=${link.id}]`).find(".mark-as-read").removeClass('mark-as-read').addClass('mark-as-unread').text("Mark as Unread")

  var url = (link.url)
  sendLink(url)
};

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
};

var sendLink = function(url){
  var link = { 'url': url }
  return $.ajax({
    method: 'POST',
    url: host + '/api/v1/links',
    data: link
  });
};