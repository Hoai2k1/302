<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
 
</head>
<body>
	<section class="vh-100" style="background-color: #eee;">
   <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
         <div class="col-lg-12 col-xl-11">
            <div class="card text-black" style="border-radius: 25px;">
               <div class="card-body p-md-5">
                  <div class="row justify-content-center">
                     <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng ký</p>
                         <form:form action="/asm/tk/dk" modelAttribute="item" method="post">
                         <div class="text-danger">${message}</div>
                           <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                 <label class="form-label" for="form3Example1c" >Tên đăng nhập</label>
                                 <form:input class="form-control" path="username"  placeholder="Tên Sản phẩm?"/>
                              </div>
                           </div>
                           
                           <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                 <label class="form-label" for="form3Example4c">Mật khẩu</label>
                                 <form:input type="password"  path="password" class="form-control" />
                              </div>
                           </div>
                           <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                 <label class="form-label" for="form3Example4cd">Nhập lại mật khẩu</label>
                                 <input type="password" name="pass2" class="form-control" />
                              </div>
                           </div>
                           <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                 <label class="form-label" for="form3Example3c">Email</label>
                                 <form:input type="email" path="email" class="form-control" />
                              </div>
                           </div>
                           <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <button type="submit" class="btn btn-primary btn-lg" >Đăng ký</button>
                           </div>
                        </form:form>
                     </div>
                     <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                           class="img-fluid" alt="Sample image">
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>