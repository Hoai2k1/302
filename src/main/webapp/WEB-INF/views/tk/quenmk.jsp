<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="text-danger">${message}</div>
	<form action="/asm/tk/quenmk" 	method="post">
	<div class="d-flex flex-row align-items-center mb-4">
        <i class="fas fa-key fa-lg me-3 fa-fw"></i>
        <div class="form-outline flex-fill mb-0">
           <label class="form-label" for="form3Example4cd">Nhập Email</label>
           <input type="email" name="email" class="form-control" />
        </div>
     </div>
     <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
        <button >Đổi mật khẩu</button>
     </div>
     </form>
</body>
</html>