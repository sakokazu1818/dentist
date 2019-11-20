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

  function chengeClinicImg(img) {
    $($body).find('#clinic-img').fadeOut(2000, function () {
      $(this).attr('src', img).on('load', function () {
        $(this).fadeIn()
      })
    })
  }

  let count = 1
  const imgId = ['#clinic1', '#clinic2', '#clinic3', '#clinic4', '#clinic5']
  setInterval(
    () => {
      chengeClinicImg($($body).find(imgId[count]).attr('src'))
      count += 1

      if (imgId.length <= count) {
        count = 0
      }
    }, 8000
  )
})
