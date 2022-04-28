<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String lat = request.getParameter("lat");
String lon = request.getParameter("lon");
String uid = (String) session.getAttribute("sessid");

String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
String user = "root";
String password = "smart";

StringBuffer qry = new StringBuffer();
qry.append(" select * from g_location ");
qry.append(" where uid=? ");

String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;



try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);

	stmt = conn.prepareStatement(sql);
	stmt.setString(1, uid);

	rs = stmt.executeQuery();

	if (rs.next()) {
		updateLoc(conn, stmt, uid, lat, lon);
	} else {
		createLoc(conn, stmt, uid, lat, lon);
	}
} catch (Exception e) {
	e.getLocalizedMessage();
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
}
%>

<%!
public void updateLoc(Connection conn, PreparedStatement stmt,
		String uid, String lat, String lon){
	try{
		String sql = "";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		
		stmt.executeQuery();
	} catch(Exception e){}
}

public void createLoc(Connection conn, PreparedStatement stmt,
		String uid, String lat, String lon){
	try{
		String sql = "INSERT INTO g_location (uid, lat, lon) VALUES (?, ?, ?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.setString(2, lat);
		stmt.setString(3, lon);
		
		stmt.executeUpdate();
	} catch(Exception e){}
	System.out.println("등록");
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>실시간버스위치</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<script>
var lat = <%=lat %>; // 위도
var lon = <%=lon %>; // 경도

if (navigator.geolocation) {
    //위치 정보를 얻기
    navigator.geolocation.getCurrentPosition (function(pos) {
    	lat = pos.coords.latitude;     // 위도
    	lon = pos.coords.longitude; // 경도
    });
} else {
    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
}
</script>  
</head>

<body class="page06">
    <div class="busmap">
        
<div id="map" style="width:100vw;height:100vh;"></div>
<div style="position:absolute;top:5px;left:5px;z-index:1">뒤로가기</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7344285a206b8c8cd10a184e52b78a3"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(36.028314129296824, 129.36268527847125)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(36.02606723102794, 129.35782655191446)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(36.029134023955756, 129.35215009093756)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "img/BUS.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(35, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
    </div>
</body>
</html>
