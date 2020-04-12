$(() => {
  const $body = $('body')
  if ($body.find('#admin').length > 0) {
    return
  }

  let $bg_yellow = $($body).find('.bg-yellow-area');
  if ($bg_yellow.length > 0) {
    console.log($bg_yellow)
    $($bg_yellow).css({'background-image':'url(' + $($body).find('#bg_yellow').attr('src') + ')'});
  }

  $('#fade').innerfade({speed: 2500, timeout: 6000 });
})
