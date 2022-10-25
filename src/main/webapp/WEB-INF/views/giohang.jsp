		<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PS17203_ASM</title>
	<base href="${pageContext.servletContext.contextPath}/">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
</head>
<body>
 <jsp:include page="tieude.jsp"/>

   <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td class="align-middle">
                            <img src="images/${item.image }" style="width: 50px;">${item.name}
                            </td>
                             <c:set var="gia" value="${item.price}"/>
                             <c:set var="gia2" value="${item.price2}"/>
                            <td class="align-middle"><fmt:formatNumber value="${gia}"/> VNĐ</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <a class="btn btn-sm btn-primary btn-minus"  href="/asm/cart/-/${item.id }">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                    </div>
                                    <input type="text" class="form-control form-control-sm  text-center"
                                        value="${item.soluong}">
                                    <div class="input-group-btn">
                                        <a class="btn btn-sm btn-primary btn-plus" href="/asm/cart/+/${item.id }">
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle"><fmt:formatNumber value="${gia2}"/> VNĐ</td>
                            <td class="align-middle"><a class="btn btn-sm btn-primary" href="/asm/cart/delete/${item.id}"><i
                                        class="fa fa-times"></i></a></td>
                        </tr>
                        </c:forEach>
                </table>
                
            </div>
            <div class="col-lg-4">
                <form class="mb-5" action="" >
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div><br>
                
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Tổng</h6>
                             <c:set var="tong" value="${tong}"/>
                            <h6 class="font-weight-medium"><fmt:formatNumber value="${tong}"/></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Giảm</h6>
                            <h6 class="font-weight-medium">${giamgia}</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                             <c:set var="tongtien" value="${tongtien}"/>
                            <h5 class="font-weight-bold"><fmt:formatNumber value="${tongtien}"/></h5>
                        </div>
                        <a class="btn btn-block btn-primary my-3 py-3" href="/asm/cart/thanhtoan">Proceed To Checkout</a>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
   <footer class="py-5 bg-dark">
      <div class="container">
         <p class="m-0 text-center text-white">FPT Polytechnic &copy; Hoài vip pro Forever</p>
      </div>
   </footer>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>