<%@ page import="javabean.EBook" %>
<%--
  Created by IntelliJ IDEA.
  User: 门荣伟
  Date: 2018/4/20
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
        if (ren1.getName() != null)
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
</div>
        <%
     request.setCharacterEncoding("UTF-8");
     EBook EB= (EBook)request.getAttribute("eb");
     String ID=(String)request.getAttribute("ID");
     String u=(String)request.getAttribute("ID");
     String num=(String)request.getAttribute("num");
          int num1=Integer.valueOf(num);
          num1++;
          int num2=num1-2;
        %>
    <div class="container" style="font-family: 楷体;">
        <table style="width: 100%">
            <tr>
                <td style="width: 100%">
        <p style="width:90%;margin-top: 0px;float:left;height: 30px;font-family: 楷体;background-color: #ef1d20;color:white ;font-size: 20px">
            <%=EB.getName()%>
        </P>
        <p style="float:left;height: 30px;margin-top: 0px;width:9%;margin-left:5px;background-color: #ef1c10;color: white ;font-size: 20px" >
           第 <%=EB.getChapter()%> 章
        </p>
        <div>
        <p style="width: 100%;font-family: 楷体;font-size: 20px;color: black;margin-top: 5px"><pre style="font-size: 10px">
            &nbsp;&nbsp;&nbsp;&nbsp;<%=EB.getContrn()%></pre>
        </p>
        </div>
        <p style="float:left"> <a href="/find?ID=<%=ID%>&u=<%=ren1.getName()%>&num=<%=num2%>" style="text-decoration: none;font-size: 25px"> 上一章  </a></p>
        <p style="float: right"> <a href="/find?ID=<%=ID%>&u=<%=ren1.getName()%>&num=<%=num1%>" style="text-decoration: none;font-size: 25px"> 下一章  </a></p>
      </td>
            </tr>
        </table>
    </div>
</body>
</html>
