<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%-- <form:form action="/asm/quanly/index" modelAttribute="item"  enctype="multipart/form-data"></br> --%>
<!-- 		<label>ID</label> -->
<%-- 		<form:input path="id" placeholder="Id?" /></br> --%>
<!-- 		<label>Tên sản phẩm</label> -->
<%-- 		<form:input path="name" placeholder="Tên Sản phẩm?"/></br> --%>
<!-- 		<label>Hình</label> -->
<%-- 		<form:input  path="image" placeholder="Hình" /></br> --%>
<!-- 		<label>Giá củ</label> -->
<%-- 		<form:input path="price2" placeholder="Giá củ?"/></br> --%>
<!-- 		<label>GIá mới</label> -->
<%-- 		<form:input path="price" placeholder="Giá Mới?"/></br> --%>
<!-- 		<label>Loại</label> -->
<%-- 		<form:select path="category"> --%>
<%-- 		<form:options items="${faculties}"/> --%>
<%-- 		</form:select></br> --%>
<!-- 		<hr> -->
<!-- 		<button class="btn btn-outline-dark mt-auto" formaction="/asm/quanly/create">Create</button> -->
<%-- 	</form:form> --%>
		
	
	<div class="col-8 m-auto">
	<form:form action="/asm/quanly/index" modelAttribute="item"></br>
		
			<fieldset disabled>
				<div class="col">
					<label>ID</label>
					<form:input class="form-control" path="id" placeholder="Tên Sản phẩm?"/></br>
			  	</div>
			</fieldset>
			<div class="row mt-3">
			<div class="col ">
				<label for="floatingInput">Tên sản phẩm</label>
			    <form:input class="form-control" path="name" placeholder="Tên Sản phẩm?"/>
			  </div>
			  <div class="col">
				<label for="floatingInput">Loại sản phẩm</label>
				<form:select path="category" class="form-select" aria-label="Default select example">
				<form:options items="${faculties}"/>
				</form:select>
			  </div>
			</div> 
		 	<div class="row mt-3">
			  <div class="col ">
			  	<label for="floatingInput">Giá gốc:</label>
				<form:input path="price2" class="form-control" placeholder="Giá củ?"/>
			  </div>
			 <div class="col ">
			  	<label for="floatingPassword">Giá hiện tại:</label>
		<form:input path="price" class="form-control" placeholder="Giá Mới?"/>
			  </div>
			</div>
		  <div class="mb-3 mt-1">
			  <label for="formFile" class="form-label">Hình:</label>
<%-- 			  <form:input class="form-control" path="image" name="image" placeholder="Hình" /> --%>
			  	<form:input path="image" class="form-control" value="${item.image }" type="file" id="formFile"/>
<!-- 			  	<a href="/asm/quanly/loadhinh">loadhinh</a> -->
			</div>
		 <button class="btn btn-outline-dark mt-auto" formaction="/asm/quanly/create/${item.id}">Create</button>
	   	<button class="btn btn-outline-dark mt-auto" formaction="/asm/quanly/new">New</button>
	</form:form>
	</div>