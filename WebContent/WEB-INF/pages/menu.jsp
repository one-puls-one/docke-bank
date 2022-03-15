<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
  <title>菜单</title>
  <style>
  	h2{
  	  text-align: center;
      font-size: 24px;
      background-color: crimson;
      margin: 0;
      padding: 10px;
  	}
  	.card{
      width: 100%;
      height: 100px;
      position: relative;
      /* padding: 5px;   */
    }
    .card img{
      margin-left: 5px;
      margin-top:10px;
      width: 90px;
      height: 90px;
      display: block;
      float: left;
    }
    .card .right{
      float: left;
      position: relative;
      padding-left: 10px;
      width: 180px;
      height: 90px;
    }
    .card .right .title,.desc,.bom{
      display: inline-block;
      width: 180px;
      text-align: left;
    }
    .card .right .price{
      color: red;
      font-size: 1.4em;
    }
    .card .del{
      position: absolute;
      width: 60px;
      right: 0px;
      top: 50px;
      height: 30px;
    }
    .card .del button{
      background-color: rgb(252, 29, 29);
      border: 1px solid rgb(247, 31, 31);
      box-shadow: 1px 1px 1px 1px rgb(247, 31, 31);
    }
    .onsub{
      position: fixed;
      width: 100%;
      background-color: blue;
      bottom: 82px;
    }
    .onsub .left,.right{
      position: absolute;
      width: 100px;
      height: 30px;
      line-height: 30px;
      text-align: center;
    }
    .onsub .left{
      left: 0;
      font-size: 1.1em;
    }
    .onsub .left .price{
      color:red;
      font-size: 1.4em;
    }
    .onsub .right{
      right: 10px;
    }
    .onsub .right button{
     width: 100px;
     height: 30px;
     line-height: 30px;
     font-size: 1.1em;
     border-radius:50px;
     border: 1px solid rgb(245, 103, 20);
     background-color: cornflowerblue;
     box-shadow: 1px 2px 1px 1px #666;
     outline: none;
    }
    .onsub .right button:active{
      background-color: rgb(243, 150, 28);
    }
    
    .buyfood{
background-color:cornflowerblue;
}

.h{
background-color:cornflowerblue;
color: cornsilk;
size:20px;
}
 .paybtn{
background-color:cornflowerblue;
color:cornsilk;
}
  </style>
  <script>
    //首页跳转
    function index(){
      window.location.href = "index"
      // alert(1);
    }
    //跳转分类
    function fenlei(){
      window.location.href = "fenlei"
    }
    //跳转菜单
    function menu(){
      window.location.href = "menu"
    }
    //跳转个人信息
    function persion(){
      window.location.href = "person"
    }
  </script>
</head>
<body>
	<center>
  <h1 class=h>order information</h1>
  </center>
  <!-- 顶部信息 -->
  <div class="header">
	
  </div>
  <!-- 结算信息 -->
  <div class="onsub">
    <div class="left">￥<span class="price tprice">0.00</span></div>
    <div class="right"><button class="paybtn">pay it</button></div>
  </div>
  <!-- 信息选择 -->
  <div class="foot">
    <div onclick="index()">
      <img src="${pageContext.request.contextPath }/images/shou-ico.jpg" alt="shou-ico">
      <span >homepage</span>
    </div>
    <div onclick="fenlei()">
      <img src="${pageContext.request.contextPath }/images/fen-ico.jpg" alt="shou-ico">
      <span>food</span>
    </div>
    <div onclick="menu()">
      <img src="${pageContext.request.contextPath }/images/caidan-ico.jpg" alt="shou-ico">
      <span class="active">order</span>
    </div>
    <div onclick="persion()">
      <img src="${pageContext.request.contextPath }/images/person-ico.jpg" alt="shou-ico">
      <span>mine</span>
    </div>
  </div>
  <span class="tag">1</span>
  <script>
  	$(function(){
  	getFoodNum();
  	//页面加载
  	  $.get('getCards',{},function(data){
  		  candle(data);
  	  },'json')
  	  	
	 //删除食品
  	 function delFood(){
  		$('.del-food').click(function(){
  			if(confirm("Are you sure to delete?")){
  	  		 var cid = $(this).prev().val();
  	  		 $.get('deleteCardById?cid='+cid,{},function(data){
	  	  		  if(data>0){
		  	  		//页面加载
		  	  	  	  $.get('getCards',{},function(data){
		  	  	  		  candle(data);
		  	  	  		  getFoodNum();
		  	  	  	  },'json')
	  	  		  }else{
	  	  			  alert('Deletion failed, please try again!');
	  	  		  }
	  	  	  },'json')
  			}
  	  	 })
  	}
  	  	
  	 //支付食品
  	 $('.paybtn').click(function(){
  		 var price = $('.tprice').html();
  		 $.post('payFood?price='+price,{},function(data){
  			 if(data>0){
  				 $.get('getCards',{},function(data){
  			  		  candle(data);
  			  		  getFoodNum();
  			  		  window.location.href = "person"
  			  	  },'json')
  			 }else if(data<0){
  				 alert('Payment failed, please try again!');
  			 }else{
  				 alert('Your account balance is insufficient. Please recharge!');
  			 }
  		 },'json')
  	 })
  	//	进行数据的渲染
  		function candle(list){
  			var lis = '';
  			var total = 0;
  			$('.header').html("");
  			for(var item in list){
  				lis +='<div class="card">'+
		  			      '<img src="${pageContext.request.contextPath }'+list[item].food.fpicture+'" alt="food">'+
			  		      '<div class="right">'+
			  		        '<span class="title">'+list[item].food.fname+'</span><br/>'+
			  		        '<span class="desc">'+list[item].food.fdesc+'</span><br>'+
			  		        '<span class="bom">Unit-Price：￥<span class="price">'+list[item].food.fprice.toFixed(2)+'</span></span><br/>'+
			  		        '<span>number：x'+list[item].num+'</span>'+
			  		        '<span>Total-price：￥<span class="price">'+list[item].tprice.toFixed(2)+'</span></span>'+
			  		      '</div>'+
			  		      '<div class="del">'+
			  		      	'<input type="hidden" value="'+list[item].cid+'">'+
			  		        '<button class="del-food">delete</button>'+
			  		      '</div>'+
			  		    '</div><hr/>';
			  	total+=list[item].tprice;
  			}
  			$('.header').html(lis);
  			$('.tprice').html(total.toFixed(2));
  			if(total==0){
  				$('.header').html("<h3 align='center'>have no information!</h3>");
  			}
  			//重新渲染后进行事件添加
  			delFood();
  		}
  	})
  	//获取食品数量
  	function getFoodNum(){
  		//定位菜单坐标
  		var width = $('.foot').width();
  		$.get('getFoodNum',{},function(data){
  			if(data>0){
  			  $('.tag').html(data+"");
			  $('.tag').css({
  		        display:'block',
  		        right:(width/4+5)+'px'
  		      }) 
  			}else{
  			  $('.tag').html("0");
			  $('.tag').css({
  		        display:'none',
  		        right:(width/4+5)+'px'
  		      }) 
  			}
  		},'json')
  	}
  </script>
</body>
</html>