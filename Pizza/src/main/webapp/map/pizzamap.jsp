<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	a:link {
	  color : pink;
	  text-decoration: none;
	}
	a:visited {
	  color : black;
	  text-decoration: none;
	}
	a:hover {
	  color : blue;
	  text-decoration: underline;
	}
	a:active {
	  color : green;
	  text-decoration: none;
	}
</style>
</head>
<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a823da81f8ed9288a1502f72c9578112&libraries=services"></script>
<div class="inner">
      <h1 class="pageTit" id="pageTit" align="center"><em>매장위치</em></h1>
      
      <div class="atdressCont atdressSearch">
        <h3>강남본점</h3>
      </div>
      <div id="map" style="withh:100%;height:350px;"></div>
      	<table class="table table-bordered" style="width: 100%; text-align: left;">
      		<tr	bgcolor="#dcdcdc" style="font-size: 15pt;" height="40">
				<th>매장주소</th>
			</tr>
			<tr height="40">				
				<td>서울 강남구 강남대로94길 20</td>
			</tr>
			<tr	bgcolor="#dcdcdc" style="font-size: 15pt;" height="40">
				<th>전화번호</th>
			</tr>
			<tr height="40">				
				<td>02-1234-5678</td>
			</tr>
			<tr	bgcolor="#dcdcdc" style="font-size: 15pt;" height="40">
				<th>영업시간</th>
			</tr>
			<tr height="40">				
				<td>12:00~23:00</td>
			</tr>
			<tr	bgcolor="#dcdcdc" style="font-size: 15pt;" height="40">
				<th>지하철</th>
			</tr>
			<tr height="40">				
				<td>신논현역 9호선 5번출구 - 강남역 방향 도보 12분<br>
					강남역 2호선 11번출구 - 신논현역 방향 도보 4분</td>
			</tr>
			<tr	bgcolor="#dcdcdc" style="font-size: 15pt;" height="40">
				<th>버스</th>
			</tr>
			<tr height="40">				
				<td>하차) 강남역12번출구(강남역, 강남역사거리방면)</td>
			</tr>
      	</table>
    </div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.49950666895868, 127.02901749768682), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.49950666895868, 127.02901749768682); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px; font-size:12pt;"><a href="https://map.kakao.com/link/map/피자캠프 강남본점,37.49950666895868, 127.02901749768682" target="_blank">피자캠프 강남본점</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.49950666895868, 127.02901749768682); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>
</html>