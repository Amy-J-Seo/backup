<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet">
</head>

<body>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Footer -->
            <footer class="sticky-footer" style="background-color: rgb(244, 244, 244); padding-top:0; padding-bottom:0.5rem">
                <div>
                <!-- when not login send user to loginForm.do -->
                <c:if test="${not empty session.mId }">
				 <a href="home.do"><img style="width: 120px; height: 140px; padding-top:15px;" src="img/1market.png"></a>
				</c:if>
                <c:if test="${empty session.mId }">
				 <a href="loginForm.do"><img style="width: 120px; height: 140px; padding-top:15px;" src="img/1market.png"></a>
				</c:if>
                
                
                    <span><a href="cscForm.do" class="customer-service-link">고객센터</a></span>
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; 개껌장터 2021</span>
                    </div>
                </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
<c:if test="${session.role eq 'USER' }">
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6111cf4888a42eb6"></script>
</c:if>

</body>

</html>