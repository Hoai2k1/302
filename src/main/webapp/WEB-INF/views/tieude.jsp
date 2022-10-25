<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

 <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container px-4 px-lg-5">
         <a class="navbar-brand" href="/asm/home">Shop Điện Thoại AZ</a>
         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
               class="navbar-toggler-icon"></span></button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
               <li class="nav-item"><a class="nav-link active" aria-current="page" href="/asm/home"><i
                        class="bi bi-house-door"></i> Trang chủ</a></li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-align-justify"></i>
                     Sản phẩm
                  </a>
                  	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                   <c:forEach var="sp" items="${listsp}">
                     <li><a class="dropdown-item" href="/asm/sanpham/loai/${sp.id }">${sp.name }</a></li>
                   
                   </c:forEach>
                   </ul>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-github"></i>
                     Tài khoản
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <li><a class="dropdown-item" href="/asm/tk/login">Đăng nhập</a></li>
                     <li><a class="dropdown-item" href="/asm/tk/quenmk">Quên mật khẩu</a></li>
                     <li><a class="dropdown-item" href="/asm/tk/index">Đăng ký</a></li>
                     <li>
                        <hr class="dropdown-divider">
                     </li>
                     <li><a class="dropdown-item" href="/asm/tk/dangxuat">Đăng xuất</a></li>
                     <li><a class="dropdown-item" href="/asm/tk/dmk">Đổi mật khẩu</a></li>
                     <li><a class="dropdown-item" href="/asm/tk/edit">Cập nhật hồ sơ</a></li>
                     <li>
                        <hr class="dropdown-divider">
                     </li>
                     <li><a class="dropdown-item" href="#">Đơn hàng</a></li>
                     <li><a class="dropdown-item" href="#">Hàng đã mua</a></li>
                  </ul>
               </li>
<!--                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/asm/quanly"> -->
<!-- 					<i class="fa-solid fa-chart-simple"></i> Quản lý</a></li> -->
<!--                <li class="nav-item dropdown"> -->
               <li>
                  <form class="input-group mx-4" style="max-width: 400px" action="/asm/home/name">
                     <input type="text" class="form-control" placeholder="Bạn muốn tìm gì?" name="timname">
                     <button class="btn btn-outline-secondary" id="button-addon2">Tìm kiếm</button>
                   </form>
               </li>
            </ul>
            <div class="btn-group">
               <a type="button" class="btn btn-outline-dark dropdown-toggle"  href="/asm/cart"> 
                  <i class="bi-cart-fill me-1"></i>
                  Cart
                  <span class="badge bg-dark text-white ms-1 rounded-pill">${slgiohang }</span>
               </a>
            </div>
         </div>
      </div>
   </nav>
   