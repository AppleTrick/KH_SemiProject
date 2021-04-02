/**
 * 
 */

var Animalhospital1;
var Animalhospital2;
var Animalhospital3;
// 마커를 표시할 위치와 title 객체 배열입니다
var positionsHospital = [];
var positionsProtection = [];
// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markersHospital = [];
var markersProtection = [];

var map;

var Animalhospital1;
var Animalhospital2;
var Animalhospital3;
var AnimalProtection;

//위도
var latitude1 = 37.39490807240093;
// 경도
var longitude1 = 127.11114750062966;


// Api 에서 값을 받아 온다.
async function fetchURL(){
    Animalhospital1 = await fetch('https://openapi.gg.go.kr/Animalhosptl?KEY=00bfb12c126b44e387a7f0ef71a51ee1&pIndex=1&pSize=1000&type=json')
    .then(function(res) {
      return res.json();
    });   

    Animalhospital2 = await fetch('https://openapi.gg.go.kr/Animalhosptl?KEY=00bfb12c126b44e387a7f0ef71a51ee1&pIndex=2&pSize=1000&type=json')
    .then(function(res){
      return res.json();
    });

    Animalhospital3 = await fetch('https://openapi.gg.go.kr/Animalhosptl?KEY=00bfb12c126b44e387a7f0ef71a51ee1&pIndex=3&pSize=1000&type=json')
    .then(function(res){
      return res.json();
    });
    
    AnimalProtection = await fetch('https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?KEY=00bfb12c126b44e387a7f0ef71a51ee1&pIndex=1&pSize=1000&type=json')
    .then(function(res){
      return res.json();
    });
}


// 함수 시작
async function start() {
  await fetchURL();
  pushPositions(Animalhospital1);
  pushPositions(Animalhospital2);
  pushPositions(Animalhospital3);

  pushPositions1(AnimalProtection);
  // await getLocation();  
  await makeMaps();
};

// positon 값에 동물 병원 API 값들 넣어주기
function pushPositions(inputval){
  for (var i = 0; i < inputval.Animalhosptl[1].row.length; i++) {

    if(inputval.Animalhosptl[1].row[i].BSN_STATE_NM !=="폐업"){
      var vals = {
        title: inputval.Animalhosptl[1].row[i].BIZPLC_NM,
        latlng: new kakao.maps.LatLng(
          inputval.Animalhosptl[1].row[i].REFINE_WGS84_LAT,
          inputval.Animalhosptl[1].row[i].REFINE_WGS84_LOGT
        ),
      };
      positionsHospital.push(vals);
    }
  }
}

function pushPositions1(inputval){
  for (var i = 0; i < inputval.OrganicAnimalProtectionFacilit[1].row.length; i++) {

    var vals = {
      title: inputval.OrganicAnimalProtectionFacilit[1].row[i].ENTRPS_NM,
      latlng: new kakao.maps.LatLng(
        inputval.OrganicAnimalProtectionFacilit[1].row[i].REFINE_WGS84_LAT,
        inputval.OrganicAnimalProtectionFacilit[1].row[i].REFINE_WGS84_LOGT
      ),
    };
    positionsProtection.push(vals);

  }
}

// 내위치 확인 GPS 확인
// async function getLocation() {
//   if (navigator.geolocation) {
//     // GPS를 지원하면
//     navigator.geolocation.getCurrentPosition(
//       function (position) {
//         console.log(latitude1,longitude1);
//         latitude1 = position.coords.latitude;
//         longitude1 = position.coords.longitude;
//         console.log(latitude1,longitude1);
//       },
//       function (error) {
//         console.error(error);
//       },
//       {
//         enableHighAccuracy: false,
//         maximumAge: 0,
//         timeout: Infinity,
//       }
//     );
//   }
// }



async function makeMaps() {
  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(latitude1, longitude1), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 마커 이미지의 이미지 주소입니다
  var imageSrc = "resources/img/hospital.png";
  // 마커 이미지의 이미지 크기 입니다
  var imageSize = new kakao.maps.Size(32, 32);

  // 마커 이미지의 이미지 주소입니다
  var imageSrc1 = "resources/img/shield.png";


  // 병원
  // 마커를 생성하고 지도위에 표시하는 함수입니다
  for (var i = 0; i < positionsHospital.length; i++) {
    // 마커 이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: positionsHospital[i].latlng, // 마커를 표시할 위치
      title: positionsHospital[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    markersHospital.push(marker);
  }

  // 보호소
  for (var i = 0; i < positionsProtection.length; i++) {
    // 마커 이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc1, imageSize);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: positionsProtection[i].latlng, // 마커를 표시할 위치
      title: positionsProtection[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    markersProtection.push(marker);
  }
}

// // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
// function setMarkers(map) {
//   for (var i = 0; i < markersHospital.length; i++) {
//     markersHospital[i].setMap(map);
//   }
// }

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
  for (var i = 0; i < markersHospital.length; i++) {
    markersHospital[i].setMap(map);
  }
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
  for (var i = 0; i < markersHospital.length; i++) {
    markersHospital[i].setMap(null);
  }
}

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers1() {
  for (var i = 0; i < markersProtection.length; i++) {
    markersProtection[i].setMap(map);
  }
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers1() {
  for (var i = 0; i < markersProtection.length; i++) {
    markersProtection[i].setMap(null);
  }
}


start();