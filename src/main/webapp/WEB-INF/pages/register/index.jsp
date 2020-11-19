<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=this.getServletContext().getContextPath() %>/register/">
    <title>门诊查询</title>
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

<form action="${pageContext.request.contextPath}/register/list" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">病历号：</td>
        <td><input type="text" id="rid" name="rid" <c:if test="${rid==0}">value=""</c:if><c:if test="${rid!=0}">value="${rid}"</c:if>/></td>
		
        <td width="10%" class="tableleft">姓名：</td>
        <td><input type="text" id="name" name="name" value="${name}"/></td>
		
        <td width="10%" class="tableleft">科室：</td>
        <td>
        	<select name="department" id="department">
                <option value="0">==请选择==</option>
                <c:forEach items="${departmentList}" var="dep">
                    <option value="${dep.dno}" <c:if test="${department==dep.dno}">selected</c:if>>${dep.dname}</option>
                </c:forEach>
        	</select>
        </td>
    </tr>
    <tr>
		  <td colspan="6">
		  <center>
            <input id="find" name="find" type="submit" class="btn btn-primary" value="查询"/>
			<input name="reset" id="reset" type="button" class="btn btn-primary" value="清空"/>
            </center>
        </td>
    </tr>
</table>
</form>
   
<table class="table table-bordered table-hover definewidth m10" >
   <thead>
    <tr>
    	<th></th>
        <th>病例号</th>
        <th>病人姓名</th>
        <th>主治医生</th>
        <th>挂号时间</th>
        <th>挂号科室</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pageInfo.list}" var="register">
        <tr>
            <td><input type="checkbox" value="${register.rid}" name="" class="one"></td>
            <td>${register.rid}</td>
            <td>${register.name}</td>
            <td><c:forEach items="${doctorList}" var="doc"><c:if test="${register.did==doc.did}">${doc.name}</c:if></c:forEach></td>
            <td><fmt:formatDate value="${register.createtime}" pattern="yyyy-MM-dd HH:mm:SS"></fmt:formatDate></td>
            <td><c:forEach items="${departmentList}" var="dep"><c:if test="${register.department==dep.dno}">${dep.dname}</c:if></c:forEach></td>
            <td><c:if test="${register.state==1}"><p style="color: red">住院</p></c:if><c:if test="${register.state==2}"><p style="color: green">已出院</p></c:if></td>
            <td><input type="button" class="btn btn-success updateReg" id="${register.rid}"value="更新">
                <input type="button" class="btn btn-success viewReg" id="${register.rid}" value="查看详情">
            </td>
        </tr>
    </c:forEach>
    </tbody>
  </table>
  
  <table class="table table-bordered table-hover definewidth m10" >
  	<tr><th colspan="5">  
  		<div class="inline pull-right page">
            <a href="${pageContext.request.contextPath}/register/list?page=1&size=${pageInfo.pageSize}" >首页</a>
            <c:choose>
                <c:when test="${pageInfo.hasPreviousPage}">
                    <a href="${pageContext.request.contextPath}/register/list?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/register/list?page=1&size=${pageInfo.pageSize}">上一页</a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${pageInfo.hasNextPage}">
                    <a href="${pageContext.request.contextPath}/register/list?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/register/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">下一页</a>
                </c:otherwise>
            </c:choose>
            <a href="${pageContext.request.contextPath}/register/list?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a>

            &nbsp;&nbsp;&nbsp;共<span class='current'>${pageInfo.total}</span>条记录
            共<span class='current'>${pageInfo.pages}</span>页
            当前第<span class='current'>${pageInfo.pageNum}</span>页
		</div>
		<div>
		   <button type="button" class="btn btn-success" id="addReg">门诊挂号</button>&nbsp;&nbsp;&nbsp;
		   <button type="button" class="btn btn-success" id="delAll">批量删除</button>
		</div>
	</th></tr>
  </table>
<script type="text/javascript">
    $("#reset").click(function (){
        var name=document.getElementById("name");
        var rid=document.getElementById("rid")
        var department=document.getElementById("department");
        name.value=null;
        rid.value=null;
        department.value=0;
    })

    $("#addReg").click(function (){
        window.location="${pageContext.request.contextPath}/UI/registerUI/toadd";
    })

    $(".viewReg").click(function (){
        var id = this.id;
        window.location="${pageContext.request.contextPath}/register/view?rid="+id;
    })

    $(".updateReg").click(function (){
        var id = this.id;
        window.location="${pageContext.request.contextPath}/register/toupdate?rid="+id;
    })

    $("#delAll").click(function (){
        var rid="";
        $(".one:checked").each(function() {
            rid = rid + "," + $(this).val();
        })
        rid = rid.substring(1);
        if (rid == "") {
            alert("请先选择要删除的用户!");
            return;
        }
        if (confirm("您确定要删除吗？")) {
            window.location = "${pageContext.request.contextPath}/register/deleteButch?rid="+rid;
        }
    })
</script>
  
</body>
</html>
