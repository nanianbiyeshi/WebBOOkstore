<%--
  Created by IntelliJ IDEA.
  User: 门荣伟
  Date: 2018/4/4
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="javabean.Book" %>
<%@ page import="javabean.EBook" %>
<%@ page import="javabean.User" %>
<%@ page import="jdbc.indexj" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>

    <title>首页</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <jsp:useBean id="ren1" class="javabean.User" scope="session"></jsp:useBean>

    <script>
        function over1() {
            $("#a1").css("color", 'red')

        }

        function leave1() {
            $("#a1").css("color", 'black')

        }

        function over2() {
            $("#a2").css("color", 'red')

        }

        function leave2() {
            $("#a2").css("color", 'black')

        }

        function over3() {
            $("#a3").css("color", 'red')

        }

        function leave3() {
            $("#a3").css("color", 'black')

        }

        function over4(s) {
            $("#a4").css("color", 'red')

        }

        function leave4(s) {
            $("#a4").css("color", 'black')

        }

    </script>
    <style>
        .dshop {
            width: 100%;
            font-family: 楷体;
            fonsize: 12px;
            background-color: rgba(22, 235, 29, 0);
            color: #ff1426;
            margin-top: 5px;
        }

        .pshop {
            margin-left: 25%;
        }

        .c {
            display: block;
            margin-top: 10px;
            height: 40px;
            float: left;
            margin-left: 7px;
        }

        .a1 {
            text-decoration: none;
            margin-top: 3px;
        }

        .c1 {
            width: 25%;
            float: left;
            background-color: white;
        }

        .c2 {
            margin-left: 5%;
            margin-top: 5px;
            width: 90%;
            height: 300px
        }

        .p1 {
            margin-left: 5%;
            display: block;
            color: red
        }
    </style>

</head>
<body>

