<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getScheme()+"://"+request.getServerName()+":"+
	request.getServerPort()+request.getContextPath()+"/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>
<head>
    <title>优就业-线医疗管理系统</title>
	<meta charset="UTF-8">
	<link rel="icon" href="${pageContext.request.contextPath}/statics/Images/logo_favicon.ico" type="image/x-icon" />
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
            padding-top: 140px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
            font-family: "微软雅黑";
            background: url("../../../statics/Images/yy.jpg");
            background-size: 100%;
            background-repeat: no-repeat;
        }

        .form-signin {
            max-width: 400px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            background: rgba(255,255,255,0.5);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
            font-size: 24px;
            margin-left: 90px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
        }
		
		
		#message{
			font-size: 14px;
			color:red;
			margin-left: 40px;
		}
		
		.input-block-level{
			width: 255px;
			margin-left: 40px;
		}
		.input-medium{
            width: 140px;
			margin-left: 40px;
		}
		.code_images{
			width: 80px;
			height: 35px;
			margin-top: -15px;
			margin-left: 10px;
		}
		
    </style>  
</head>
<body>
<div class="container">
	
    <form class="form-signin" method="post" action="${pageContext.request.contextPath}/user/login">
        <h2 class="form-signin-heading" >在线医疗管理系统</h2>
        <input type="text" name="username" id="username" class="input-block-level" value="" placeholder="用户名"><span id="usernameMsg"></span>
        <input type="password" name="password" id="password" class="input-block-level" placeholder="密码" value=""><span id="passwordMsg"></span>
        <input type="text" name="code" id="code" class="input-medium" placeholder="验证码">
        <img class="code_images"  src="${pageContext.request.contextPath}/user/authImage" onclick="this.src=this.src+'?'"/><span id="codeMsg"></span>
        <p style="text-align: center;">
        <input type= "checkbox" name= "flag" value= "123"/>自动登录
        <input id="login" type="button" value="登录" name="login" class="btn btn-large btn-primary" style="width: 150px;"/>
        <a href="${pageContext.request.contextPath}/UI/usersUI/regist">请先注册</a>
        </p>
    </form>
</div>	
<script type="text/javascript">
    $("#username").blur(function (){
        var username=$("#username").val();
        if ($.trim(username).length==0){
            $("#usernameMsg").html("用户名不能为空！").css("color","red");
        }else {
            $("#usernameMsg").html("");
            return ;
        }
    })

    $("#password").blur(function (){
        var password=$("#password").val();
        if ($.trim(password).length==0){
            $("#passwordMsg").html("密码不能为空！").css("color","red");
        }else {
            $("#passwordMsg").html("");
            return ;
        }
    })

    $("#code").blur(function (){
        var code=$("#code").val();
        if ($.trim(code).length==0){
            $("#codeMsg").html("验证码不能为空！").css("color","red");
        }else {
            $("#codeMsg").html("");
            return ;
        }
    })

    $("#login").click(function(){
        var username=$("#username").val();
        var password=$("#password").val();
        var code=$("#code").val();
        if($.trim(username).length==0){
            $("#usernameMsg").html("用户名不能为空！").css("color","red");
            $("#username").focus();
            return;
        }
        if($.trim(password).length==0){
            $("#passwordMsg").html("密码不能为空！").css("color","red");
            $("#password").focus();
            return;
        }
        if($.trim(code).length==0){
            $("#codeMsg").html("验证码不能为空！").css("color","red");
            $("#code").focus();
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath }/user/checkCode",
            type:"POST",
            dataType:"JSON",
            data:{
                "code":code
            },
            success:function(map){
                if(map.msg){
                    $("form").submit();
                }else{
                    $("#codeMsg").html("验证码输入错误！").css("color","red");
                    return;
                }
            }
        })

    })
</script>
</body>
</html>