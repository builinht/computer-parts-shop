
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Product Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="./Assets/css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="./Assets/css/main.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <script>
            <c:if test="${sessionScope.DELETE_MESS != null && sessionScope.DELETE_MESS == true}">
                                                                     alert("Update Status Success!");
                <c:remove scope="session" var="DELETE_MESS"/>
            </c:if>
                                    
            <c:if test="${sessionScope.DELETE_MESS == false}">
                                                                    alert("Update Status Fail!");
                <c:remove scope="session" var="DELETE_MESS"/>
            </c:if>
                
            <c:if test="${sessionScope.DELETE_MESS == false}">
                                                                    alert("Update Status Fail! Error Confirm");
                <c:remove scope="session" var="DELETE_MESS"/>
            </c:if>   
                
            <c:if test="${sessionScope.UPDATE_MESS != null && sessionScope.UPDATE_MESS == true}">
                                                                     alert("Update Info Success!");
                <c:remove scope="session" var="UPDATE_MESS"/>
            </c:if>
            
            <c:if test="${sessionScope.INSERT_MESS != null && sessionScope.INSERT_MESS == true}">
                                                                     alert("Insert Success!");
                <c:remove scope="session" var="INSERT_MESS"/>
            </c:if>
                                    
            <c:if test="${sessionScope.INSERT_MESS == false}">
                                                                    alert("Insert Fail!");
                <c:remove scope="session" var="INSERT_MESS"/>
            </c:if>
        </script>
    </head>
    <body>
        <div class="container">
            <c:set var="searchValue" scope="page" value="${param.search}"/>
            <form action="SearchController" >

                <div class="header__search">
                    <div class="header__search-wrap">
                        <input style="border: 1px solid #007bff" type="text" class="header__search-input" name="search" value="${searchValue}" placeholder="TÌM SẢN PHẨM!">
                    </div>
                    <button style="background-color: #435d7d" type="submit" class="header__search-btn">
                        <i class="header__search-btn-icon fas fa-search"></i>
                    </button>
                </div>

            </form>
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><a style="text-decoration: none; color: white" href="ManageProductController">Manage <b>Products</b></a></h2> Welcome <b>${sessionScope.LOGIN_USER.getFullName()}</b>
                            <div style="margin-top: 30px">
                                <ul>

                                    <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                        <li style="display: inline-flex; border: 1px solid black">
                                            <a style="text-decoration: none; color: white; padding: 2.5px 15px 2.5px 15px; background-color: gray " href="CategoryController?txtCategoryID=${o.categoryID}">${o.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="col-sm-6">
                            <a href="#addProductModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.LIST_PRODUCT}" var="o" varStatus="counter">
                            
                            <tr>
                                <td>${ counter.count }</td>
                                <td>${ o.title }</td>
                                <td>
                                    <img src="Assets/image/${ o.image }">
                                </td>
                                <td>$${ o.price }</td>
                                <td>${ o.quantity }</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == true}">
                                            <p style="color: blue">Active</p>
                                        </c:when>
                                            <c:otherwise>
                                                <p style="color: red">Deleted</p>
                                            </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="#editProductModal${o.getProductID()}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                    <c:choose>
                                        <c:when test="${o.isStatus() != true }">
                                            <a href="#updateStatusProductModal${o.getProductID()}" class="delete" data-toggle="modal"><i class="fas fa-trash-restore-alt" data-toggle="tooltip" title="Restore"></i></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#updateStatusProductModal${o.getProductID()}" class="delete" data-toggle="modal"><i class="fas fa-trash" data-toggle="tooltip" title="Delete"></i></a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <!-- Delete Modal HTML -->
                                    <div id="updateStatusProductModal${o.getProductID()}" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="DeleteProductController" method="post">
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Update Status Product</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <div class="modal-body">					
                                                        <p>Are you sure you want to save this ACTION ?</p>
                                                        <p class="text-warning"><small>This action cannot be undone.</small></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="hidden" name="txtProductID" value="${o.getProductID()}">
                                                        <input type="hidden" name="txtStatus" value="${o.isStatus()}">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                        <c:choose>
                                                            <c:when test="${o.status == true}">
                                                                <input type="submit" class="btn btn-danger" value="Delete">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="submit" class="btn btn-danger" value="Restore">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                
                                <td>
                                    <!-- Edit Modal HTML -->
                                    <div id="editProductModal${o.productID}" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="UpdateProductController" method="post">
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Edit Product</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <div class="modal-body">					
                                                        <div class="form-group">
                                                            <label>ID</label>
                                                            <input name="txtProductID" type="text" class="form-control" value="${o.getProductID()}" readonly="true" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Name</label>
                                                            <input name="txtTitle" type="text" class="form-control" value="${o.getTitle()}" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Image</label>
                                                            <input type="hidden" name="txtCurImage" value="${o.getImage()}">
                                                            <input name="txtImage" type="file" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Price</label>
                                                            <input name="txtPrice" type="number" min="0" class="form-control" value="${o.getPrice()}" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Quantity</label>
                                                            <input name="txtQuantity" type="number" min="0" class="form-control" value="${o.getQuantity()}" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Supplier</label>
                                                            <input type="text" name="txtSupplier" class="form-control" value="${o.getSupplier()}" required/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Import Date</label>
                                                            <input type="date" name="txtImportDate" class="form-control"  value="${o.getImportDate()}" required/>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Category</label>
                                                            <select name="txtCategoryID" class="form-select" aria-label="Default select example">
                                                                <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                                                    <option value="${o.getCategoryID()}">${o.getCategoryName()}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                        <input type="submit" class="btn btn-info" value="Save">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="LogoutController"><button type="button" class="btn btn-primary">Logout</button></a>

        </div>
        <!-- Edit Modal HTML -->
        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="AddProductController" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input name="txtTitle" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="txtImage" type="file" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="txtPrice" type="number" min="0" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="txtQuantity" type="number" min="0" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Supplier</label>
                                <input type="text" name="txtSupplier" class="form-control" required/>
                            </div>
                            
                            <div class="form-group">
                                <label>Category</label>
                                <select name="txtCategoryID" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${sessionScope.LIST_CATEGORY}" var="o">
                                        <option value="${o.categoryID}">${o.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <script src="Assets/js/manager.js" type="text/javascript"></script>
    </body>
</html>
