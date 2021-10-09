<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a823da81f8ed9288a1502f72c9578112&libraries=services"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.1/kakao.js"></script><script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
	<div class="inner">
      <h1 class="pageTit" id="pageTit"><em>스토어</em></h1>
      
      <div class="addressCont addressSearch">
        <h3>방문하실 매장을 검색하여 선택해주세요</h3>
        <p>
          <strong></strong>
          <span class="inputWrap selectWrap">
            <select name="addr_si" id="addr_si"><option value="">지역선택</option><option value="강원">강원</option><option value="경기">경기</option><option value="경남">경남</option><option value="경북">경북</option><option value="광주">광주</option><option value="대구">대구</option><option value="대전">대전</option><option value="부산">부산</option><option value="서울">서울</option><option value="세종특별자치시">세종특별자치시</option><option value="울산">울산</option><option value="인천">인천</option><option value="전남">전남</option><option value="전북">전북</option><option value="제주특별자치도">제주특별자치도</option><option value="충남">충남</option><option value="충북">충북</option></select>
          </span>
          <span class="inputWrap selectWrap">
            <select name="addr_gu" id="addr_gu">
            <option value="강원">시/구/군</option></select>
          </span>
          <span class="inputWrap selectWrap">
            <select name="sel_store" id="sel_store"><option value="">-</option></select>
          </span>
          <!-- <span class="inputWrap inputTxt">
            <input type="text" name="searchtxt" id="searchtxt" placeholder="매장명이나 주소를 입력해주세요" />
          </span> -->
          <!-- <button class="button btnSearch" onclick="selectStoreList();">검색</button> -->
        </p>
      </div>    
      <div class="addressCont addressMap">
        <div class="addressMap">
          <div class="mapArea" id="map">

          </div>
          <div class="mapDetail">
            <dl>
              <dt>매장명</dt>
              <dd id="store_name">강남점</dd>
            </dl>
            <dl>
              <dt>전화번호</dt>
              <dd id="store_tel_no">02-1234-5678</dd>
            </dl>
            <dl>
              <dt>매장주소</dt>
              <dd id='addr_full'>서울 강남구 강남대로94길 20</dd>
            </dl>
            <dl>
              <dt>영업시간</dt>
              <dd id="operating">12:00~23:00</dd>
            </dl>
            <dl>
              <dt>매장타입</dt>
              <dd id="store_type">
              </dd>
            </dl>
          </div>
        </div>        
      </div>
    </div>    
<script>
	var element_wrap = "";
	var positions = [];
	
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.8937488890106, 128.565278089869), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
	$(function(){
		element_layer = document.getElementById('popCon1');
	
		$("#addr_si").bind("change",function(){
			selectStoreGuList();
		});
	
		$("#addr_gu").bind("change",function(){
			selectStoreList('');
		});

		$("#sel_store").bind("change",function(){
			var idxs = $(this).val();
			var selmoveLatLon = positions[idxs].latlng;
			var selinfostr = positions[idxs].info.split("|");
			map.panTo(selmoveLatLon);
		    infoset(selinfostr);
		});
		
		selectStoreList('first');
	
		selectStoreSiList();
	});

	var selectStoreSiList = function(){
		var url = "/store/StoreSO/selectStoreSiList.do";
		var option = {
			  data:{}
			, success:function(result){
				var list = result.getDataList(0);
				console.log(list);
				$("#addr_si").empty();
				$("#addr_si").append("<option value=\"\">지역선택</option>");
				if (0 < list.rowCount){
					for(var i=0; i < list.rowCount; i++){
						var html = '';
						html += '<option value="'+list.rows[i].addr_si+'">'+list.rows[i].addr_si+'</option>';
						$("#addr_si").append(html);
					}
				}
			}
			, async:true
		};
		cntt.dataSubmit(url, option);
	}

	var selectStoreGuList = function(){
		var addr_si = $("#addr_si").val();
		if (cntt.isEmpty(addr_si)){
			alert("지역을 선택해 주세요");
			return;
		}

		var url = "/store/StoreSO/selectStoreGuList.do";
		var option = {
			  data:{ADDR_SI:addr_si}
			, success:function(result){
				var list = result.getDataList(0);
				console.log(list);
				$("#addr_gu").empty();
				$("#addr_gu").append("<option value=\"\">시/구/군</option>");
				if (0 < list.rowCount){
					for(var i=0; i < list.rowCount; i++){
						var html = '';
						html += '<option value="'+list.rows[i].addr_gu_gun+'">'+list.rows[i].addr_gu_gun+'</option>';
						$("#addr_gu").append(html);
					}
				}
			}
			, async:true
		};
		cntt.dataSubmit(url, option);
	}

	var selectStoreList = function(type){
		var addr_si = $("#addr_si").val();
		var addr_gu = $("#addr_gu").val();
		//var searchtxt = $("#searchtxt").val();

		if (type == "first"){
			addr_si = "";
			addr_gu = "";
			searchtxt = "";
		} else {
			if ((cntt.isEmpty(addr_si) || cntt.isEmpty(addr_gu)) /* && cntt.isEmpty(searchtxt) */){
				alert("지역 또는 검색어를 입력해 주세요");
				return;
			}
		}
		positions = [];

		var url = "/store/StoreSO/selectStoreList.do";
		var option = {
			  data:{ADDR_SI:addr_si, ADDR_GU:addr_gu/*, SEARCHTXT:searchtxt*/}
			, success:function(result){
				var list = result.getDataList(0);
				console.log(list);
				if (0 < list.rowCount){
					for(var i=0; i < list.rowCount; i++){
						positions.push({content: '<div>'+list.rows[i].STORE_NAME+'</div>',latlng: new kakao.maps.LatLng(list.rows[i].CX, list.rows[i].CY),info: list.rows[i].STORE_CODE+"|"+list.rows[i].STORE_NAME+"|"+list.rows[i].STORE_TEL_NO+"|"+list.rows[i].addr_full+"|"+list.rows[i].OPEN_TIME+"|"+list.rows[i].CLOSE_TIME+"|"+list.rows[i].DELIVERY_YN+"|"+list.rows[i].PACKING_YN});
					}
					markercreate(type);
				}
			}
			, async:true
		};
		cntt.dataSubmit(url, option);
	}

	var markercreate = function(type){

		// 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = "";
	    var infostr = "";

	    $("#map").empty();
	    $("#sel_store").empty();
	    if (type != "first") {
			$("#sel_store").append("<option value=\"\">선택해주세요</option>");
		} else {
			$("#sel_store").append("<option value=\"\">-</option>");
		}
	    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	    if (0 < positions.length){
			moveLatLon = positions[0].latlng;
			infostr = positions[0].info.split("|");

			positions.forEach(function(pos, idx) {
				// 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[idx].latlng, // 마커를 표시할 위치
			        title : positions[idx].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
			    	store_type_icon = "";        
			    	infostr = pos.info.split("|");
			    	infoset(infostr);
			    });

			    var infodt = positions[idx].info.split("|");

			    //alert("positions.length : "+positions.length+"\n idx : "+idx);
				if (type != "first") {
			    	$("#sel_store").append("<option value=\""+idx+"\">"+infodt[1]+"</option>");
				}

			    if (idx == 0){
			    	// 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);
				    infoset(infostr);
			    }
			});
		}
	}
	}
</script>
    
</div>
</body>

</html>