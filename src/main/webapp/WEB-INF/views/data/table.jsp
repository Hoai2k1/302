<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<table border="1" class="table">
		<tr>
			<th>Id</th>
			<th><a href="/product/sort?field=name">Tên sản phẩm</a></th>
			<th>Hình</th>
			<th><a href="/product/sort?field=price">Giá gốc</a></th>
			<th><a href="/product/sort?field=price">Giá hiện tại</a></th>	
			<th>Loại</th>
			<th>edit</th>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.image}</td>
				 <c:set var="gia" value="${item.price}"/>
				 <c:set var="gia2" value="${item.price2}"/>
	                        
				<td><fmt:formatNumber value="${gia2}"/></td>
				<td><fmt:formatNumber value="${gia}"/></td>
				<td>${item.category.name}</td>
				<td>
					<a href="/asm/quanly/edit/${item.id}"><i class="fa-solid fa-pen"></i></a>
					<a href="/asm/quanly/delete/${item.id}"><i class="fa-regular fa-trash-can"></i></a>
					
				</td>
			</tr>
		</c:forEach>
	</table>