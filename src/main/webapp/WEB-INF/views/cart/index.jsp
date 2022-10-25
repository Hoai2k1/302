<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>x
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<table border="1" style="width:100%">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Amount</th>
		<th>Hình</th>
		<th></th>
	</tr>
<c:forEach var="item" items="${items}">
<form action="/cart/update" method="post">
	<input type="hidden" name="id" value="${item.id}">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td><img src="images/${item.image}" style="width: 100px"></td>
		<td>${item.price}</td>
		<td><input name="soluong" value="${item.soluong}" 
					onblur="this.form.submit()" style="width:50px;"></td>
		<td>${item.price * item.soluong}</td>
		<td>
			<a href="/cart/remove/${item.id}">Remove</a>
		</td>
	</tr>
</form>
</c:forEach>
</table>
<a href="/cart/clear">Clear Cart</a>
<a href="/item/index">Add more</a>
</body>
</html>