<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-US">
<head>
<title>登录页面</title>
<link type="text/css" href="themes/css/v3/reset.css" rel="stylesheet">
<link type="text/css" href="themes/css/v3/public.css" rel="stylesheet">
<link type="text/css" href="themes/css/v3/register.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" />
<script src="themes/js/jquery.min.js" type="text/javascript"></script>
<script src="themes/js/jquery.form.js" type="text/javascript"></script>
<script src="themes/js/json.parse.js" type="text/javascript"></script>
<style>
	.loginad{
		width:580px;
		height:595px;
		position: absolute;
	}
	.loginad .loginadtitle{
		width:100%;
		text-align:center;
		line-height:60px;
		font-size:32px;
		font-family:"幼圆",Microsoft Yahei;
		margin-top:70px;
		color:#FFF;
	}
	.loginad .loginaddes{
		line-height:30px;
		color:#FFF;
		font-family:Microsoft Yahei;
		font-size:16px;
		text-align:center
	}
	.loginad .loginadimg{
		width:100%; 
		height:320px;
		margin-top:40px;
		
	}
	.loginad .loginadbtn{ width:100%; height:40px; margin-top:30px; }
	.loginad .loginadbtn a{ display:block; width:190px; height:40px; margin:0 auto; text-align:center; line-height:40px; font-size:16px; color:#009fe3; font-weight:bold; background:url(/themes/images/v3/btn.png) center center no-repeat;
		-moz-border-radius:6px;
		-khtml-border-radius:6px;
		-webkit-border-radius:6px;
		border-radius:6px;
	}
</style>
</head>
<body>
	<div id="header">
		<div class="header">
			<h1 class="png_bg">JS代码网</h1>
			<a href="#">返回主页</a>
		</div>
	</div>	
	
	<div class="login_bg">
		<div class="form">
        	<div class="loginad">
            	<div class="loginadtitle">快来登陆和星哥一起玩耍吧</div>
                <div class="loginaddes">今天所做之事勿候明天，自己所做之事勿候他人。——歌德</div>
                <div class="loginadbtn"><a  href="docs/api/id/59" target="_blank">马上查看</a></div>
                <div class="loginadimg" style="background:url('http://img.juhe.cn/www/news/201407/3275043504%20.png') center center no-repeat"></div>
            </div>
			
			<form name="loginForm" id="login_form" method="post" action="login/ldo">
				<h2>登录来一起玩耍吧!</h2>
				<div class="div_user"><span></span><input  name="username" class="username" type="text" placeholder="用户名" /></div>
				<div class="div_pw"><span></span><input class="pw" name="userpass" type="password" placeholder="密码" /></div>
				<div class="div_box">
					<label><input type="checkbox" class="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下次自动登录</label>
					<a class="forgetPw" href="forget">忘记密码？</a>
				</div>
				<div><input class="login_btn" id="loginBtn" type="button" value="登录" /></div>
                <div style="line-height:30px; text-indent:5px;color:#F30" id="loginTips">&nbsp;</div>
				<h4>可以使用下面方式登录<a class="#" href="register">立即注册</a></h4>
				<a href="#"><img src="themes/images/oauth/csdn.png" alt="" /></a>
			</form>
		</div>
	</div>
	
	
<!-- footer start -->
<div id="footer" class="clear">
    <h1 class="png_bg">JS代码网</h1>
    <div class="friendLink clear">
        <a  href="#" target="_blank" title="隐私政策" rel="nofollow">隐私政策</a>
        <a href="#" target="_blank" rel="nofollow">服务条款</a>
        <a href="#" target="_blank" rel="nofollow">关于我们</a>
        <a href="#" target="_blank" rel="nofollow">人员招聘</a>
        <a href="#" target="_blank" rel="nofollow">联系我们</a>
        <a href="#" target="_blank" rel="nofollow">友情链接</a>
    </div>
    <p>上海微一科技有限公司©版权所有 沪ICP备140068998</p>
    <div class="weixin">
        <img src="themes/images/v3/weiyi_qr.png" alt="" />
        <h3>关注微一科技</h3>
    </div>
</div>
<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F5d12e2b4eed3b554ae941c0ac43c330a' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- footer end -->
<script type="text/javascript">
	var refer='';
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			$("#loginBtn").val('登录中...').attr("disabled","disabled");
			var username = $(".username").val();
			var userpass = $(".pw").val();
				username = $.trim(username);
				userpass = $.trim(userpass);
			$("#loginTips").css({display:"none"});	
			
			if(username.length <5){
				//$("#username_tips").html("请输入正确的用户名!").css({display:"block"});
				$("#loginTips").html("请输入正确的用户名!").fadeIn();
				$("#loginBtn").val('登录').removeAttr('disabled');
				return false;
			}
			if(userpass == ''){
				$("#loginTips").html("请输入正确的密码!").fadeIn();
				$("#loginBtn").val('登录').removeAttr('disabled');
				return false;
			}
			
			$("#login_form").ajaxSubmit(function(e){
				var obj  = json_parse(e);
				var code = obj.code;
				if(code == '1')
				{
					//sycSiteLogin();
					if(refer){
						window.location.href = refer;
					}else{
						window.location.href = 'my';
					}
					
				}else if(code == '-1'){
					$("#loginTips").html(obj.info).fadeIn();
					$("#loginBtn").val('登录').removeAttr('disabled');
					return false;
				}else if(code == '-2'){
					$("#loginTips").html(obj.info).fadeIn();
					$("#loginBtn").val('登录').removeAttr('disabled');
					return false;
				}else if(code == '-4'){
					$("#loginTips").html(obj.info).fadeIn();
					$("#loginBtn").val('登录').removeAttr('disabled');
					return false;
				}else{
					$("#loginTips").html(obj.info).fadeIn();
					$("#loginBtn").val('登录').removeAttr('disabled');
					return false;
				}
				
			})
		//嵌套AJAX
		})		
	})
	
	function sycSiteLogin(){
		/* $.get('login/syc',function(e){
			
		}) */
	}
	
	//bind keyCode=13 Event
	$(function(){
		document.onkeydown = function(e){ 
		    var ev = document.all ? window.event : e;
		    if(ev.keyCode==13) {

		    	$("#loginBtn").click();

		     }
		}
	}); 
</script>
</body>
</html>