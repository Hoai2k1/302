<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

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
                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng nhập</p>
                        <form class="mx-1 mx-md-4" action="/asm/tk/login" method="post">
                        	<div class="text-danger">${message}</div>
                           <div class="form-floating mb-3">
                              <input type="text" class="form-control" id="floatingInput" name="username"
                                 placeholder="Tải khoản">
                              <label for="floatingInput">Tài khoản</label>
                           </div>
                           <div class="form-floating mb-3">
                              <input type="password" class="form-control" name="password" id="floatingPassword"
                                 placeholder="Mật khẩu" >
                              <label for="floatingPassword">Mật khẩu</label>
                           </div>
                           <div class="form-check mb-3">
                              <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberPasswordCheck">
                              <label class="form-check-label" for="rememberPasswordCheck">
                                 Ghi nhớ mật khẩu
                              </label>
                           </div>
                           <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <button class="btn btn-primary btn-lg">Đăng nhập</button>
                           </div>
                        </form>
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