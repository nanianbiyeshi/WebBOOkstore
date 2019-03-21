<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:useBean id="ren1" class="javabean.User" scope="session"></jsp:useBean>
<style>
#header {
    background-color:orange;
    color:white;
    text-align:center;
    padding:5px;
}
#nav {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:100px;
    float:left;
    padding:5px;	      
}
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#footer {
    background-color:orange;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>"个人主页"</title>
</head>
<body>
<div id="header">
<h1>个人主页</h1>
</div>

<div id="nav" style="width: 160px">
头像<br><img src="img\getAvatar.do.jpg"><br>
用户名称<br>
<br> <%=ren1.getName()%><br><br><br><a href>收藏夹</a><br>
</div>
<div id="section">
<h2>功能</h2>
<p>
 <br><br><a href="order.jsp">我的订单</a>

</p>
<p>
<a href>红包卡券</a>
</p>
</div>

<div id="footer">

</div>

<header style="width: 1230px;line-height:2.5em;margin:0 auto;height: 34px;font-size: 12px;">
       <div style="display: inline;"> 
<script type="text/javascript">

<svg xmlns="http://www.w3.org/2000/svg" version="1.1" height="190">
<polygon points="100,10 40,180 190,60 10,60 160,180"
style="fill:red;stroke:blue;stroke-width:3;fill-rule:evenodd;" />
</svg>

</script>
            <br>
           <a >
            <div style="background-color: red"></div>

            <br>
        </div> 




</script>
        

 </header>

 

</body>
</html>