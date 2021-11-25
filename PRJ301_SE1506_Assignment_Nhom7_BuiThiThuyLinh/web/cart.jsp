

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./Assets/css/base.css">
        <link rel="stylesheet" href="./Assets/css/main.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script>
            <c:if test="${sessionScope.SUCCESS_MESS != null && sessionScope.SUCCESS_MESS == true}">
                                                                     alert("Order Success!");
                <c:remove scope="session" var="SUCCESS_MESS"/>
            </c:if>
                                    
            <c:if test="${sessionScope.SUCCESS_MESS == false}">
                                                                    alert("Order Fail!");
                <c:remove scope="session" var="SUCCESS_MESS"/>
            </c:if>
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div  class="container">
                                <div class="row">
                                    <div style="border: 0.5px solid #435d7d; margin-top: 20px" class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                        <!-- Shopping cart table -->
                                    <c:choose>
                                        <c:when test="${sessionScope.CART == null || empty sessionScope.CART.getCart() }">
                                            <div>
                                                <h1>No Have Product!</h1>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr style="color: #435d7d!important" >
                                                            <th scope="col" class="border-0 bg-light">
                                                                <div class="p-2 px-3 text-uppercase">Product</div>
                                                            </th>
                                                            <th scope="col" class="border-0 bg-light">
                                                                <div class="py-2 text-uppercase">Price</div>
                                                            </th>
                                                            <th scope="col" class="border-0 bg-light">
                                                                <div class="py-2 text-uppercase">Quantity</div>
                                                            </th>
                                                            <th scope="col" class="border-0 bg-light">
                                                                <div class="py-2 text-uppercase">Delete</div>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set var="list" value="${sessionScope.CART.getCart().values()}"/>
                                                        <c:forEach items="${list}" var="orderDeail">
                                                            <c:set var="totalPrice" scope="page" value="${pageScope.totalPrice + (orderDeail.getQuantity() * orderDeail.getProduct().getPrice())}"/>
                                                            <tr>
                                                                <th scope="row">
                                                                    <div class="p-2">
                                                                        <img src="Assets/image/${orderDeail.getProduct().getImage()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                        <div class="ml-3 d-inline-block align-middle">
                                                                            <h5 class="mb-0"> ${orderDeail.getProduct().getTitle()}</h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                        </div>
                                                                    </div>
                                                                </th>
                                                                <td class="align-middle"><strong>$${orderDeail.getProduct().getPrice()}</strong></td>
                                                                <td class="align-middle">
                                                                    <form action="UpdateCartController" method="post">
                                                                        <input type="hidden" name="txtProductID" value="${orderDeail.getProduct().getProductID()}"/>
                                                                        <input style="width: 50px; height: 30px" type="number" name="txtCurrentQuantity" value="${orderDeail.getQuantity()}" min="1" />
                                                                        <button style="background-color: #03A9F4" type="submit" name="action" class="btn btn-danger">Update</button>
                                                                    </form>
                                                                </td>
                                                                <td class="align-middle">
                                                                    <c:url var="DeleteCart" value="DeleteCartController">
                                                                        <c:param name="txtProductID" value="${orderDeail.getProduct().getProductID()}"/>
                                                                    </c:url>
                                                                    <a href="${DeleteCart}" class="text-dark btn btn-danger">
                                                                        Delete
                                                                    </a>
                                                                </td>
                                                            </tr> 
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div style="border: 0.5px solid #435d7d" class="row py-5 p-4 bg-white rounded shadow-sm">
                                <div class="col-lg-6" style="border: 2px solid #435d7d!important; border-radius: 10px;">
                                
                                    
                                    
                                    <div class="p-4">
                                        <a style="margin-top: 33.3%; color: white" class="btn btn-dark rounded-pill py-2 btn-block" href="HomeController">Add More Product</a>
                                    </div>
                                    
                                </div>
                            <c:if test="${sessionScope.CART != null && not empty sessionScope.CART.getCart()}">
                                <div style="border: 2px solid #435d7d!important; border-radius: 10px;" class="col-lg-6">
                                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Into Money: </div>
                                    <div class="p-4">
                                        <ul class="list-unstyled mb-4">
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Amount</strong><strong>$${pageScope.totalPrice}</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Transport fee</strong><strong>Free ship</strong></li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total Amount</strong>
                                                <h5 class="font-weight-bold">$${pageScope.totalPrice}</h5>
                                            </li>
                                        </ul>
                                                <c:url var="total" value="PayController">
                                                    <c:param name="txtTotal" value="${pageScope.totalPrice}"/>
                                                </c:url>
                                        <a style="color: white" href="${total}" class="btn btn-dark rounded-pill py-2 btn-block">Buy</a>
                                    </div>
                                </div>
                                
                            </c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
