<%@page import="org.apache.tomcat.util.http.fileupload.UploadContext"%>
<%@page import="db.memberDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="file.FileDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 처리 서버페이지 fileUploadAction.jsp</title>
</head>
<body>
<%	
	//application 내장 객체는 전체 프로젝트에 대한 자원을 관리하는 객체입니다.
	//서버(톰캣)의 실제 프로젝트는 경로에서 자원을 찾을 때 가장 많이 사용한다.
	
	//업로드할 실제 서버경로 얻기
	String directory = application.getRealPath("/upload/");
	//D:\workspace_jsp1\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileUploadDownload\ upload\
	
	//업로드 할 수 있는 파일의 최대 사이즈 지정 1G = 1024MB
	int maxSize = 1024*1024*1024;

	//참고: MultipartRequest 클래스에 대한 객체 생성자로 업로드할 정보를 전달해 저장시키면 자동으로우리가 지정한 경로에 파일 업로드가 되게한다.
	//실제 파일 업로드를 담당하는 클래스는 cos.jar에 존재하는 MultipartRequest 클래스이다. 
	MultipartRequest multipartRequest;

	//객체 생성 시 생성자로 전달할 데이터를 
	//1) fileUpload.jsp의 form태그에 의해 전달 받은 업로드할 파일의 정보를 가지고 있는 reqeust 내장객체
	//2) 업로드할 파일의 실제 서버 폴더 경로( /upload/ )
	//3) 업로드할 수 있는 파일의 최대 사이즈 지정
	//4) 업로드하는 파일 이름이 한글일 경우 깨져서 올라가게 되므로 인코딩 방식을 UTF-8로 설정하기 위해 전달
	//5) 업로드되는 실제 서버 폴더 경로에 똑같은 파일 업로드시 파일명 끝에 1을 자동으로 붙여 만들어주는 역할인 new DefaultFileRenamePolicy()객체를 생성해 전달
	multipartRequest = new MultipartRequest(request, directory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//서버 경로에 업로드할 파일의 업로드 전 원본 파일명 얻기
	String fileName = multipartRequest.getOriginalFileName("file");
	
	System.out.println(fileName);

	//업로드한 파일의 원본 이름과 업로드한 파일의 실제 이름을 DB에 INSERT
	new memberDAO().upload(fileName);
	
	out.write("업로드한 원본 파일명 : " + fileName + "<br>");
	
%>
</body>
</html>