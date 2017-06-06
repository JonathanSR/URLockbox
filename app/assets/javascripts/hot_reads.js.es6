const host = "https://localhost:3000"

var getLinks = function(){
  return $.ajax({
    method: 'GET',
    url: host + '/api/v1/links'
  })
  .done(updateHotLinks)
  .fail(function(error){
  console.log(error)
  })
}

var updateHotLinks = function(data){
  for(var i=0; i < data.length; i++){
    var hot_link = (data[i].url)

  var links = $('.link').find('.link-url')
    for(var j=0; j <links.length; j++){
      var link = (links[j].innerHTML)
      var local_link = link.slice(6)
      var $top = ($(links[j]).siblings('.hot'))
      var $hot = ($(links[j]).siblings('.mild'))

      if(hot_link == local_link && i == 0){
        $top.text("top link")
        $top.css('background-color', 'red');
      }
      else if(hot_link == local_link){
        $hot.text("hot")
        $hot.css('background-color', 'orange')
        console.log(hot_link)
      };
    };
  };
};

$(document).ready(function(){
  getLinks();
})