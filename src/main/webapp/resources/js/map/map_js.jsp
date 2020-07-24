<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.575920, 126.976824), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
// 지도를 클릭했을 때 클릭 위치 좌표에 대한 법정동 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
        	        	
            var detailAddr = '<div>' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' + 
                            detailAddr + 
                        '</div>';      
            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);
            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
            
            //클릭한 위치 행정동 주소정보
            geocoder.coord2RegionCode(mouseEvent.latLng.getLng(), mouseEvent.latLng.getLat(), callback);
        }   
    });
});
//행정동 주소정보 DB용
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	for(var i = 0; i < result.length; i++) {
            // region_type 값은 행정동일경우	'H', 법정동일 경우  'B'
            if (result[i].region_type === 'B') {
            	//서울특별시 제거
	            var choice = ((result[i].address_name).replace(result[i].region_1depth_name+" ","").replace(" ","_"))
	            console.log(choice);
	            console.log(result[i].region_1depth_name);
				//서울이 아닌곳 검열
	            if(result[i].region_1depth_name != "서울특별시"){
	            	alert("서울특별시에 해당하는 지역을 선택해주세요");
	            }else{
	            	//주소정보를 전달
		            $("#location").val(choice);
		            
		         	//글자자르기
					var after_location = choice.split("_");
		         	var before_gu = after_location[0]
		         	var before_dong = after_location[1]
		         	console.log(before_gu);
		         	console.log(before_dong);
		       
		         	//자른글자 대입
		         	$("#selectGu").text(before_gu);
		         	$("#selectDong").text(before_dong);
		         	changeDong(before_gu);
	                break;
	            }
            }
        }
    }
};
function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
</script>