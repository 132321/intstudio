<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

	<title>登录/注册</title>
	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->

	<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	 <script src="/eucms_files/jquery.min.js"></script>
	<script src="/js/bootstrapValidator.js"></script>
    <link href="/css/bootstrapValidator.css" rel="stylesheet" />
	<script>
	
	 function valid(){
		 var username = document.getElementById("username").value;
	 }
	 
	 function register(){
		 var a = document.getElementById("username1").value;
		 var b =  document.getElementById("pwd1").value;
		 var c = 			 document.getElementById("tel1").value;
		 var d = 					 document.getElementById("wx1").value;
		 if(a.trim() == '' || b.trim() == '' || c.trim()=='' || d.trim()== ''){
			 alert("请输入完整信息");
			 return false;
		 }
		 
	 }
	 
	 
	 function isPoneAvailable(str) {
         var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
         if (!myreg.test(str)) {
             return false;
         } else {
             return true;
         }
	}
	 
	 
	 function validTel(input){
		 var tel = input.value;
		 if(tel.trim() == ''){
			 return ;
		 }
		 tel = tel.trim();
		 if(isPoneAvailable(tel)){
			 
		 }else{
			 alert("手机号不合法！请重新输入!");
			 input.value = "";
	    	 return;
		 }
		//创建异步对象  
		 var xhr = new XMLHttpRequest();
		 //设置请求的类型及url
		   xhr.open('post', '/telCheck' );
		 //post请求一定要添加请求头才行不然会报错
		 xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		
		 //发送请求
		 xhr.send('tel='+tel);
		 xhr.onreadystatechange = function () {
		     // 这步为判断服务器是否正确响应
		   if (xhr.readyState == 4 && xhr.status == 200) {
		     var str = (xhr.responseText);
		     //alert(1);
		     var obj = eval('(' + str + ')'); 
		     if(obj.flag == '1'){
		    	 return ;
		     }else{
		    	 alert("手机号已存在！");
		    	 input.value = "";
		    	 return;
		     }
		   } 
		 };
	 }
	 
	 function judge() {
		 var result = document.getElementById("flag").value;
		 if (result == '0') {
			 alert("注册失败请关闭浏览器重新访问注册！");
		 } else if (result == '1') {
			 alert("注册成功请登录！");
		 } else if (result == '2') {
			 alert("请登录！");
		 }
	 }
	</script>
</head>
<!-- //Head -->

<!-- Body -->
<body onload="judge()">

<%
String flag = request.getParameter("flag");
%>
<input type="hidden" id="flag" value="<%=flag%>">
	<h1>登录/注册</h1>

	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits form-group" >
			<h2>登 录</h2>
			<form action="/selectByTel" method="post" id="form"  id="form" onsubmit="return valid()">
				<input type="text" required="" class="form-control" id="username" name="tel" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')" placeholder="用户名/手机号"  >
				<input type="password"  required="" class="form-control" id="password" name="password" placeholder="密码"  >
			
			<!-- <ul class="tick w3layouts agileits">
				<li>
					<input type="checkbox" id="brand1" value="">
					<label for="brand1"><span></span>记住我</label>
				</li>
			</ul> -->
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="登 录">
				
			</div>
			</form>
			<a href="#">记住密码?</a>
			<div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="javascript:alert('暂未开放此登录方式,敬请期待');">
					<span class="icons w3layouts agileits"></span>
					<span class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="javascript:alert('暂未开放此登录方式,敬请期待');">
					<span class="icons w3layouts"></span>
					<span class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="javascript:alert('暂未开放此登录方式,敬请期待');">
					<span class="icons agileits"></span>
					<span class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"> </div>
				</ul>
			</div>
			<div class="clear"></div>
		</div><div class="copyrights">Collect from <a href="#" ></a></div>
		<div class="register w3layouts agileits">
			<h2>注 册</h2>
			<form action="/add" method="post" onsubmit="return register()">
				<input type="text" name="username" id="username1" placeholder="用户名" required="" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5a-zA-Z0-9\w]/g,'')" >
				<input type="password" name="password" id="pwd1" placeholder="密码" required="">
				<input type="text" name="tel" id="tel1" onblur="validTel(this)" placeholder="手机号码" required="" onkeyup="this.value = this.value.replace(/[^0-9-]+/,'')">
				<input type="text" name="wechat" id="wx1" placeholder="微信号" required="">
			 
			<div class="send-button w3layouts agileits">
				 
					<input type="submit" value="免费注册">
				 
			</div>
			</form>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p> Copyright © 2018 INT Studio 版权所有     </p>
		</p>
		</div>

</body>
<!-- //Body -->

</html>