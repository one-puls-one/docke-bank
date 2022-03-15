<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>首页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
  <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
	<style>
		.lunbo{
	      width: 100%;
	      height: 300px;
	      padding: 10px;
	    }
	     .lunbo img{
	      width: 100%;
	      height: 100%;
	    }
	    
	    .back{
  width: 25%;
  padding: 0 15px;
  height: 50px;
  line-height: 50px;
  background-color:cornflowerblue;
  text-align: center;
  float: left;
  font-size: 1.2em;
}

.back2{
 width: 25%;
  padding: 0 15px;
  height: 50px;
  line-height: 50px;
  background-color:cornsilk;
  text-align: center;
  float: left;
  font-size: 1.2em;
}
.back3{
 width: 25%;
  padding: 0 15px;
  height: 50px;
  line-height: 50px;
  background-color:cornflowerblue;
  text-align: center;
  float: left;
  font-size: 1.2em;
}
.back4{
 width: 25%;
  padding: 0 15px;
  height: 50px;
  line-height: 50px;
  background-color:cornsilk;
  text-align: center;
  float: left;
  font-size: 1.2em;
}

.buyfood{
background-color:cornflowerblue;
}
	</style>
<script>
    // 简易换图
  	  $(function () {
       var i = 1;
       setInterval(function(){
        i++;
        //图片的张数
        if(i>2){
          i=1;
        }
        $('.lunbo img').animate({
        	opacity:0.5
        },900,function(){
        	$(this).attr("src","${pageContext.request.contextPath }/images/餐厅"+i+".jpg").animate({
        		opacity:1
        	},900);
        });
      }, 3000);
     });
  </script>
  <!-- 跳转 -->
  <script>
    //首页跳转
    function index(){
      window.location.href = 'index';
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
  <!-- 轮播图片 -->
  <div class="lunbo">
		<img src="${pageContext.request.contextPath }/images/餐厅3.jpg"/>
 </div>
  <!-- 主体业务区域 -->
  <div class="center">
    <div class="back">
      <span><a href="${pageContext.request.contextPath }/user/list?tid=1">Cake</a></span>
    </div>
    <div class="back2">
      <span><a href="${pageContext.request.contextPath }/user/list?tid=3">Noodles</a></span>
    </div>
    <div class="back3">
      <span><a href="${pageContext.request.contextPath }/user/list?tid=2">Coffee</a></span>
    </div>
    <div class="back4">
      <span><a href="${pageContext.request.contextPath }/user/list?tid=4">Set meal</a></span>
    </div>
  </div>
<!-- 推荐菜品展示 -->
  <div class="hot">
    <h2>Cake</h2>
    <c:forEach items="${foods }" var="food">
	   	<div class="food">
	      <img src="${pageContext.request.contextPath }${food.fpicture}" alt="food">
	      <div class="right">
	        <span class="title">${food.fname}</span><br/>
	        <span class="desc">${food.fdesc }</span><br>
	        <span class="bom">￥<span class="price">${food.fprice }</span></span>
	      </div>
	      <div class="add">
	        <button class="food-del">-</button>
	        <span class="food-num">1</span>
	        <button class="food-add">+</button>
	        <button class="buyfood" onclick="buyFood(this)">buy</button>
	        <input type="hidden" value="${food.fid }"/>
	      </div>
	    </div><hr>
    </c:forEach>
  </div>
<!-- 信息选择 -->
  <div class="foot">
    <div onclick="index()">
      <img src="${pageContext.request.contextPath }/images/shou-ico.jpg" alt="shou-ico">
      <span class="active">homepage</span>
    </div>
    <div onclick="fenlei()">
      <img src="${pageContext.request.contextPath }/images/fen-ico.jpg" alt="shou-ico">
      <span>food</span>
    </div>
    <div onclick="menu()">
      <img src="${pageContext.request.contextPath }/images/caidan-ico.jpg" alt="shou-ico">
      <span>order</span>
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
      //商品删减按钮事件
      $('.food-del').click(function(){
        var num = $(this).next().html();
        if(num>1){
          num--;
          $(this).next().html(num);
        }else{
          alert('It is the least, can not be less anymore!')
        }
      })

      //商品添加事件
      $('.food-add').click(function(){
        var num = $(this).prev().html();
        if(num<20){
          num++;
          $(this).prev().html(num);
        }else{
          alert('20 is the most, no more!')
        }
      })
    })
   
    //获取高度
    var height = 0;
  //获取滚动条的位置
 	$(window).scroll(function() {
 		height=$(window).scrollTop();
 	});
    
     //购买事件
  function buyFood(item){
		var num = $(item).prev().prev().html();
		var fid = $(item).next().val();
		var tprice = $(item).parent().prev().children('.bom').children('.price').html()*num;
		$.get('addCard?fid='+fid+'&num='+num+'&tprice='+tprice,{},function(data){
			if(data.state==-1){
				if(confirm("You haven't logged in yet. Do you need log in now?")){
					 window.location.href = "toLogin"
				}
			}else if(data.state==0){
				alert("You haven't logged in yet. Please log in first!")
			}else{
				//定位菜单坐标
				var width = $('.foot').width();
			  	var newWidth = (width/4)+(width/4/2);
		          //进行克隆节点动画效果
		          $(item).clone().insertBefore(item).animate({
		            right:newWidth+'px',
		            bottom:-height+'px',/*根据滚动条定位位置*/
		            width:'0',
		            opacity:0.5
		          },"slow",function(){
		        	  //移除克隆节点
		            $(this).remove();
		        	getFoodNum();
		          })
			}
		},"json")  
	}
  
    
    
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