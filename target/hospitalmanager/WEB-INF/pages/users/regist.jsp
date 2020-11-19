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
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/jquery.validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/Js/messages_zh.js"></script>
    <style type="text/css">
        body {
            padding-top: 140px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
            font-family: "微软雅黑";
            background-color: olivedrab;
        }

        .form-signin {
            max-width: 600px;
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
        
        .form-signin .form-signin-heading{
        	margin-bottom: 10px;
            font-size: 24px;
            margin-left: 200px;
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
			width: 300px;
			margin-left: 40px;
		}
		.input-medium{
			margin-left: 40px;
		}
		.code_images{
			width: 115px;
			height: 35px;
			margin-top: -15px;
			margin-left: 10px;
		}
		.error{
			color: red;
			font-size: 14px;
		}
		
    </style>  
</head>
<body>
<div class="container">	
    <form class="form-signin" method="post" action="${pageContext.request.contextPath}/user/regist">
        <h2 class="form-signin-heading" >管理员注册</h2>
                        姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
		<input type="text" name="name" class="input-block-level" placeholder="账号" id="name"><span id="nameMsg"></span>
		<br/>
                        密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：
        <input id="password" type="password" name="password" class="input-block-level" placeholder="密码"><span id="passwordMsg"></span>
        <br/>
                       确认密码：<input type="password" id="repassword" name="repassword" class="input-block-level" placeholder="确认密码"><span id="repasswordMsg"></span>
        <br/>
                        用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" id="username" name="username" class="input-block-level" placeholder="用户名"><span id="usernameMsg"></span>
        <span id="username_msg"></span><br/>
                        邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input type="text" id="email" name="email" class="input-block-level" placeholder="邮箱"><span id="emailMsg"></span>
        <span id="email_msg"></span><br/>               
        <p style="text-align: center;">
        <input id="regist" type="button" value="注册" name="regist" class="btn btn-large btn-info" style="width: 100px;"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="reset" type="reset" value="重置" name="reset" class="btn btn-large btn-info" style="width: 100px;"/>
        </p>
    </form>
</div>

<script type="text/javascript">
    $("#name").blur(function (){
        var name=$("#name").val();
        if ($.trim(name).length==0){
            $("#nameMsg").html("姓名不能为空！").css("color","red");
        }else {
            $("#nameMsg").html("");
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

    $("#repassword").blur(function (){
        var password=$("#password").val();
        var repassword=$("#repassword").val();
        if ($.trim(repassword).length==0){
            $("#repasswordMsg").html("确认密码不能为空！").css("color","red");
        }
        if (password!=repassword){
            $("#repasswordMsg").html("两次输入密码不一致！").css("color","red");
            return ;
        }else {
            $("#repasswordMsg").html("");
            return ;
        }
    })

    $("#username").blur(function (){
        var username=$("#username").val();
        if ($.trim(username).length==0){
            $("#usernameMsg").html("用户名不能为空！").css("color","red");
            $("#username").focus();
            return ;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/checkUsername",
            type:"POST",
            dataType:"JSON",
            data:{
                "username":username
            },
            success:function (map){
                if (map.msg){
                    $("#usernameMsg").html("该用户名可以使用！").css("color","green");
                }else {
                    $("#usernameMsg").html("用户名已被注册！").css("color","red");
                    return ;
                }
            }
        })
    })

    $("#email").blur(function(){
        var email=$("#email").val();
        if($.trim(email).length==0){
            $("#emailMsg").html("邮箱不能为空！").css("color","red");
            $("#email").focus();
            return;
        }
        var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!reg.test(email)){
            $("#emailMsg").html("邮箱格式不正确！").css("color","red");
            $("#email").focus();
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath }/user/checkEmail",
            type:"POST",
            dataType:"JSON",
            data:{
                "email":email
            },
            success:function(map){
                console.log(map);
                if(map.msg){
                    $("#emailMsg").html("邮箱可以使用！").css("color","green");
                }else{
                    $("#emailMsg").html("该邮箱已经被注册！").css("color","red");
                    $("#email").focus();
                    return;
                }
            }
        })
    })

    $("#regist").click(function (){
        var name=$("#name").val();
        var password=$("#password").val();
        var repassword=$("#repassword").val();
        var username=$("#username").val();
        var email=$("#email").val();
        if ($.trim(name).length==0){
            $("#nameMsg").html("姓名不能为空！");
            $("#name").focus();
            return ;
        }
        if ($.trim(password).length==0){
            $("#passwordMsg").html("密码不能为空！");
            $("#password").focus();
            return ;
        }
        if ($.trim(repassword).length==0){
            $("#repasswordMsg").html("确认密码不能为空！");
            $("#repassword").focus();
            return ;
        }
        if ($.trim(username).length==0){
            $("#usernameMsg").html("密码不能为空！");
            $("#username").focus();
            return ;
        }
        if (password!=repassword){
            $("#repasswordMsg").html("两次输入密码不一致！");
            $("#repassword").focus();
            return ;
        }
        if ($.trim(email).length==0){
            $("#emailMsg").html("邮箱不能为空！");
            $("#email").focus();
            return ;
        }
        $("form").submit();
    })
</script>
</body>
</html>