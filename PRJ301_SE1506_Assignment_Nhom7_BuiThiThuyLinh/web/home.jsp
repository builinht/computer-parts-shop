
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./Assets/css/base.css">
        <link rel="stylesheet" href="./Assets/css/main.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        
        
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="app">
            
            <div class="app__container">
                <div class="grid">
                    <div class="grid__row app__content">
                        <div class="grid__column-2">
                            <nav class="category">
                                <h3 class="category-heading">
                                    <i class="category-heading-icon fas fa-list"></i>
                                    Category
                                </h3>

                                <ul class="category-list">
                                    <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                        <li class="category-item category-item-active">
                                            <a style="text-decoration: none" href="CategoryController?txtCategoryID=${o.categoryID}" class="category-item-link">${o.categoryName}</a>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </nav>
                        </div>

                        <div class="grid__column-10">
                            <div class="home-product">
                                <div class="grid__row">
                                    
                                    <c:forEach items="${sessionScope.LIST_PRODUCT}" var="o">
                                        <div class="grid__column-2-4">
                                                <a style="text-decoration: none;" class="home-product-item" href="DetailController?txtProductID=${o.productID}">
                                                    <div class="home-product-item-img" style="background-image: url(Assets/image/${o.getImage()});">
                                                    </div>
                                                    <h4 class="home-product-item-name">
                                                        ${o.title}</br>
                                                        ${o.supplier}

                                                    </h4>
                                                    <div class="home-product-item-price">
                                                        <span class="home-product-item-price-current">$${o.price}</span>
                                                    </div>

                                                    <div class="home-product-item-action">
                                                        <span class="home-product-item-like home-product-item-like-liked">
                                                            <i class="home-product-item-like-empaty far fa-heart"></i>
                                                            <i class="home-product-item-like-fill fas fa-heart"></i>
                                                        </span>
                                                        <span class="home-product-item-sold">${o.quantity} sản phẩm</span>
                                                    </div>
                                                </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
        
    </body>
</html>
