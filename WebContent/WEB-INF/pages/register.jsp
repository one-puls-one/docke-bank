<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/register.css">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <title>register</title>
  <style>
  	.index_a{
  		font-size:12px;
  		margin-left:20px;
  		text-decoration:none;
  	}
  </style>
</head>
<body>
  <div class="bg">
    <div class="content">
      <h2>注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</h2>
      <div class="inp">
        <span>user&nbsp;&nbsp;&nbsp;name&nbsp;：</span>
        <input type="text" name="username"> 
      </div>
      <span class="umsg"></span>
      <div class="inp">
        <span>pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;word：</span>
        <input type="password" name="password">
      </div>
      <span class="pmsg"></span>
      <div class="inp">
        <span>Confirm password:</span>
        <input type="password" name="check">
      </div>
      <span class="cmsg"></span>
      <div class="inp">
        <span>phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;number：</span>
        <input type="text" name="phone">
      </div>
      <span class="tmsg"></span>
      <div class="inp">
        <span>user&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name：</span>
        <input type="text" name="nike">
      </div>
      <span class="nmsg"></span>
      <div class="res">
        <input type="submit" value="submit" class="btn">
      </div>
      <a class="index_a" href="${pageContext.request.contextPath }/user/index">homepage</a>
    </div>
  </div>
  <!-- 表单验证js -->
  <script>
    $(function(){
      var uflag = false;
      var pflag = false;
      var tflag = false;
      var nflag = false;
      var cflag = false;
      $('.btn').click(function(){
        if(uflag&&pflag&&tflag&&nflag&&cflag){
        	var username =  $('[name="username"]').val().trim();
        	var password = 	$('[name="password"]').val().trim();
        	var nike = $('[name="nike"]').val().trim();
        	var phone = $('[name="phone"]').val().trim();
          $.post('addUser',{
        	  username:username,
        	  password:password,
        	  nike:nike,
        	  phone:phone
          },function(data){
        	  if(data){
        		  window.location.href = "toLogin";
        	  }
          })
        }
      })
      //校验用户名
      $('[name="username"]').blur(function(){
        var reg = /^\w{6,16}$/
        if(reg.test(this.value)){
          $.get('checkUser?username='+this.value,{},function(data){
        	  if(data){
        		  uflag = false;
                  $('.umsg').html("the user name have be register！");
        	  }else{
        		  uflag = true;
                  $('.umsg').html("")
        	  }
          },'json')
        }else{
          uflag = false;
          $('.umsg').html("The user name is composed of 6 ~ 16 digits of numbers, letters and underscores.");
        }
      })
      //校验密码
      $('[name="password"]').blur(function(){
        if(this.value.trim().length>=6&&this.value.trim().length<=16){
          cflag = true;
          $('.pmsg').html("");
        }else{
          cflag = false;
          $('.pmsg').html('The password is 6 ~ 16 digits.');
        }
      })
      //确认密码
      $('[name="check"]').blur(function(){
        var p1 = $('[name="password"]').val();
        var p2 = $('[name="check"]').val();
        if(p1==p2){
          pflag = true;
          $('.cmsg').html("");
        }else{
          pflag = false;
          $('.cmsg').html("The two passwords are inconsistent!");
        }
      })
      //手机号验证
      $('[name="phone"]').blur(function(){
        var reg = /^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$/;
        if(reg.test(this.value)){
          tflag = true;
          $('.tmsg').html("");
        }else{
          tflag = false;
          $('.tmsg').html("Please enter the correct phone number!");
        }
      })
      //昵称不能为空
      $('[name="nike"]').blur(function(){
        if(this.value.trim().length>0){
          nflag = true;
          $('.nmsg').html("");
        }else{
          nflag = false;
          $('.nmsg').html("Nickname cannot be empty！")
        }
      })
    })
  </script>
</body>
</html>