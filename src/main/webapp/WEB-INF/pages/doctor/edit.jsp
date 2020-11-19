<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>	
	<base href="<%=this.getServletContext().getContextPath() %>/doctor/">
    <title>修改医生</title>
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
<form action="${pageContext.request.contextPath}/doctor/update" method="post" class="definewidth m20">
<input type="hidden" name="did" value="${doctor.did}"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">姓名</td>
        <td><input type="text" name="name" value="${doctor.name}"></td>
    </tr>
    
    <tr>
        <td width="10%" class="tableleft">身份证号</td>
        <td><input type="text" name="cardno" value="${doctor.cardno}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">手机</td>
        <td><input type="text" name="phone" value="${doctor.phone}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">性别</td>
        <td>
            <input type="radio" name="sex" value="1" <c:if test="${doctor.sex==1}">checked</c:if> />男&nbsp;&nbsp;&nbsp;
        	<input type="radio" name="sex"  value="2" <c:if test="${doctor.sex==2}">checked</c:if> />女
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">出生年月</td>
        <td><input type="date" name="birthday" class="Wdate"  value="<fmt:formatDate type="both" value="${doctor.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">年龄</td>
        <td><input type="text" name="age" value="${doctor.age}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">电子邮箱</td>
        <td><input type="text" name="email" value="${doctor.email}"/></td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">所属科室</td>
        <td>
            <c:forEach items="${departmentList}" var="department">
                <input type="checkbox" name="depid" value="${department.dno}"
                    <c:forEach items="${doctor.departmentList}" var="dep">
                        <c:if test="${department.dname == dep.dname}">
                            checked
                        </c:if>
                    </c:forEach>>${department.dname}&nbsp;&nbsp;
            </c:forEach>
        </td>
    </tr>
    <tr>
        <td width="10%" class="tableleft">学历</td>
        <td>
        	<select name="education">
                <option value="1" <c:if test="${doctor.education==1}">selected</c:if>>专科</option>
        		<option value="2" <c:if test="${doctor.education==2}">selected</c:if>>本科</option>
        		<option value="3" <c:if test="${doctor.education==3}">selected</c:if>>研究生</option>
        		<option value="4" <c:if test="${doctor.education==4}">selected</c:if>>博士</option>
        	</select>
        </td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">备注</td>
        <td><textarea name="remark" style="width: 700px;height: 200px">${doctor.remark}</textarea></td>
	</tr>
    <tr>
        <td colspan="2">
			<center>
				<input name="save" id="save" type="submit" class="btn btn-primary" value="保存"/> &nbsp;&nbsp;
				<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
			</center>
		</td>
    </tr>
</table>
    <script type="text/javascript">
        $('#backid').click(function(){
            window.location.href="${pageContext.request.contextPath}/UI/doctorUI/list";
        })

    </script>
</form>
</body>
</html>