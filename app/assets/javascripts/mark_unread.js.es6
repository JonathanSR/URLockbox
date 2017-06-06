$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
});
 
function markAsUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link')[0];
  var linkId = $($link).find('#link-id')[0].value;

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
    })
    .then(updateLinkStatus)
    .fail(displayFailure);
    $($link).removeClass('already-read')
};

function updateLinkStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
};

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
};
