<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <!-- Links for Table  -->
            <!-- Table css Custom fonts for this template -->
            <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
            <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">

            <!-- Custom styles for this template -->
            <link href="css/sb-admin-2.css" rel="stylesheet">

            <!-- Custom styles for this page -->
            <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

			<script type="text/javascript">
			
			/* 여기 생각해봐야할듯.... 줄 선택하면 그 디테일 페이지 가는건데... */
                function getRecord(n) {
                        frm.fhNo.value = n;
                        frm.submit();
                    };
            </script>

        </head>

        <body id="page-top">
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="continer my-auto pl-4 pb-3">
                    <p id="itemCategory" class="h3 mb-0 mt-5 ml-5" style="color: rgb(255, 190, 83); font-weight: 900;">
                        전 체 케 어 리 스 트</p>
                </div>
                <!--table with all recipe-->
                <div class="card shadow mb-4 mr-4 ml-4 pl-3 pr-3">

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>찾기 번호</th>
                                        <th>작성자</th>
                                        <th>찾기 카테고리</th>
                                        <th>찾기 제목</th>
                                        <th>찾기 글 상태</th>
                                        <th>좋아요 수</th>
                                        <th>주기 번호</th>
                                        <th>주기 카테고리</th>
                                        <th>주기 제목</th>
                                        <th>주기 글 상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${list }">
                                        <tr onmouseover="this.style.background='#ebebeb'; this.style.cursor='pointer'"
                                            onmouseout="this.style.background='white'"
                                            onclick="getNotice(${item.sNo})">
                                                <td>${item.fhNo }</td>
                                                <td>${item.fhCategory }</td>
                                                <td>${item.mId }</td>
                                                <td>${item.fhTitle }</td>
                                                <td>${item.fhHide }</td>
                                                <td>${item.fhLike }</td>
                                                <td>${item.ohNo }</td>
                                                <td>${item.ohCategory }</td>
                                                <td>${item.ohTitle }</td>
                                                <td>${item.ohHide }</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- 여기 잘 생각해보기...아님 아예 빼던지.... -->
                            <form id="frm" name="frm" action="rSelectList.doBB" method="post">
                                <input type="hidden" id="rNo" name="rNo">
                            </form>
                        </div>
                    </div>

                    <!-- return to menu btn...  and to the list btn -->
                    <div class="pb-3 mx-auto" style="align-items: center;">
                        <button class="btn btn-md mr-5" type="button" onclick="location.href='adminMain.doBB'"
                            style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);">
                            <i class="fas fa-user-cog fa-2x"></i>&nbsp;  관리자 메인으로</button>
                    </div>
                    <!-- end of return to menu btn...  and to the list btn -->
                </div>

            </div>
            <!-- /.container-fluid -->

            <!-- Table bootstrap -->
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/datatables/jquery.dataTables.min.js"></script>
            <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="js/demo/datatables-demo.js"></script>
        </body>

        </html>