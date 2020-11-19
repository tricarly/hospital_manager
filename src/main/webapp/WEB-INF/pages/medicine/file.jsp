<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/medicine/file" method="post" enctype="multipart/form-data">
    <input type="file" name="file" value="">
    <button type="submit">提交</button>
</form>
</body>
</html>
