<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>



<body onload="drawImage()">
<h3>템플릿을 선택하세요</h3>
<hr> 
<form> 
    	<div>
    		<div style="width: 100px;float: left">
    			<input type="radio" name="templete"  value="templete1">템플릿1
    		</div>
    		<div style="width: 100px;float:left ">
    			<img alt="" src="../images/1.png" style="height: 200px">
    		</div>
    	</div>
    	<div>
    		<input type="button" value="확인" onclick="drawImage()">
    	</div>
   
    
    
</form>
</body>
</html>



