<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드 설정
	final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB 사이즈를 제한하지 않으면 서버에 용량이 다 차버릴 수 있다.
	final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB 
	
	//request 객체를 이용해서 실제로 업로드한 파일이 있는지 체크 한다.
	if (!ServletFileUpload.isMultipartContent(request)) {
	    //에러페이지 응답하고
	    response.sendError(HttpServletResponse.SC_NO_CONTENT, "파일을 첨부하지 않아서 처리가 안돼요!");
	    return;// servlet의 service() 메소드 끝내버리기
	}
	
	// configures upload settings
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// sets memory threshold - beyond which files are stored in disk
	factory.setSizeThreshold(MEMORY_THRESHOLD);
	// sets temporary location to store files
	factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	ServletFileUpload upload = new ServletFileUpload(factory);
	// sets maximum size of upload file
	upload.setFileSizeMax(MAX_FILE_SIZE);
	// sets maximum size of request (include file + form data)
	upload.setSizeMax(MAX_REQUEST_SIZE);
	
	//업로드된 파일을 저장할 절대 경로(서버의 파일시스템에서의) 얻어오기
	String uploadPath=application.getRealPath("/upload");	//  WebContent/upload 업로드 폴더는 WebContent에 있다!
	System.out.println("파일이 저장될 경로: " +uploadPath);
	//전송된 파라미터의 한글 인코딩 설정
	upload.setHeaderEncoding("utf-8");
	
	//작업 성공여부를 저장할 지역변수
	boolean isSuccess=false;
	//파일의 정보를 담을 FileDto 객체 생성
	FileDto dto=new FileDto();
	try{
		List<FileItem> formItems=upload.parseRequest(request);	//파일 아이템을 배열로 얻어온다. 여러가지 type으로 넘어오는 input을 받는다. 
		if(formItems != null && formItems.size()>0 ){
			//반복문 돌면서 전송된 아이템을 불러온다.
			for(FileItem item:formItems){
				if(!item.isFormField()){
					// input type="file" 로 전송된 파일이라면(다른 type 거르기)
					
					// 원본 파일명
					String orgFileName=new File(item.getName()).getName();
					// 파일 사이즈
					long fileSize=item.getSize();
					// 저장할 파일명을 겹치지 않게 지정한다.
					String saveFileName=System.currentTimeMillis()+orgFileName; //currentTimeMillis() 1970년 1월 1일 자정을 기준으로 경과시간을 얻어낸다. 천분의 1초단위로 , (긴~ 숫자)
					// 파일 시스템에 저장할 전체 경로를 구성한다.
					String filePath=uploadPath+File.separator+saveFileName;	//separator => 슬래쉬를 얻어옴.(윈도우냐 리눅스냐에 따라 다르게, 윈도우는 \, 리눅스는/)
						//c:\xxx\WebContent\ upload     \      12355158219kim.png 이런식으로(윈도우의 경우)
						
					// 파일을 위의 경로에 실제로 저장한다.  
					File storeFile=new File(filePath);		//클라이언트가 파일을 저장하면 서버가 알아서 temporary? 폴더에 숫자가 막 붙은 파일을 저장한다.
					item.write(storeFile);					//서버가 저장한 temporary 폴더에서 얻어온다.
					//FileDto에 정보담기
					dto.setOrgFileName(orgFileName);
					dto.setSaveFileName(saveFileName);
					dto.setFileSize(fileSize);
					
				}else{
					// input type="file" 이 아닌 일반 input 요소라면 ex) text,email,password ...
					if(item.getFieldName().equals("title")){
						//제목 읽어오기
						String title=item.getString("utf-8");	//인코딩 필터를 거쳐도 인코딩이 되지 않기때문에 title이 맞다면 utf-8로 인코딩해서 가져오겠다!
						//FileDto 에 제목 담기
						dto.setTitle(title);
					}
				}//if
			}//for
			//작성자담기
			String id=(String)session.getAttribute("id");
			dto.setWriter(id);
			//DB에 파일정보 저장하기
			isSuccess=FileDao.getInstance().insert(dto);
		}//if()
	}catch(Exception e){
		//예외가 발생하면 에러 페이지를 응답한다.(500번 에러페이지)
		response.sendError(500, e.getMessage());	
		return;
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-success">
			<strong><%=dto.getOrgFileName() %></strong> 파일을 저장 했습니다.
			<a class="alert-link" href="${pageContext.request.contextPath }/file/list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			저장 실패했습니다.
			<a class="alert-link" href="${pageContext.request.contextPath }/file/private/upload_form.jsp">다시 업로드 하러 가기</a>
		</p>
	<%} %>
</div>
</body>
</html>