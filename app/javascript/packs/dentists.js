$(function(){
  // 住所
  let location = { lat: 35.632896, lng: 139.880394 }
  let map = new google.maps.Map(document.getElementById('map'), { zoom: 15, center: location })

  //google mapsインスタンス化
  let transitLayer = new google.maps.TransitLayer()
  transitLayer.setMap(map)

  // マーカーを押したときにポップアップで出る情報
  let contentString = '住所：千葉県浦安市舞浜１−１'
  let infowindow = new google.maps.InfoWindow({content: contentString})

  //マーカーの実体を作る
  let marker = new google.maps.Marker({position:location,map: map,title: contentString})

  //マーカーをクリックできるようにする
  marker.addListener('click', function() {
    infowindow.open(map, marker)
  })
})
