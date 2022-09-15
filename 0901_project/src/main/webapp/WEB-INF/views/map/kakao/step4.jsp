<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qibcib1qrm"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=01adb31bf702fae04c0bd8c61712b7f9&libraries=services"></script>
		    

		<style type="text/css">
			
			#div_box {
				width: 900px;
				height: 500px;
			}
			
			
			.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		    .wrap * {padding: 0;margin: 0;}
		    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		    .info .close:hover {cursor: pointer;}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header2.jsp" %>
		
		<div id="div_box" class="container">
		<div id="map" style="width:100%;height:350px;"></div>
			<p>
			    <button onclick="hideMarkers()">마커 감추기</button>
			    <button onclick="showMarkers()">마커 보이기</button>
			</p> 
			
			<script>
				var mapContainer = document.getElementById('map'), // 지도의 중심좌표
				    mapOption = { 
				        center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    }; 
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.getCurrentPosition(function(position) {
				        
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				            message = '<div style="padding:5px;">내 위치</div>'; // 인포윈도우에 표시될 내용입니다
				        
				        // 마커와 인포윈도우를 표시합니다
				        displayMarker(locPosition, message);
				            
				      });
				    
				} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
				    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
				        message = 'geolocation을 사용할수 없어요..'
				        
				    displayMarker(locPosition, message);
				}

				// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition, message) {

				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    var iwContent = message, // 인포윈도우에 표시할 내용
				        iwRemoveable = true;

				    // 인포윈도우를 생성합니다
				    var infowindow = new kakao.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });
				    
				    // 인포윈도우를 마커위에 표시합니다 
				    infowindow.open(map, marker);
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}
			
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
				var markers = [];
				var overlays = [];
				
				// 마커를 생성하고 지도위에 표시하는 함수입니다
				function addMarker( maddr1, mnick, idx ) {

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch( maddr1 , function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {

					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
			
							// 커스텀 오버레이에 표시할 컨텐츠 입니다
							// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
							// 별도의 이벤트 메소드를 제공하지 않습니다 
								var content = '<div class="wrap">' + 
								            '<div class="info">' + 
								            '<div class="title">' + 
								            mnick + 
								            '<div class="close" onclick="closeOverlay('+idx+');" title="닫기"></div>' + 
								            '</div>' + 
								            '<div class="body">' + 
								            '<div class="desc">' + 
								            '<div class="ellipsis">'+ maddr1 + '</div>' + 
								            '</div>' + 
								            '</div>' + 
								            '</div>' +    
								            '</div>';
								            
								            // 마커 위에 커스텀오버레이를 표시합니다
											// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
											var overlay = new kakao.maps.CustomOverlay({
												    content: content,
												    map: map,
												    position: marker.getPosition()       
												});
								            
											// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
												kakao.maps.event.addListener(marker, 'click', function() {
												    overlay.setMap(map);
												});

// 									            $(".close").on("click", function(){
// 									            	overlay.setMap(null);
// 									            });
								
								// 생성된 마커를 배열에 추가합니다
							    markers.push(marker);
							    overlays.push(overlay);
			
// 						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
// 						        map.setCenter(coords);
						        
						    }//if
						    
					});//geocoder.addressSearch
					
				}//function addMarker
				// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
				function closeOverlay( idx ) {
// 					alert("close : " + idx);
				    overlays[idx].setMap(null);
				}
				
									
				
			// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
				function setMarkers(map) {
				    for (var i = 0; i < markers.length; i++) {
				        markers[i].setMap(map);
				    }            
				}
			
			// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
				function showMarkers() {
				    setMarkers(map)    
				}

			// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
				function hideMarkers() {
				    setMarkers(null);    
				}
			</script>
			
			<script type="text/javascript">
		$(document).ready(function() {

			$.each(${list}, function(idx, dto) {
				addMarker(dto.maddr1, dto.mnick, idx);
				showMarkers();
				
				
				alert("addMarker : " + idx);
				
			});//each

		});//ready
		</script>
		</div>
		
		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>