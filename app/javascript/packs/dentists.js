$(() => {
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
})
