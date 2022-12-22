<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">수정/삭제</h1>
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
	                        <form>
	                           <div class="form-group">
	                               <label>Bno</label>
	                               <input class="form-control" name="bno" readonly value="<c:out value='${board.bno}'/>">
	                           </div>	
	                           <div class="form-group">
	                               <label>Title</label>
	                               <input class="form-control" name="title" value="<c:out value='${board.title}'/>">
	                           </div>	
	                           <div class="form-group">
	                                <label>Content</label>
	                                <textarea class="form-control" rows="3" name="content" ><c:out value='${board.content}'/></textarea>
	                           </div>
	                           <div class="form-group">
	                               <label>Writer</label>
	                               <input class="form-control" name="writer" value="<c:out value='${board.writer}'/>">
	                           </div>
	                           <button class="btn btn-default" data-oper='modify'>수정</button>
														 <button class="btn btn-danger" data-oper='remove'>삭제</button>
	                           <button class="btn btn-info" data-oper='list'>리스트</button>	                              												
													</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<script type="text/javascript">
$(document).ready(function(){
	
	var myform = $("form");
	
	$('.btn').click(function(e){
		
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		console.log(oper);
		
		if(oper==='list'){
			self.location = "/board/list";
		}else if(oper ==='remove'){
			//폼 태그에 action, method 지정 필요
			myform.attr("action", "/board/remove").attr("method", "post");
			myform.submit();
		}else if(oper ==='modify'){
			myform.attr("action", "/board/modify").attr("method", "post");
			myform.submit();
		}
		
	});
});
</script>

<%@include file="../includes/footer.jsp"%>