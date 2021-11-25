
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./Assets/css/base.css">
        <link rel="stylesheet" href="./Assets/css/main.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <script>
            <c:if test="${sessionScope.REGISTER_MESS != null && sessionScope.REGISTER_MESS == true}">
                                                                     alert("Register Success!");
                <c:remove scope="session" var="REGISTER_MESS"/>
            </c:if>
                                    
            <c:if test="${sessionScope.REGISTER_MESS == false}">
                                                                    alert("Register Fail!");
                <c:remove scope="session" var="REGISTER_MESS"/>
            </c:if>
        </script>
    </head>
    <body>
        <div class="app">
        <%--<jsp:include page="header.jsp"/>--%>
        <form action="LoginController" method="POST">   
            <div class="modal-body">
                <div class="form-authen" >
                    <div class="form-container">
                        <div class="form-header">
                            <h3 class="form-heading">Đăng Nhập</h3>
                            <span class="form-swith-btn">
                                <a style="text-decoration: none" href="register.jsp" class="form-swith-btn">Register</a>
                            </span>
                        </div>
                        <div class="form-input">
                            <div class="form-group">
                                <input type="text" name="txtUserID" class="form-input-DK" placeholder="Nhập ID của bạn">

                            </div>
                            <div class="form-group">
                                <input type="password" name="txtPassword" class="form-input-DK" placeholder="Nhập Password của bạn">

                            </div>
                        </div>
                        <c:if test="${sessionScope.LOGIN_FAIL != null && sessionScope.LOGIN_FAIL == true}">
                            <h3 id="loginfail" style="color: red">That User Not Found!</h3>
                            <c:remove scope="session" var="LOGIN_FAIL"></c:remove>
                        </c:if>
                        <div class="form-controls">
                            <input type="reset" class="btn btn-back btn-normal" value="Reset">
                            <input type="submit" class="btn btn-primary" value="Login" name="action">
                        </div>
                            <br>

                    </div>
                    

<!--                    <div class="form-social">
                        
                    </div>-->
                </div>
            </div>
        </form>
        <script type="text/javascript">
            function HideLabel() {
                var seconds = 3;
                setTimeout(function () {
                    document.getElementById("loginfail").style.display = "none";
                }, seconds * 1000);
            };
            
            HideLabel();
        </script>
        <%--<jsp:include page="footer.jsp"/>--%>
        </div>
    </body>
</html>
