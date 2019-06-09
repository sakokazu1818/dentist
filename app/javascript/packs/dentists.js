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

  // 住所
  const location = { lat: 35.187666, lng: 136.737804 }
  const map = new google.maps.Map(document.getElementById('map'), { zoom: 15, center: location })

  // google mapsインスタンス化
  const transitLayer = new google.maps.TransitLayer()
  transitLayer.setMap(map)

  // マーカーを押したときにポップアップで出る情報
  const contentString = '住所：愛知県津島市寺前町３丁目21−１'
  const infowindow = new google.maps.InfoWindow({ content: contentString })

  // マーカーの実体を作る
  const marker = new google.maps.Marker({ position: location, map, title: contentString })

  // マーカーをクリックできるようにする
  marker.addListener('click', () => {
    infowindow.open(map, marker)
  })

  function chengeClinicImg(img) {
    $($body).find('#clinic-img').fadeOut(1000, function () {
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
    }, 5000
  )
})
