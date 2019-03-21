<%@ page import="javabean.User" %>
<%@ page import="javabean.lbook" %>
<%@ page import="jdbc.MyDatasource" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="static jdbc.MyDatasource.free" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/12
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>shopcar</title>
    <script src="css/jquery.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function checkAll(checked) {
            //根据名字获取所有checkbox控件
            var allCheckBoxs = document.getElementsByName("car");
            //循环设置控件为选中状态
            for (var i = 0; i < allCheckBoxs.length; i++) {
                if (allCheckBoxs[i].type == "checkbox") {
                    allCheckBoxs[i].checked = checked;
                }
            }
        }

        function add(but) {
            if ($(but).prop('checked') == true) {
                var s = new Array()
                var i = 0
                var value = $(but).prev().val()
                value = 'true'
                $(but).prev().val(value)
                var price = $('#price').val()
                $(but).nextAll().each(function () {
                    s[i] = $(this).val()
                    i++;
                })
                price = parseFloat(price) + parseFloat(s[1]) * parseInt(s[2])*0.8;
                $('#price').val(price.toFixed(2))
            }
            else {
                var s = new Array()
                var i = 0
                var value = $(but).prev().val()
                value = 'true'
                $(but).prev().val(value)
                var price = $('#price').val()
                $(but).nextAll().each(function () {
                    s[i] = $(this).val()
                    i++;
                })
                price = parseFloat(price) - parseFloat(s[1]) * parseInt(s[2])*0.8;
                price.toFixed(2)
                $('#price').val(price.toFixed(2))

            }
        }

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

        if ((User) request.getAttribute("user") != null) ren1.setName(((User) request.getAttribute("user")).getName());
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
<form action="/cars" name="carshop" method="get">
    <%
        Connection conn = MyDatasource.getConnection();
        Statement st = conn.createStatement();
        String sql = "select ID2,car.amount,price,name from car,book where ID2=book.ID AND car.ID='0' AND uerrid="+ "'"+ren1.getName()+"'";
        ResultSet rs = st.executeQuery(sql);
        ArrayList<lbook> lb = new ArrayList<lbook>();
        while (rs.next()) {
            lbook lbs = new lbook();
            lbs.setID(rs.getString("ID2"));
            lbs.setAmount(rs.getString("car.amount"));
            lbs.setName(rs.getString("name"));
            lbs.setPrice(rs.getString("price"));
            lb.add(lbs);
        }
        rs.close();
        st.close();
        MyDatasource.free(conn);%>
    <%
        Connection conn1 = MyDatasource.getConnection();
        Statement st1 = conn.createStatement();
        String sql1= "Select ID2,car.amount,price,ebook.name from car,ebook where ID2=ebook.ID AND car.ID='0' AND uerrid="+"'" +ren1.getName()+"'";
        ResultSet rs1 = st1.executeQuery(sql1);
        while (rs1.next()) {
            lbook lbs1 = new lbook();
            lbs1.setID(rs1.getString("ID2"));
            System.out.println(rs1.getString("ID2"));
            lbs1.setAmount(rs1.getString("car.amount"));
            lbs1.setName(rs1.getString("name"));
            lbs1.setPrice(rs1.getString("price"));
            lb.add(lbs1);
        }
        rs1.close();
        st1.close();
        MyDatasource.free(conn1);
    %>
    <div>
    </div>
    <table style="border-bottom: 1px dashed black;">
        <tr>
            <td>&nbsp;</td>
            <td>商品名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>购买数量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>单价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>总计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>操作</td>
        </tr>
    </table>
    <table>
        <div>
            <%! public String getString1(String str) {
                if (str == null) {
                    str = "";
                } else {
                    try {
                        byte[] b = str.getBytes("UTF-8");
                        str = new String(b);
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
                return str;
            }%>

            <%
                int i = 0;
                for (int h = 0; h < lb.size(); h++) {
            %>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr style="height:100px; background-color: lightcyan">
                <td>
                    <input style="display: none" name="<%=i%>" value="false">
                    <input type="checkbox" name="car" id="caddd" onclick="add(this)"
                           value="<%out.print( Double.parseDouble(lb.get(h).getPrice())*Integer.parseInt(lb.get(h).getAmount())*0.8);%>">
                    <input style="display: none" name="<%=++i%>" value="<%=lb.get(h).getID()%>">
                    <input type="text" name="pric" style="display: none"
                           value="<%out.print(lb.get(h).getPrice());%>">
                    <input type="text" style="display: none"
                           value="<%out.print( lb.get(h).getAmount());%>" name="amount">
                </td>
                <td><input type="text" style="border: none ;background-color: lightcyan"
                           value="<%out.print(lb.get(h).getName());%>" name="name" id="name"></td>
                <td>
                    <a href="/drop?name=<%=lb.get(h).getID()%>&ID=<%=ren1.getName()%>" aria-disabled="false"
                       style="text-decoration: none;"
                       id="dop" onclick="disabled()">-</a>
                    <input type="text" style="width: 50px ;background-color: lightcyan" oninput="disabled(this)"
                           value="<%out.print(lb.get(h).getAmount());%>" name="amount" id="amount">
                    <a href="/add?name=<%=lb.get(h).getID()%>&ID=<%=ren1.getName()%>"
                       style="text-decoration: none;background-color: lightcyan">+</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td><input type="text" name="pric" style="width: 100px;border: none;background-color: lightcyan"
                           value="<%out.print(new DecimalFormat( "0.00").format( Double.parseDouble(lb.get(h).getPrice())*0.8));%>">&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <input type="text" style="border: none; background-color: lightcyan"
                           value="<%out.print(new DecimalFormat( "0.00").format(Double.parseDouble(lb.get(h).getPrice())*Integer.parseInt(lb.get(h).getAmount())*0.8));%>" name="fa">
                </td>
                <td><a href="/delete?name=<%=lb.get(h).getID()%>&ID=<%=ren1.getName()%>"
                       style="border: none ;background-color: orange;color: white  ;text-decoration: none"> 删除</a></td>
            </tr>
            <% i++;
            }%>

        </div>
    </table>
    <p>&nbsp;</p>
    <div style="background-color: lightgrey ;width: 100%;height: 50px;font-size: 30px">
        <input type="text" style="display: none;" value="<%=i%>" name="amt">
        您需支付￥<input type="text" name="price1"
                    style="border: none; color: orangered ;background-color: lightgrey;font-size: 30px;width: 10%"
                    value="0.00" id="price">
        <input type="submit" value="提交订单" style="background-color: orange;color:white;height: 50px;width: 10%">
    </div>
    <input name="username" style="display: none" value="<%=ren1.getName()%>">
</form>
</body>
</html>
