<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
<<<<<<< HEAD

</script>
</head>



<body onload="drawImage()">
<h3>템플릿을 선택하세요</h3>
<hr> 
<form> 
    <input type="radio" name="templete"  value="templete1">1
    <img alt="1" src="../images/modooLogo.jpg"> <img alt="1" src="../images/modooLogo.jpg">
    <hr>
    <input type="radio" name="templete"  value="templete2">2
     <img alt="1" src="../images/modooLogo.jpg"> <img alt="1" src="../images/modooLogo.jpg">
    <hr>
    <input type="radio" name="templete"  value="templete3">3
     <img alt="1" src="../images/modooLogo.jpg"> <img alt="1" src="../images/modooLogo.jpg">
    <hr>
    <input type="radio" name="templete"  value="templete4">4
     <img alt="1" src="../images/modooLogo.jpg"> <img alt="1" src="../images/modooLogo.jpg">
    <hr>
    <input type="radio" name="templete"  value="templete5">5
     <img alt="1" src="../images/modooLogo.jpg"> <img alt="1" src="../images/modooLogo.jpg">
    <hr>
    <br>
		
	<br><br>
	
    <br><br>
    <input type="button" value="확인" onclick="drawImage()">

=======
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
>>>>>>> refs/remotes/origin/cyh
</form>
</body>
</html>