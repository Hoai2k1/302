<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS17203_ASM</title>
	<base href="${pageContext.servletContext.contextPath}/">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body>
  <jsp:include page="tieude.jsp"/>
   <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
         <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
               aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
               aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
               aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="https://cdn.tgdd.vn/2022/03/banner/real9proplus-800-200-800x200.png" class="d-block w-100"
                  alt="...">
            </div>
            <div class="carousel-item">
               <img src="https://cdn.tgdd.vn/2022/03/banner/800-200-800x200-41.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
               <img src="https://cdn.tgdd.vn/2022/03/banner/800-200-800x200-12.png" class="d-block w-100" alt="...">
            </div>
         </div>
         <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
         </button>
         <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
         </button>
      </div>
   </header>
   <section class="py-5">
      <div class="container px-4 px-lg-5 mt-5">
         <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="item" items="${items}">
	            <div class="col mb-5">
	               <div class="card h-100">
	                  <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
	                  </div>
	                  	<img src="images/${item.image }" class="m-3">
	                  <div class="card-body p-4">
	                     <div class="text-center">
	                        <h5 class="fw-bolder">${item.name}</h5>
	                        <div class="d-flex justify-content-center small text-warning mb-2">
	                           <div class="bi-star-fill"></div>
	                           <div class="bi-star-fill"></div>
	                           <div class="bi-star-fill"></div>
	                           <div class="bi-star-fill"></div>
	                           <div class="bi-star-fill"></div>
	                        </div>
	                        <c:set var="gia2" value="${item.price2}"/>
	                        <span class="text-muted text-decoration-line-through"> 
	                         	<fmt:formatNumber value="${gia2}"/> VNĐ
	                        </span></br>
	                        <c:set var="gia" value="${item.price}"/>
	                        <fmt:formatNumber value="${gia}"/> VNĐ
	                     </div>
	                  </div>
	                  <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                     <div class="text-center">
	                     	<a class="btn btn-outline-dark mt-auto" href="asm/home/add/${item.id}">Thêm vào giỏ hàng</a>
	                     </div>
	                  </div>
	               </div>
	            </div>
			</c:forEach>
         </div>
      </div>
   </section>
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">FPT Polytechnic &copy; Hoài vip pro Forever</p>
      </div>
   </footer>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>