<div id="box" style="background-color: aliceblue;width: 100%;height: 40px;font-family: 楷体; font-size:15px;color: black">
    <div style="margin-left: 5%;margin-top: 10px;height: 40px;float: left"> 图书飘香</div>
    <div style="margin-left: 30%;margin-top: 10px;height: 40px;float: left"> 欢迎来到当当小书屋,</div>
    <%
        indexj  array=new indexj();
        array.getbook();
        ArrayList<Book> blistke = array.getBlistke();
        ArrayList<Book> blistwen = array.getBlistwen();
        ArrayList<Book> blisttong = array.getBlisttong();
        ArrayList<Book> blistli = array.getBlistli();
        ArrayList<Book> blistxin = array.getBlistxin();
        ArrayList<EBook> elist = array.getEbook();
        if ((User) request.getAttribute("user") != null)
            ren1.setName(((User) request.getAttribute("user")).getName());
    %>
    <%
        if (ren1.getName() != null)
            out.print("<a  href=\"user.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left\">" + ren1.getName() + "</a>");
        else
            out.print("<a  href=\"login.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left\">请登录</a>");
    %>
    <a onmouseover="over1()" id="a1" onmouseleave="leave1()" class="c" href="shopcar.jsp"
       style="text-decoration: none;">购物车</a>
    <a onmouseover="over2()" id="a2" onmouseleave="leave2()" class="c" href="order.jsp" style="text-decoration: none;">我的订单</a>
    <a onmouseover="over4()" id="a4" onmouseleave="leave4()" class="c" href="user.jsp" style="text-decoration: none;">个人中心</a>
    <div style="margin-right: 60px;float: right;">
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="qidai.html" onmouseover="over3()" id="a3" onmouseleave="leave3()">我要出书</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">客户服务<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">帮助中心</a>
                    </li>
                    <li>
                        <a href="#">售后服务</a>
                    </li>
                    <li>
                        <a href="#">联系客服</a>
                    </li>
                    <li class="divider">
                    </li>
                    <li>
                        <a href="#">我要投诉</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="container" style="margin-top: 0px">`
    <div style="margin-top: 0px">
        <div style="margin-top: 0px">

            <div style="float: left;width: 15%;height: 100px;margin-left: 40px;margin-top: 0px">
                <img src="img\doodle-1523929492.gif" style="width: 362px;height: 100px;">
            </div>
            <div style="float: left;margin-left: 210px;height: 100px;width: 60%">
                <div style="margin-top: 40px ; width: 100%">
                    <form  action="/search"  method="get">
                        <div style="float: left;width: 80%">
                            <input type="text" name="search" placeholder="书名/作者/分类"
                                   style="width: 100%;outline: none;font-family: 楷体;border: 2px; border-color:red;border-style: solid;height: 30px">
                        </div>
                        <div style="float: left;width: 20%;">
                            <input type="submit" value="搜索"
                                   style="width: 90%;background-color: #fa3e35;border-color:red;border-style:solid;outline: none;height: 30px ;color: white">
                        </div>
                    </form>
                </div>
            </div>

            <table style="width: 100%">
                <tr>
                    <td style="width: 20%;background-color: red">
                        <div style="height: 284px;background-color:red;margin-top: 50px">
                            <ul style="color: white;">
                                <li><a href="/search?search=文学"
                                       style="text-decoration: none;margin-top: 5px;color: white">文学</a></li>
                                <li><a href="/search?search=励志" style="text-decoration: none;color: white">励志</a></li>
                                <li><a href="/search?search=科技" style="text-decoration: none;color: white">科技</a></li>
                                <li><a href="/search?search=童书" style="text-decoration: none;color: white">童书</a></li>
                                <li><a href="/search?search=电子书" style="text-decoration: none;color: white">电子书</a>
                                </li>

                            </ul>
                        </div>
                    </td>
                    <td style="width: 60%;height: 300px">
                        <div class="carousel slide" id="carousel-480010">

                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="img\timg (2).jpg"
                                         style="width:100%;height:300px;">
                                    <div class="carousel-caption">
                                        <h4>新书推荐

                                        </h4>
                                        <p>

                                        </p>
                                    </div>
                                </div>
                                <div class="item ">
                                    <img alt="" style="width:100%;height:300px" src="img\u=1405503544,2031889192&fm=27&gp=0.jpg"/>
                                    <div class="carousel-caption">
                                        <h4> 图书特卖
                                        </h4>
                                        <p>

                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img alt="" style="width:100%;height:300px" src="img\timg.jpg"/>
                                    <div class="carousel-caption">
                                        <h4>

                                        </h4>
                                        <p>

                                            盛夏时节
                                        </p>
                                    </div>
                                </div>

                                <div class="item">
                                    <img alt="" style="width:100%;height: 300px" src="img\timg (1).jpg"/>
                                    <div class="carousel-caption">
                                        <h4>

                                        </h4>
                                        <p>
                                            计算机图书
                                        </p>
                                    </div>
                                </div>
                                <div class="item">
                                    <img alt="" style="width:100%;height: 300px" src="img\timg (3).jpg"/>
                                    <div class="carousel-caption">
                                        <h4>

                                        </h4>
                                        <p>
                                            女生系列
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-480010" data-slide="prev"><span
                                    class="glyphicon glyphicon-chevron-left"></span></a> <a
                                class="right carousel-control" href="#carousel-480010" data-slide="next"><span
                                class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </td>
                    <td style="width: 20%;background-color: #ff1426">
                        <div class="dshop" style="height:279px;background-color: #ff1426 ">
                            <img style="margin-left: 40px;margin-top: 40px" src="img/getAvatar.do.jpg" alt=""
                                 class="img"/>
                            <p class="pshop" style="color: white;float: left;margin-left: 40px">Hi 欢迎来到当当小书屋</p>
                            <div class="pshop">
                                <%
                                    if (ren1.getName() != null)
                                        out.print("<a  href=\"user.jsp\" style=\" display:block;color: white;margin-top: 10px;height: 40px;float: left\">" + ren1.getName() + "</a>");
                                    else
                                        out.print("<a  href=\"login.jsp\" style=\" display:block;color: white;margin-top: 10px;height: 40px;float: left\">请登录</a>");
                                %>

                                <a onmouseover="over1()" id="a1" onmouseleave="leave1()" class="c" href="shopcar.jsp"
                                   style="text-decoration: none;color: white">购物车</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            <p style="margin-top:2px;height: 50px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white">
                新书推荐</P>
            <%

                for (int i = 0; i < blistxin.size(); i++) {%>
            <a href="prewview.jsp?ID=<%=blistxin.get(i).getID()%>" style="display: block;position: relative">
                <div class="c1">
                    <img class="c2" src="<%=blistxin.get(i).getPath()%>">
                    <a class="p1"><%=blistxin.get(i).getName()%>
                    </a>
                    <p class="p1">￥<%=blistxin.get(i).getPrice()%>
                    </p>
                </div>
            </a>
            <% }%>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel-group" id="panel-656009">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: red">
                                <a class="panel-title"
                                   style="margin-top:2px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white"
                                   data-toggle="collapse" data-parent="#panel-656009" href="#panel-element-60156">文学</a>
                            </div>
                            <div id="panel-element-60156" class="panel-collapse in">
                                <div class="panel-body">
                                    <%

                                        for (int i = 0; i < blistwen.size(); i++) {%>
                                    <a href="prewview.jsp?ID=<%=blistwen.get(i).getID()%>"
                                       style="display: block;position: relative">
                                        <div class="c1">
                                            <img class="c2" src="<%=blistwen.get(i).getPath()%>">
                                            <a class="p1"><%=blistwen.get(i).getName()%>
                                            </a>
                                            <p class="p1">￥<%=blistwen.get(i).getPrice()%>
                                            </p>
                                        </div>
                                    </a>
                                    <% }%>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: red">
                                <a class="panel-title collapsed" data-toggle="collapse"
                                   style="margin-top:2px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white"
                                   data-parent="#panel-656009" href="#panel-element-623613">励志</a>
                            </div>
                            <div id="panel-element-623613" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <%

                                        for (int i = 0; i < blistli.size(); i++) {%>
                                    <a href="prewview.jsp?ID=<%=blistli.get(i).getID()%>"
                                       style="display: block;position: relative">
                                        <div class="c1">
                                            <img class="c2" src="<%=blistli.get(i).getPath()%>">
                                            <a class="p1"><%=blistli.get(i).getName()%>
                                            </a>
                                            <p class="p1">￥<%=blistli.get(i).getPrice()%>
                                            </p>
                                        </div>
                                    </a>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: red">
                                <a class="panel-title collapsed"style="margin-top:2px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white" data-toggle="collapse" data-parent="#panel-656009"
                                   href="#panel-element-6236134">科技</a>
                            </div>
                            <div id="panel-element-6236134" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <%

                                        for (int i = 0; i < blistke.size(); i++) {%>
                                    <a href="prewview.jsp?ID=<%=blistke.get(i).getID()%>"
                                       style="display: block;position: relative">
                                        <div class="c1">
                                            <img class="c2" src="<%=blistke.get(i).getPath()%>">
                                            <a class="p1"><%=blistke.get(i).getName()%>
                                            </a>
                                            <p class="p1">￥<%=blistke.get(i).getPrice()%>
                                            </p>
                                        </div>
                                    </a>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: red">
                                <a class="panel-title collapsed" data-toggle="collapse"
                                   style="margin-top:2px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white"
                                   data-parent="#panel-656009" href="#panel-element-6236136">童书</a>
                            </div>
                            <div id="panel-element-6236136" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <%

                                        for (int i = 0; i < blisttong.size(); i++) {%>
                                    <a href="prewview.jsp?ID=<%=blisttong.get(i).getID()%>"
                                       style="display: block;position: relative">
                                        <div class="c1">
                                            <img class="c2" src="<%=blisttong.get(i).getPath()%>">
                                            <a class="p1"><%=blisttong.get(i).getName()%>
                                            </a>
                                            <p class="p1"><em>¥</em><%=blisttong.get(i).getPrice()%>
                                            </p>
                                        </div>
                                    </a>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: red">
                                <a class="panel-title collapsed" data-toggle="collapse"
                                   style="margin-top:2px;font-family: 楷体;font-size: 30px;background-color: #ff152b;color: white"
                                   data-parent="#panel-656009" href="#panel-element-6236135">电子书</a>
                            </div>
                            <div id="panel-element-6236135" class="panel-collapse collapse">
                                <div class="panel-body">

                                    <%
                                        for (int i = 0; i < elist.size(); i++) {%>
                                    <a href="prewview.jsp?ID=<%=elist.get(i).getID()%>"
                                       style="display: block;position: relative">
                                        <div class="c1">
                                            <img class="c2" src="<%=elist.get(i).getPath()%>">
                                            <a class="p1"><%=elist.get(i).getName()%>
                                            </a>
                                            <p class="p1">￥<%=elist.get(i).getPrice()%>
                                            </p>
                                        </div>
                                    </a>
                                    <% }%>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

</script>

</body>
</html>
