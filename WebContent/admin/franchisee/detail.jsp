<%@page import="com.coffee.model.domain.Franchisee"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Franchisee franchisee=(Franchisee)request.getAttribute("franchisee");
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/inc/css-head.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: white;
  padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function del(franchisee_id){
	location.href="/admin/franchisee/delete/"+franchisee_id;
}
$(function(){
	$("#bt-edit").click(function(){
		regist();
	});
});
function regist(){
	$("form").attr({
		action:"/admin/franchisee/update",
		method:"post"
	});
	$("form").submit();
}

</script>

</head>
<body>
<div class="container">
  <form>
	<input type="hidden" name="member_id", value="<%=franchisee.getMember().getMember_id() %>">
	<input type="hidden" name="franchisee_id" value="<%=franchisee.getFranchisee_id() %>">
	<label for="fname">점포명</label>
    <input type="text" name="f_name" value="<%=franchisee.getF_name() %>"/>
    <label for="fname">가맹점주</label>
    <input type="text"  name="member_id" value="<%=franchisee.getMember().getName()%>"/>    
    <label for="fname">지역</label>
    <select name="local">
			<option value="경기">경기</option>
			<option value="서울">서울</option>
			<option value="강원">강원</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
			<option value="전남">전남</option>
			<option value="전북">전북</option>
			<option value="경남">경남</option>
			<option value="경북">경북</option>
			<option value="제주">제주</option>
	</select>
    <label for="fname">주소</label>
    <input type="text" id="addr" name="addr" value="<%=franchisee.getAddr()%>"/>
    <label for="fname">위도/경도</label>
    <input type="text" id="lati" name="lati" value="<%=franchisee.getLati()%>"/>
    <input type="text" id="longi" name="longi" value="<%=franchisee.getLongi()%>"/>
    <label for="fname">승인여부</label>
    <select name="checked">
			<option value="0">거부</option>
			<option value="1">승인</option>
	</select>
    <label for="subject">Message</label>
    <textarea id="subject" name="message" placeholder="Write something.." style="height:200px"><%=franchisee.getMessage() %></textarea>
  </form>
    <input class="button genric-btn3 primary-border circle" type="button" value="수정" id="bt-edit">
    <input class="button genric-btn3 primary-border circle" type="button" value="삭제" onClick="del(<%=franchisee.getFranchisee_id() %>)">
    <input class="button genric-btn3 primary-border circle" type="button" value="목록" onClick="location.href='/admin/franchisee/list'">
</div>
<script>
	var placeSearch, autocomplete;
	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete(
	                                      (document.getElementById("addr")),{types: ['geocode']});
	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}
	function fillInAddress() {
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();
	    document.getElementById("lati").value=place.geometry.location.lat();
	    document.getElementById("longi").value=place.geometry.location.lng();
	}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7h6wQQQLLXC7QjvP7nuwXtWrSgBGWdpQ&libraries=places&callback=initAutocomplete"></script>
</body>
</html>
