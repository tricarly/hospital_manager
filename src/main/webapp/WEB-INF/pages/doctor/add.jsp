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
    <title>添加医生</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/ckeditor/ckeditor.js"></script>
 	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/My97DatePicker/WdatePicker.js"></script>

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

</head>
<body>

<form action="${pageContext.request.contextPath}/doctor/add" method="post" class="definewidth m20">

<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td><input type="text" name="name" value=""/></td>
    </tr>
    
    <tr>
        <td width="10%" class="tableleft">身份证号</td>
        <td><input type="text" name="cardno" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">手机</td>
        <td><input type="text" name="phone" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">性别</td>
        <td><input type="radio" name="sex" value="1" checked/>男&nbsp;&nbsp;&nbsp;
        <input type="radio" name="sex"  value="2"/>女</td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">出生年月</td>
        <td><input type="date" name="birthday" class="Wdate" <%--onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"--%> value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">年龄</td>
        <td><input type="text" name="age" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">电子邮箱</td>
        <td><input type="text" name="email" value=""/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">所属科室</td>
        <td>
        	<%--<select name="department">
                <c:forEach items="${departmentList}" var="department">
                    <option value="${department.dno}">${department.dname}</option>
                </c:forEach>
        	</select>--%>
            <c:forEach items="${departmentList}" var="department">
                <input type="checkbox" name="depid" value="${department.dno}">${department.dname}&nbsp;&nbsp;
            </c:forEach>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">学历</td>
        <td>
        	<select name="education">
        		<option value="1">专科</option>
        		<option value="2">本科</option>
        		<option value="3">研究生</option>
        		<option value="4">博士</option>
        	</select>
        </td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td><textarea name="remark"></textarea></td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
			<input name="save" id="save" type="submit" class="btn btn-primary" value="保存"/>
			 &nbsp;&nbsp;
			 <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
</form>
<script type="text/javascript">
    $("#backid").click(function (){
        window.location="${pageContext.request.contextPath}/UI/doctorUI/list";
    })
</script>
</body>
</html>