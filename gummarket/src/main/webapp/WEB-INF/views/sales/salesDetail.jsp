<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<script>
	
	//삭제버튼 누르면 alert
	function confirmDel(n) {
	   alert("글을 삭제할까요?");
	   console.log(n);
	   if(confirm("삭제되었습니다.")){
	    frm.sNo.value= n;
	    console.log(n);
		frm.submit();
	  
	   }else{
	    return false;
	   }
	  }
	
	//글 수정
	function updateSales(n) {
		frm1.sNo.value=n;
		frm1.submit();
		//location.href='updateSales.do';
	}

	
//-------------------------------------------------------------//

	//댓글 불러오기 ajax
	$(document).ready(function(){
		console.log($('#cMainNum'));
		//전체 데이터 출력.
		$.ajax({
			url: 'SelectCommentServ',
			dataType: 'json',
			data: {
				sNo:$('#cMainNum').val()
			},
			success: itemListFnc,
			error: function () {
				console.log("으악")
			}
	});
		

	let fields = ['cmId', 'cContents'];
	//댓글 조회 콜백함수
	function itemListFnc(data) {
		console.log(data);	
		let table = $('<table />').attr('border', '0');
		$(table).append(
			$('<tr />').append('<th>닉네임</th><th>댓글</th>')
		);
		for (let i = 0; i < data.length; i++) {
			let tr = $('<tr />').attr('id',data[i]['cNo']);
			for (let field of fields) {
				let td = $('<td />').text(data[i][field]); //<td>C003</td><td>coffe</td> 오브젝트 key값
				$(tr).append(td)
			}
			let delBtn = $('<td><button type="button">삭제</button></td>')
			let updBtn =$('<td><button type="button">수정</button></td>') //수정버튼 추가
			
			delBtn.click(kill);
			updBtn.click(update);
			
			$(tr).append(delBtn);
			$(tr).append(updBtn);

			$(table).append(tr);


		}
		$('#show').append(table);
	}
	
	//댓글 입력 ajax
	$('#reply').on('submit', function (event) {
		event.preventDefault(); //디폴트값은 못들어가게
		let s = $('#reply').serialize();
		console.log(s);

		//폼 전송처리
		$.ajax({
			url: $('#reply').attr('action'), //='../AddItemServ.do'
			method: 'post',
			data: $('#reply').serialize(), //파라미터로 넘김
			dataType: 'json', //받아오는 값
			success: addItemFunc,
			error: function (reject) {
				console.error(reject);
			}
		})
	})
});

	let fields = ['cmId', 'cContents'];
	//입력처리 후 콜백함수
	function addItemFunc(data) { //{itmeNo: ?, itemName:? ......}
		console.log('aaa')
		console.log(data)
		let tr = $('<tr />');
		for (let field of fields) {
			let td = $('<td />').text(data[field]); //<td>C003</td><td>coffe</td> 오브젝트 key값
			$(tr).append(td)
		}
		console.log($('table'))
		let delBtn = $('<td><button type="button">삭제</button></td>')
		let updBtn =$('<td><button type="button">수정</button></td>')
			delBtn.click(kill);
			updBtn.click(update);
			$(tr).append(delBtn);
		$('table').append(tr);
	}
	
	//댓글 삭제하기
	function kill(e) {
		console.log(e.target.parentNode.parentNode);
		//location.href='../DeleteServ.do?itemNo='+$(this).parent().children().eq(0).text();
		$.ajax({
			url: 'DeleteCommentServ',
			data: {
				cNo: $(this).parent().attr('id')
			},
			success: function () {
				e.target.parentNode.parentNode.remove();
			},
			error: function () {
				alert("에러발생!!")
			}
		})
	}
	
	//댓글 수정하기
	function update(){
		
	}
	
</script>

<body id="page-top">

