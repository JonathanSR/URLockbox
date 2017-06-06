$(document).ready(function(){
  $('#show-unread').on('click', function(){

    $('.link').each(function(){
      $(this).show()
    })

    $('.link').each(function(){
      var status = $(this).context.children[5]
      var realStatus = $(status).find('unread-status').context.innerText

      if(realStatus == 'Read? true') {
        $(this).hide()
      };
    });
  });
});