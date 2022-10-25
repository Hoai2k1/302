<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<jsp:include page="tieude.jsp"/>
<table border="1" style="width:100%">
	<tr>
		<th>Id</th>
		<th>Tên sản phẩm</th>
		<th>Giá hiện tại</th>
		<th>Số lượng</th>
		<th>Giá</th>
		<th>Hình</th>
		<th></th>
	</tr>
<c:forEach var="item" items="${items}">
<form action="asm/quanly/update" method="post">
	<input type="hidden" name="id" value="${item.id}">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.price}</td>
		<td><input name="qty" value="${item.qty}" 
					onblur="this.form.submit()" style="width:50px;"></td>
		<td>${item.price * item.qty}</td>
		<td><img src="images/${item.hinh}" style="width: 100px"></td>
		<td>
			<a href="/cart/remove/${item.id}">Remove</a>
		</td>
	</tr>
</form>
</c:forEach>
</table>
<a href="asm/quanly/cart/clear">Clear Cart</a>
<a href="asm/quanly/item/index">Add more</a>
</body>
</html>