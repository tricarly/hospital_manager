<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery-3.4.1.js"></script>
</head>
<body>
<script type="text/javascript">
    alert("您还没有登录，请登录后再查看这些！");
    parent.location.href="${pageContext.request.contextPath}/UI/topage/main";
</script>
</body>
</html>
