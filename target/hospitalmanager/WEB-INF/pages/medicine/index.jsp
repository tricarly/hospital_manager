<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
	String imgPath=request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+"/Hospital-pic/";
%>
<!DOCTYPE html>
<html>
<base href="<%=this.getServletContext().getContextPath() %>/medicine/">
<head>
    <title>药品查询</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/common.js"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
    <script type="text/javascript">
	
    </script>
</head>
<body>

<form action="${pageContext.request.contextPath}/medicine/list" method="post" class="definewidth m20">
	<table class="table table-bordered table-hover definewidth m10">
	    <tr>
	        <td width="10%" class="tableleft">药品名称：</td>
	        <td><input type="text" id="name" name="name" value="${name}"/></td>
			
	        <td width="10%" class="tableleft">药品类型：</td>
	        <td>
		        <select name="type" id="type">
		        	<option value="0" >==请选择==</option>
					<option value="1" <c:if test="${type==1}">selected</c:if>>处方药</option>
			        <option value="2" <c:if test="${type==2}">selected</c:if>>中药</option>
			        <option value="3" <c:if test="${type==3}">selected</c:if>>西药</option>
		        </select>
	        </td>
	    </tr>
	    <tr>
			  <td colspan="4">
				<center>
					<input id="find" name="find" type="submit" class="btn btn-primary" value="查询"/>
			  		<input id="reset" name="reset" type="button" class="btn btn-primary" value="清空"/>
				</center>
	        </td>
	    </tr>
	</table>
</form>
   
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>药品编号</th>
        <th>药品名称</th>
        <th>图片</th>
        <th>药品类型</th>
        <th>简单描述</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
	<c:forEach items="${pageInfo.list}" var="medicine" varStatus="i">
		<tr>
			<td><input type="checkbox" name="" class="one" value="${medicine.mid}"></td>
			<td>${i.count}</td>
			<td>${medicine.name}</td>
			<td><img src="/upload/hospital/${medicine.picture}" width="100px" height="100px"/></td>
			<td><c:if test="${medicine.type==1}">处方药</c:if><c:if test="${medicine.type==2}">中药</c:if><c:if test="${medicine.type==3}">西药</c:if></td>
			<td>${medicine.descs}</td>
			<td><input type="button" class="btn btn-success updateMed" id="${medicine.mid}"value="更新">
				<input type="button" class="btn btn-success viewMed" id="${medicine.mid}" value="查看详情">
			</td>
		</tr>
	</c:forEach>
    </tbody>
  </table>
  
  <table class="table table-bordered table-hover definewidth m10" >
  	<tr><th colspan="5">  
  			<div class="inline pull-right page">
				<a href="${pageContext.request.contextPath}/medicine/list?page=1&size=${pageInfo.pageSize}" >首页</a>
				<c:choose>
					<c:when test="${pageInfo.hasPreviousPage}">
						<a href="${pageContext.request.contextPath}/medicine/list?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/medicine/list?page=1&size=${pageInfo.pageSize}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageInfo.hasNextPage}">
						<a href="${pageContext.request.contextPath}/medicine/list?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/medicine/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">下一页</a>
					</c:otherwise>
				</c:choose>
				<a href="${pageContext.request.contextPath}/medicine/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a>

				&nbsp;&nbsp;&nbsp;共<span class='current'>${pageInfo.total}</span>条记录
				共<span class='current'>${pageInfo.pages}</span>页
				当前第<span class='current'>${pageInfo.pageNum}</span>页
		  </div>
		 <div>
			<button type="button" class="btn btn-success" id="newNav">添加新药</button>	
			<button type="button" class="btn btn-success" id="delAll">批量删除</button>
		 </div>
		 
		 </th></tr>
  </table>
<script type="text/javascript">
	$("#newNav").click(function (){
		window.location="${pageContext.request.contextPath}/UI/medicineUI/toadd";
	})

	$(".viewMed").click(function (){
		var id = this.id;
		window.location="${pageContext.request.contextPath}/medicine/view?mid="+id;
	})

	$(".updateMed").click(function (){
		var id = this.id;
		window.location="${pageContext.request.contextPath}/medicine/toupdate?mid="+id;
	})

	$("#reset").click(function (){
		var name=document.getElementById("name");
		var type=document.getElementById("type");
		name.value=null;
		type.value=0;
	})

	$("#delAll").click(function (){
		var mid="";
		$(".one:checked").each(function() {
			mid = mid + "," + $(this).val();
		})
		mid = mid.substring(1);
		if (mid == "") {
			alert("请先选择要删除的用户!");
			return;
		}
		if (confirm("您确定要删除吗？")) {
			window.location = "${pageContext.request.contextPath}/medicine/deleteButch?mid="+mid;
		}
	})
</script>
</body>
</html>
