<%@ page import="javabean.*" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: 门荣伟
  Date: 2018/4/9
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>

    <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="css/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="basic/js/quick_links.js"></script>

    <script type="text/javascript" src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="js/list.js"></script>
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
        function sub(but) {
            var value = $(but).next().val()
            if (value > 1) {
                value--;
            }
            $(but).next().val(value)
        }

        function add(but) {
            var value = $(but).prev().val()
            value++
            $(but).prev().val(value)
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

    <jsp:useBean id="ren1" class="javabean.User" scope="session"></jsp:useBean>
</head>

<body>
<div id="box" style="background-color: aliceblue;width: 100%;height: 40px;font-family: 楷体; font-size:15px;color: black">
    <div style="margin-left: 5%;margin-top: 10px;height: 40px;float: left;font-family: 楷体"> 图书飘香</div>
    <div style="margin-left: 30%;margin-top: 10px;height: 40px;float: left;font-family: 楷体"> 欢迎来到当当小书屋,</div>
    <%
        if (ren1.getName() != null)
        {
            out.print("<a  href=\"user.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left;font-family: 楷体;\">" + ren1.getName() + "</a>");
        }
        else
        out.print("<a  href=\"login.jsp\" style=\" display:block;color: red;margin-top: 10px;height: 40px;float: left;font-family: 楷体\">请登录</a>");
    %>

    <%
        String  sd=request.getParameter("ID");
        if(sd==null)
        {
            response.sendRedirect("index.jsp");
            return;
        }

        preview p=new preview();
        p.getBooK(sd);
        p.getEBooK(sd);
        lbook lb = new lbook();
        lb=p.getLbook();
    %>
    <a onmouseover="over1()" id="a1" onmouseleave="leave1()" class="c" href="shopcar.jsp"
       style="text-decoration: none;font-family: 楷体">购物车</a>
    <a onmouseover="over2()" id="a2" onmouseleave="leave2()" class="c" href="order.jsp" style="text-decoration: none;font-family: 楷体">我的订单</a>
    <a onmouseover="over4()" id="a4" onmouseleave="leave4()" class="c" href="user.jsp" style="text-decoration: none;font-family: 楷体">个人中心</a>
    <div style="margin-right: 60px;float: right;">
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="qidai.html" onmouseover="over3()" id="a3" onmouseleave="leave3()" style="font-family: 楷体">我要出书</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"style="font-family: 楷体">客户服务<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#" >帮助中心</a>
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

<div class="clear"></div>
<div class="listMain">

    <!--分类-->

    <ol class="am-breadcrumb am-breadcrumb-slash">
        <li><a href="index.jsp">首页</a></li>
    </ol>
    <script type="text/javascript">
        $(function () {
        });
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>

    <!--放大镜-->

    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">

            <div class="box">

                <div class="tb-booth tb-pic tb-s310">
                    <img src="<%=lb.getPath()%>" alt="细节展示放大镜特效" rel="<%=lb.getPath()%>"
                         class="jqzoom"/>
                </div>

            </div>

            <div class="clear"></div>
        </div>

        <div class="clearfixRight">

            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <h1>
               书名：<%=lb.getName()%>
            </h1>
                <h1>
                    作者:<%=lb.getAuthor()%>
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>促销价</dt>
                        <dd><em>¥</em><b class="sys_item_price"><%=new DecimalFormat( "0.00").format(Double.parseDouble(lb.getPrice())*0.8)
                        %></b></dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><em>¥</em><b class="sys_item_mktprice"><%=lb.getPrice()%></b></dd>
                    </li>
                    <div class="clear"></div>
                </div>

                <!--地址-->
                <dl class="iteminfo_parameter freight">
                    <dt>配送至</dt>
                    <div class="iteminfo_freprice">
                        <div class="am-form-content address">
                            <select data-am-selected>
                                <option value="a">浙江省</option>
                                <option value="b">湖北省</option>
                            </select>
                            <select data-am-selected>
                                <option value="a">温州市</option>
                                <option value="b">武汉市</option>
                            </select>
                            <select data-am-selected>
                                <option value="a">瑞安区</option>
                                <option value="b">洪山区</option>
                            </select>
                        </div>
                        <div class="pay-logis">
                            快递<b class="sys_item_freprice">10</b>元
                        </div>
                    </div>
                </dl>
                <div class="clear"></div>

                <!--销量-->
                <ul class="tm-ind-panel">
                    <li class="tm-ind-item tm-ind-sellCount canClick">
                        <div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">1015</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-sumCount canClick">
                        <div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">6015</span>
                        </div>
                    </li>
                    <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                        <div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
                    </li>
                </ul>
                <div class="clear"></div>

                <!--各种规格-->
                <div class="iteminfo_parameter sys_item_specpara">
                    <dt class="theme-login">
                        <div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div>
                    </dt>
                    <dd>
                        <!--操作页面-->
                        <div class="theme-popover-mask"></div>

                        <div class="theme-popover">
                            <div class="theme-span"></div>
                            <div class="theme-popbod dform">
                                <form action="/car" method="post"  >
                                    <input style="display: none" value="<%=ren1.getName()%>" name="user">
                                    <input style="display: none" value="<%=lb.getID()%>" name="ID">
                                    <div class="theme-signin-left">
                      <dd>
                        <% if(lb.getAmount()!=null){%>
                        <input  type="button" style="display: inline;width: 30px" value="-" onclick="sub(this)">
                    <%}%>
                        <input style="display: inline;width: 28px;height: 16px;" name="amount" type="text" value="1"/>
                    <% if(lb.getAmount()!=null){%>
                        <input  type="button" style="display: inline;width: 30px"  value="+" onclick="add(this)">
                        <span id="Stocky" class="tb-hidden">库存<span class="stock">
                            <%out.print(lb.getAmount());%>
                        </span>件</span><%}%>
                    </dd>
                    <div class="clear"></div>
                     <li>
                        <div class="clearfix tb-btn tb-btn-basket theme-login">
                            <input type="submit" id="LikBaskety" title="加入购物车" style="background-color: #ff1426;outline: none;border: none;border-style: none;color: white;height: 90px;height: 25px;font-family: 楷体;margin-left: 40px" value="加入购物车">
                           <% if(lb.getAmount()==null){%>
                               <a href="/find?ID=<%=lb.getID()%>&u=<%=ren1.getName()%>&num=1"
                            style="background-color: #ff1426;color: white">已购买开始阅读</a>
                          <%}  %>
                        </div>
                    </li>
                    </form>
                </div>
            </div>

            </dd>
            </dl>
            <div class="clear"></div>
            <!--活动	-->


        </div>

        <div class="clear"></div>

    </div>

    <!--优惠套装-->

    <div class="clear"></div>


    <!-- introduce-->


</div>
<!--菜单 -->

</body>

</html>

</html>
