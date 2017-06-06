$(document).ready(function(){
  $('#show-read').on('click', function(){

    $('.link').each(function(){
      $(this).show()
    })

    $('.link').each(function(){
      var status = $(this).context.children[5]
      var realStatus = $(status).find('read-status').context.innerText
      if(realStatus == 'Read? false') {
        $(this).hide()
      };
    });
  }); 
});