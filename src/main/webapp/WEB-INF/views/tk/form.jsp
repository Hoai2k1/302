<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form:form action="/asm/tk/dk2/${item.id}" modelAttribute="item" method="post">
     <div class="text-danger">${message}</div>
     
	     <fieldset disabled>
					<div class="col">
						<label>ID</label>
						<form:input class="form-control" path="id" name="id1" /></br>
				  	</div>
		</fieldset>
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
          <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
          <div class="form-outline flex-fill mb-0">
             <label class="form-label" for="form3Example3c">Email</label>
             <form:input type="email" path="email" class="form-control" />
          </div>
       </div>
       <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
          <button type="submit" class="btn btn-primary btn-lg">Đăng ký</button>
       </div>
    </form:form>