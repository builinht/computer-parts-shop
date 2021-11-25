
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Product Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./Assets/css/base.css">
        <link rel="stylesheet" href="./Assets/css/main.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <link href="./assets/style.css" rel="stylesheet" type="text/css"/>
        
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 320px !important;
                height: 323px !important;
                object-fit: cover;
                background-position: top center!important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div  class="app">
            <div class="app__container">
            <div  class="container">
                <div class="row">
                    <div class="grid">
                    <div class="grid__row app__content">
                        
                    
                    <div class="grid__column-2">
                        <nav style="background-color: #fff" class="category">
                            <h3 class="category-heading">
                                <i class="category-heading-icon fas fa-list"></i>
                                Category 
                            </h3>

                            <ul style="text-decoration: none" class="category-list">
                            <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                <li class="category-item category-item-active">
                                    <a href="CategoryController?categoryID=${o.categoryID}" class="category-item-link">${o.categoryName}</a>
                                </li>
                            </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-sm-9">
                        <div style="margin-top: 100px; margin-bottom: 100px; margin-left: 20px" class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img src="Assets/image/${requestScope.PRODUCT.image}"></a></div>
                                            </div> <!-- slider-product.// -->
                                            <div class="img-small-wrap">
                                            </div> <!--  slider-nav.// -->
                                        </article> <!-- gallery-wrap .end// -->
                                    </aside>
                                    <aside class="col-sm-7">
                                        <article class="card-body p-5">
                                            <h3 class="title mb-3">${requestScope.PRODUCT.title}</h3>

                                            <p class="price-detail-wrap"> 
                                                <span class="price h3 text-warning"> 
                                                    <span class="currency">US </span><span class="num">$${requestScope.PRODUCT.price}</span>
                                                </span> 
                                            </p> <!-- price-detail-wrap .// -->
                                            <dl class="item-property">
                                                <dt>Supplier</dt>
                                                <dd><p>
                                                        ${requestScope.PRODUCT.supplier}

                                                    </p></dd>
                                            </dl>

                                            <hr>
                                            
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <dl class="param param-inline">
                                                        <dt>WareHouse: </dt>
                                                        <dd>
                                                            <p>${requestScope.PRODUCT.quantity}</p>
                                                        </dd>
                                                    </dl>  <!-- item-property .// -->
                                                </div> <!-- col.// -->

                                            </div> <!-- row.// -->
                                            <hr>
                                            <c:url var="AddCart" value="AddToCartController">
                                                <c:param name="txtProductID" value="${requestScope.PRODUCT.productID}"/>
                                                <c:param name="txtImage" value="${requestScope.PRODUCT.image}"/>
                                                <c:param name="txtTitle" value="${requestScope.PRODUCT.title}"/>
                                                <c:param name="txtSupplier" value="${requestScope.PRODUCT.supplier}"/>
                                                <c:param name="txtQuantity" value="${requestScope.PRODUCT.quantity}"/>
                                                <c:param name="txtPrice" value="${requestScope.PRODUCT.price}"/>
                                                <c:param name="txtImportDate" value="${requestScope.PRODUCT.importDate}"/>
                                                <c:param name="txtCategoryID" value="${requestScope.PRODUCT.categoryID}"/>
                                            </c:url>
                                            <!--<a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>-->
                                            <a href="${AddCart}" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                        </article> <!-- card-body.// -->
                                    </aside> <!-- col.// -->
                                </div> <!-- row.// -->
                            </div> <!-- card.// -->


                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
