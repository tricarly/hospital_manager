<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>门诊医生</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery-3.4.1.js"></script>

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

<form action="${pageContext.request.contextPath}/doctor/list" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
	<tr>
	  <td width="10%" class="tableleft">医生姓名：</td>
	  <td><input type="text" id="name" name="name" value="${name}" placeholder="医生姓名"/></td>
	  <td width="10%" class="tableleft">科室：</td>
	  <td>
	    <select name="dno" id="department">
			<option value="0">==请选择==</option>
			<c:forEach items="${departmentList}" var="department">
			<option value="${department.dno}" <c:if test="${dno==department.dno}">selected</c:if>>${department.dname}</option>
			</c:forEach>
        </select>
	  </td>
	</tr>
	<tr>
	  <td colspan="6">
	    <center>
			<input id="find" name="find" type="submit" class="btn btn-primary" value="查询"/>
			<input id="reset" name="ret" type="button" class="btn btn-primary" value="清空"/>
		</center>
	  </td>
	 </tr>
</table>
</form>
   
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th><input type="checkbox" id="checkall" onChange="checkall();"></th>
        <th>医生编号</th>
        <th>医生姓名</th>
        <th>联系方式</th>
        <th>所属科室</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    	 <c:forEach items="${pageInfo.list}" var="doctor" varStatus="i">
			 <tr>
				 <td><input type="checkbox" value="${doctor.did}" name="" class="one"></td>
				 <td>${i.count}</td>
				 <td>${doctor.name}</td>
				 <td>${doctor.phone}</td>
				 <td>
					 <c:forEach items="${doctor.departmentList}" var="department">
					 	&nbsp;&nbsp;${department.dname}
				 	 </c:forEach>
				 </td>
				 <td><input type="button" class="btn btn-success updateDoc" id="${doctor.did}"value="更新">
					 <input type="button" class="btn btn-success viewDoc" id="${doctor.did}" value="查看详情">
				 </td>
			 </tr>
		 </c:forEach>
	 </tbody>
  </table>
  
  <table class="table table-bordered table-hover definewidth m10" >
  	<tr>
  		<th colspan="5">
			<div class="inline pull-right page">
				
          		<a href="${pageContext.request.contextPath}/doctor/list?page=1&size=${pageInfo.pageSize}" >首页</a>
				<c:choose>
					<c:when test="${pageInfo.hasPreviousPage}">
						<a href="${pageContext.request.contextPath}/doctor/list?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/doctor/list?page=1&size=${pageInfo.pageSize}">上一页</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pageInfo.hasNextPage}">
						<a href="${pageContext.request.contextPath}/doctor/list?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/doctor/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">下一页</a>
					</c:otherwise>
				</c:choose>
          		<a href="${pageContext.request.contextPath}/doctor/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a>
          
		  &nbsp;&nbsp;&nbsp;共<span class='current'>${pageInfo.total}</span>条记录
		  	共<span class='current'>${pageInfo.pages}</span>页
			当前第<span class='current'>${pageInfo.pageNum}</span>页
		  
		  </div>
		 <div>
			 <button type="button" class="btn btn-success" id="addDoc">添加新医生</button>
			 <button type="button" class="btn btn-success" id="delAll">批量删除</button>
		 </div>
		 
		 </th>
	</tr>
  </table>
<script type="text/javascript">
	$("#addDoc").click(function (){
		window.location="${pageContext.request.contextPath}/UI/doctorUI/toadd";
	})

	$(".viewDoc").click(function (){
		var id = this.id;
		window.location="${pageContext.request.contextPath}/doctor/view?did="+id;
	})

	$(".updateDoc").click(function (){
		var id = this.id;
		window.location="${pageContext.request.contextPath}/doctor/toupdate?did="+id;
	})

	$("#reset").click(function (){
		var name=document.getElementById("name");
		var department=document.getElementById("department");
		name.value=null;
		department.value=0;
	})

	$("#delAll").click(function (){
		var did="";
		$(".one:checked").each(function() {
			did = did + "," + $(this).val();
		})
		did = did.substring(1);
		if (did == "") {
			alert("请先选择要删除的用户!");
			return;
		}
		if (confirm("您确定要删除吗？")) {
			window.location = "${pageContext.request.contextPath}/doctor/deleteButch?did="+did;
		}
	})
</script>
</body>
</html>
