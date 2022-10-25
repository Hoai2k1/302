<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/">
<title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
</head>
<body>
<%-- 	<jsp:include page="../tieude.jsp"/> --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
  	<a class="navbar-brand" href="/asm/home">Shop Điện Thoại AZ</a>
	  <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
	  	<li class="nav-item"><a class="nav-link active" aria-current="page" href="/asm/quanly">
						<i class="fa-solid fa-chart-simple"></i> Quản lý</a></li>
	    <li class="nav-item dropdown">
	    <li class="nav-item"><a class="nav-link active" aria-current="page" href="/asm/tk/edit">
						<i class="fa-solid fa-chart-simple"></i> Tài khoản</a></li>
	    <li class="nav-item dropdown">
	  </ul>
  </div>
  </nav>
	<jsp:include page="form.jsp"/>
	<hr>
	<jsp:include page="table.jsp"/>
	
	   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>