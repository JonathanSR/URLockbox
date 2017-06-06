$(document).ready(function(){
  $('#link-filter').on('keyup', function(){

    $('.link').each(function(){
      $(this).show
    })
    var input = $('input[name=link-filter]').val().toLowerCase()

    $('.link').each(function(){
      var dataTitle = $(this).context.children[3]
      var dataUrl = $(this).context.children[4]

      var linkTitle = $(dataTitle).find('link-title').context.innerText.toLowerCase()
      var linkUrl = $(dataUrl).find('link-url').context.innerText.toLowerCase()
      
      if(!linkTitle.includes(input) && !linkUrl.includes(input)){
        $(this).hide()
      };
    });
  });
});