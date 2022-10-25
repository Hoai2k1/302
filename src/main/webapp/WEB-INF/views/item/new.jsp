<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
<title>Insert title here</title>

	<base href="${pageContext.servletContext.contextPath}/"/>
</head>
<form:form action="item/add" modelAttribute="item" method="post">
	<div>id</div>
	<form:input path="id"/>
	<div>name</div>
	<form:input path="name"/>
	<div>price</div>
	<form:input path="price"/>
	<div>hinh</div>
	<form:input path="hinh"/>
	<div>
      	<a href="item/add">them</a>
    </div>
</form:form>
</body>
</html>