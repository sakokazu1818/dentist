$(() => {
  // 住所
  const location = { lat: 35.632896, lng: 139.880394 }
  const map = new google.maps.Map(document.getElementById('map'), { zoom: 15, center: location })

  // google mapsインスタンス化
  const transitLayer = new google.maps.TransitLayer()
  transitLayer.setMap(map)

  // マーカーを押したときにポップアップで出る情報
  const contentString = '住所：千葉県浦安市舞浜１−１'
  const infowindow = new google.maps.InfoWindow({ content: contentString })

  // マーカーの実体を作る
  const marker = new google.maps.Marker({ position: location, map, title: contentString })

  // マーカーをクリックできるようにする
  marker.addListener('click', () => {
    infowindow.open(map, marker)
  })
})
