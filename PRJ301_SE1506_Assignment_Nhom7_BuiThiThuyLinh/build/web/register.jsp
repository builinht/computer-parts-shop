
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./Assets/css/base.css">
        <link rel="stylesheet" href="./Assets/css/main.css">
        <script src="https://kit.fontawesome.com/478461b23c.js" crossorigin="anonymous"></script>
        <script>
            var check = function() {
  if (document.getElementById('password').value ===
    document.getElementById('repass').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
};

        <c:if test="${sessionScope.REGISTER_FAIL != null && sessionScope.REGISTER_FAIL == true}">
                                                                     alert("Password and rePassword not matching!");
                <c:remove scope="session" var="REGISTER_FAIL"/>
            </c:if>
                                    
            
        </script>
    </head>
    <body>
        <div class="app">
            <jsp:include page="header.jsp"/>
            <form action="RegisterController" method="POST">   
                <!--<div class="modal">-->
                <div class="modal-body">
                    <div class="form-authen" >
                        <div class="form-container">
                            <div class="form-header">
                                <h3 class="form-heading">Đăng kí</h3>
                                <span class="form-swith-btn">
                                    <a style="text-decoration: none" href="login.jsp" class="form-swith-btn">Login</a>
                                </span>
                            </div>
                            <div class="form-input">
                                <div class="form-group">
                                    <input type="text" class="form-input-DK" name="txtUserID" placeholder="Nhập ID của bạn">

                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" class="form-input-DK" name="txtPassword" onkeyup="check();" placeholder="Nhập Password của bạn">

                                </div>
                                <div class="form-group">
                                    <input type="password" id="repass" class="form-input-DK" name="txtRePassword" onkeyup="check();" placeholder="Nhập lại Password của bạn">
                                    <span id='message'></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-input-DK" name="txtFullName" placeholder="Nhập Họ và Tên của bạn">

                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-input-DK" name="txtEmail" placeholder="Nhập Email của bạn">

                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-input-DK" name="txtPhone" placeholder="Nhập SDT của bạn">

                                </div>
                                <div class="form-group">
                                    <textarea  class="form-input-DK" name="txtAddress" placeholder="Nhập Address của bạn"></textarea>
                                </div>
                            </div>

                            <div class="form-aside">
                                <p class="form-policy-text">
                                <h3> Bằng việc đăng kí, bạn đồng ý với chúng tôi về Điều Khoản Dịch Vụ & Chính Sách Bảo Mật</h3>
                                </p>
                            </div>

                            <div class="form-controls">
                                <input type="reset" class="btn btn-back btn-normal" value="Reset"/>
                                <input type="submit" class="btn btn-primary" name="action" value="Register"/>
                            </div>

                        </div>
                        <br>
                    </div>
                </div>
                
            </form>
            <jsp:include page="footer.jsp"/>   
        </div>    
    </body>
</html>
