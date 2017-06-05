$(document).ready(function(){
  $('#show-read').on('click', function(){

    $('.link').each(function(){
      $(this).show()
    })

    $('.link').each(function(){
      var status = $(this).context.children[2]
      var realStatus = $(status).find('read-status').context.innerText

      if(realStatus == 'Read? false') {
        $(this).hide()
      };
    });
  });
});