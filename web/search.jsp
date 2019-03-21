<%@ page import="javabean.Book" %>
<%@ page import="javabean.EBook" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 门荣伟
  Date: 2018/4/20
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
    <script src="css/jquery.js"></script>
    <!-- 引入组件库 -->

    <script>
        function over1(s) {
            $("#a1").css("color", 'red')

        }

        function leave1(s) {
            $("#a1").css("color", 'black')

        }

        function over2(s) {
            $("#a2").css("color", 'red')

        }

        function leave2(s) {
            $("#a2").css("color", 'black')

        }

        function over3(s) {
            $("#a3").css("color", 'red')

        }

        function leave3(s) {
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
<jsp:useBean id="ren1" class="javabean.User" scope="session"></jsp:useBean>
<body>
<div id="box" style="background-color: aliceblue;width: 100%;height: 40px;font-family: 楷体; font-size:15px;color: black">
    <div style="margin-left: 5%;margin-top: 10px;height: 40px;float: left"> 图书飘香</div>
    <div style="margin-left: 30%;margin-top: 10px;height: 40px;float: left"> 欢迎来到当当小书屋,</div>
        <%
        if (ren1.getName()!= null)
            {
            out.print("<a  href=\"user.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left\">" + ren1.getName() + "</a>");
            }
        else
            out.print("<a  href=\"login.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left\">请登录</a>");
       %>
    <a onmouseover="over1()" id="a1" onmouseleave="leave1()" class="c" href="shopcar.jsp"
       style="text-decoration: none;">购物车</a>
    <a onmouseover="over2()" id="a2" onmouseleave="leave2()" class="c" href="order.jsp" style="text-decoration: none;">我的订单</a>
    <a onmouseover="over4()" id="a4" onmouseleave="leave4()" class="c" href="/login1" style="text-decoration: none;">个人中心</a>
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
    <div class="container">
        <div style="margin-top:70px;height: 50px;font-family: 楷体;font-size: 30px;background-color: #ff1f29;color: white">
            搜索结果
        </div>
        <%!
            ArrayList<Book> blist = new ArrayList<Book>();
            ArrayList<EBook> elist = new ArrayList<EBook>();
        %>

        <%
            if (request.getParameter("libie")!=null) {



            } else {
                if (request.getAttribute("state") != null)
                    out.print("<p style=\"margin-top:2px;height: 50px;font-family: 楷体;font-size: 30px;background-color: red;color: white\">\n" + (String) request.getAttribute("state") + "</P>");
                else {
                    blist = (ArrayList<Book>) request.getAttribute("search");
                    elist = (ArrayList<EBook>) request.getAttribute("search1");

                }

            }


        %>

        <%
            if (blist != null) {
                for (int i = 0; i < blist.size(); i++) {%>
        <a href="prewview.jsp?ID=<%=blist.get(i).getID()%>"
           style="display: block;position: relative">
            <div class="c1">
                <img class="c2" src="<%=blist.get(i).getPath()%>">
                <a class="p1"><%=blist.get(i).getName()%>
                </a>
                <p class="p1">¥<%=blist.get(i).getPrice()%>
                </p>
            </div>
        </a>
        <% }
        }
            blist = null;
        %>
        <%
            if (elist != null) {
                for (int i = 0; i < elist.size(); i++) {%>
        <a href="prewview.jsp?ID=<%=elist.get(i).getID()%>"
           style="display: block;position: relative">
            <div class="c1">
                <img class="c2" src="<%=elist.get(i).getPath()%>">
                <a class="p1"><%=elist.get(i).getName()%>
                </a>
                <p class="p1"><em>¥</em><%=elist.get(i).getPrice()%>
                </p>
            </div>
        </a>
        <% }
        }
            elist = null;%>

    </div>

</body>
</html>
