<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">조회</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ${board.title}
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <div class="form-group">
                               <label>Bno</label>
                               <input class="form-control" name="title" readonly value="<c:out value='${board.bno}'/>">
                           </div>	
                           <div class="form-group">
                               <label>Title</label>
                               <input class="form-control" name="title" readonly value="<c:out value='${board.title}'/>">
                           </div>	
                           <div class="form-group">
                                <label>Content</label>
                                <textarea class="form-control" rows="3" name="content" readonly><c:out value='${board.content}'/></textarea>
                           </div>
                           <div class="form-group">
                               <label>Writer</label>
                               <input class="form-control" name="writer" readonly value="<c:out value='${board.writer}'/>">
                           </div>
                           
                           <form id="pageForm" action="/board/list"  method="get">
															<input type="hidden" name="pageNum" value="${cri.pageNum}">
															<input type="hidden" name="amount" value="${cri.amount}">
															<input type="hidden" name="bno" value="${board.bno}">
													 </form>
                           
                           <button class="btn btn-default modBtn" data-oper="modify">
                           		<a href="/board/modify?bno=<c:out value='${board.bno}'/>">수정</a>
                           </button>
                           <button class="btn btn-default listBtn" data-oper="list">
                           		<a href="/board/list">리스트</a>
                           </button>
                           	                              												
													 <script type="text/javascript">
													  var pageForm = $("#pageForm");
													  
														$(".listBtn").on("click", function(e){
															e.preventDefault();
															
															pageForm.find("input[name='bno']").remove();
															pageForm.submit();
															
														});
														$(".modBtn").on("click", function(e){
															e.preventDefault();
															
															pageForm.attr("action", "/board/modify");
															pageForm.submit();
															
														});
													 </script>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


<%@include file="../includes/footer.jsp"%>