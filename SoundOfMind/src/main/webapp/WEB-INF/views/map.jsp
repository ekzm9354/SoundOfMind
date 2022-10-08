<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마음의 소리</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1 class="Map">지도</h1>
	<div id="map" style="width: 500px; height: 400px;"></div>
	<!-- 사용자 위치 받아오기 -->
	<script type="text/javascript">
		function onGeoOk(position) {
			var lat = position.coords.latitude;
			var lng = position.coords.longitude;
			$('.Map').last()
					.append(
							'<div style=display:none><span class=lat>' + lat
									+ '</span><span class=lng>' + lng
									+ '</span></div>')
		}
		function onGeoError() {
			alert("사용자 위치를 찾을 수 없습니다!");
		}
		navigator.geolocation.watchPosition(onGeoOk, onGeoError);
	</script>
	<!-- 지도 API -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e90ffc2b83bed9cbdd0b545402d1987&libraries=services,drawing"></script>
	<script type="text/javascript">
		var lat = $('.lat').html()
		var lng = $('.lng').html()
		console.log('lat:' + lat)
		console.log('lng:' + lng)
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		var iwContent = '<div style="padding:5px;">사용자위치</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
		iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		var infowindow = new kakao.maps.InfoWindow({
			map : map, // 인포윈도우가 표시될 지도
			position : iwPosition,
			content : iwContent,
			removable : iwRemoveable
		});

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('장애인복지관', placesSearchCB, {
			useMapBounds : false,
			page : 1,
			radius : 2000,
			location : new kakao.maps.LatLng(lat, lng),
		});

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	</script>
</body>
</html>