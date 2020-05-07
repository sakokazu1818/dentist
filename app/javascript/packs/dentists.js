$(window).on('load', function() {
  const $body = $('body')
  if ($body.find('#admin').length > 0) {
    return
  }

  $('#fade').innerfade({speed: 2500, timeout: 6000 })

  $('.clinic-img-wrapper .none').each(function(index, element){
    $(this).removeClass('none')
  })
})
