$(window).on('load', function() {
  const $body = $('body')
  if ($body.find('#admin').length > 0) {
    return
  }

  $('#fade').innerfade({speed: 2500, timeout: 6000 })

  $('.clinic-img-wrapper .none').each(function(index, element){
    $(this).removeClass('none')
  })

  let $spGoogleCalenda = $('.sp-google-calenda');
  if ($spGoogleCalenda.length > 0) {
    const scale = $spGoogleCalenda.parent().width() / 460;

    $spGoogleCalenda.css( { 'transform-origin': "0 0" } );
    $spGoogleCalenda.css( { transform: "scale(" + scale + ")" } );
    $spGoogleCalenda.css('visibility', 'visible');
  }
})
