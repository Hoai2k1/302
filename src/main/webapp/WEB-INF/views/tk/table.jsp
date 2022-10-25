<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<table border="1" class="table">
		<tr>
			<th>username</th>
			<th>password</th>
			<th>email</th>
			<th>edit</th>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.username}</td>
				<td>${item.password}</td>
				<td>${item.email}</td>
				<td>
					<a href="/asm/tk/edit/${item.id}"><i class="fa-solid fa-pen"></i></a>
					<a href="/asm/tk/delete/${item.id}"><i class="fa-regular fa-trash-can"></i></a>
				</td>
			</tr>
		</c:forEach>
	</table>