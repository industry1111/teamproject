<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function drawImage()
{
    var found = null;
    var sel = document.getElementsByName("templete"); 
    var img = document.getElementById("templte"); 
 
    for(var i=0; i<sel.length; i++) 
    {
        if(sel[i].checked == true) 
        {
            found = sel[i];
            break; 
        }
    }
    img.src = found.value;
}
</script>
</head>



<body onload="drawImage()">
<h3>템플릿을 선택하세요</h3>
<hr> 
<form> 
    <input type="radio" name="templete" value="/images/modooLogo.jsp" checked onchange="drawImage()">1
    <input type="radio" name="templete" value="/images/modooLogo.jsp" onchange="drawImage()">2
    <input type="radio" name="templete" value="/images/modooLogo.jsp" onchange="drawImage()">3
    <input type="radio" name="templete" value="/images/modooLogo.jsp" onchange="drawImage()">4
    <input type="radio" name="templete" value="/images/modooLogo.jsp" onchange="drawImage()">5
    <br>
<img id="templete" src="../images/modooLogo.jsp">
</form>
</body>
</html>