<!-- Begin Page Content -->
	<div class="container-fluid" >
		<!-- DataTales Example -->
		<div class="card shadow mb-4"  style="margin-left: 4rem; margin-right: 4rem">
			<div class="card-header py-3">
				
				<h3 class="m-0 font-weight-bold text-dark" style="text-align: center;" >${list[0].sTitle }
				 <%-- <c:if test="${session.mId == item.mId}">  --%>
				 <%-- <input type="button" id="deleteBtn" class="btn btn-danger" value="글 삭제하기" onclick="confirmDel(${list[0].sNo})" />
					<input type="button" id="updateBtn" class="btn btn-warning" value="글 수정하기" onclick="updateSales(${list[0].sNo})" /> --%>
					<button class="btn btn-sm" id="deleteBtn" onclick="confirmDel(${list[0].sNo})" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255); float:right;"><i class="far fa-trash-alt"></i> 글 삭제</button>
					<button class="btn btn-sm mr-3" id="updateBtn" onclick="updateSales(${list[0].sNo})" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255); float:right;"><i class="far fa-edit"></i> 글 수정</button>
				 <%-- </c:if> --%>
				 </h3>	
			</div>
			<div class="card-body">
				<!-- 여기에 이미지도 넣기 -->
				<div>
					<img src="" alt="제품 상세 이미지" width="100px" height="200px">
				</div>
				<br>
				<p>
				<h6 class="m-0 font-weight-bold text-primary">
					<span>조회 수 : ${list[0].sHit }</span> |
					<span>찜 수 : ${list[0].sLike }</span>
					</h6>
				<p></p>
				<br />
				<p></p>
				<div class="card shadow mb-4">
				<div class="card-header py-3">${list[0].sTitle }</div>
				<div class="card-body">
				판매자 : ${list[0].mId }<br>
				언제 샀어요? : ${list[0].sPurchasedDate }<br>
				얼마나 썼어요? : ${list[0].sUseDays }<br>
				왜 팔아요?: ${list[0].sReason }<br>
				제품 상태는요? 상세하게 기술해주세요~ : ${list[0].sCondition }<br>
				
				
				</div>
				</div>
				<p></p>
				<!-- 좋아요버튼 -->
				
				
				<!-- 댓글조회 -->
				<div class="card shadow mb-4">
				<div class="card-header py-3">댓글</div>
				<div class="card-body">
				<!-- 댓글 보기+ 수정 , 삭제 버튼 -->
					<div id="show"></div>
				
					<%-- <c:forEach var="list" items="${list }">
						${list.cmId }:
						${list.cContents }<br>
					</c:forEach> --%>
				</div>
				</div> 
				<!-- 댓글 입력 -->
				<div class="card mb-2">
					<div class="card-header bg-light">
					        <i class="fa fa-comment fa"></i> REPLY
					</div>
					<div class="card-body">
						<form id="reply" action="CommentInsertServ" method="post">
							<ul class="list-group list-group-flush">
							    <li class="list-group-item">
							    <img class="rounded-circle" src="img/undraw_profile_1.svg" style="width: 2.5rem; height:2.5rem;"><span class="pl-3" style="font-size: 2rem;">${nickname }</span>
								
								<input type="hidden" id="cMainNum" name="cMainNum" value="${list[0].sNo }">
								<textarea class="form-control" id="cContent" name="cContent" rows="3"></textarea>
								<button type="submit" class="btn btn-dark mt-3">post reply</button>
							    </li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			
			
			<br>
			<div class="pb-3 mx-auto"  style="align-items: center;">
				<!-- To do style again -->
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83); color:rgb(255, 255, 255);"><i class="fab fa-gratipay"></i> 좋아요!</button>
				<button class="btn btn-md mr-5"  onclick="location.href='#'" style="background-color: rgb(255, 190, 83);  color:rgb(255, 255, 255);"><i class="fas fa-phone-alt"></i> 연락하기</button>
				<a class="btn btn-danger btn-md" href="#" data-toggle="modal"
					data-target="#logoutModal"><i class="fas fa-bullhorn"></i> 신고하기</a>
			</div>
			
		
			
		</div>
		
		<!-- 
		메인으로 가기 버튼
		<div align="center">
		To do style again
			&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='home.do'">To Main</button> &nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;<button class="btn btn-secondary" style="float: right;" onclick="location.href='salesListAll.do'">To List</button>&nbsp;&nbsp;&nbsp;
		</div>
		 -->
		<form id="frm" name="frm" action="deleteSales.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		<form id="frm1" name="frm1" action="updateSalesForm.do" method="post">
			<input type= "hidden" id="sNo" name="sNo">
		</form>
		
	</div>
	<!-- /.container-fluid -->
	
	<!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- write btn-->
	<a style="position: fixed;
	  right: 1rem;
	  bottom: 4rem;
	  display: inline;
	  width: 2.75rem;
	  height: 2.75rem;
	  text-align: center;
	  color: #fff;
	  background: rgb(252, 221, 33);
	  line-height: 46px;
	  border-radius: 0.35rem" href="writeFHForm.doBB">
	        <i class="fas fa-edit"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	

	
</body>
</html>