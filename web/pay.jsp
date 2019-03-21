
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="jdbc.MyDatasource" %>
<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/4/15
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>请您支付</title>
    <script>
    function  pay(){
        var show="";
        var apm=document.getElementsByName("paymethod");
        for(i=0;i<apm.length;i++)
        {
            if(apm[i].checked)
            {
                show=apm[i].value;
            }
        }
        switch (show){
            case '1':
                document.getElementById("alibaba").style.display="block";
                document.getElementById("wechat").style.display="none";
                break;
            case '2':
                document.getElementById("alibaba").style.display="none";
                document.getElementById("wechat").style.display="block";
                break;
            default:
                document.getElementById("alibaba").style.display="none";
                document.getElementById("wechat").style.display="none";
                break;
        }

    }
    function goesto()
    {
        alert("付款成功");
        window.location.href="index.jsp";
    }
    </script>
</head>
<body>
<%
    Object sum=request.getAttribute("sum");

%>
<table>

    <tr>
        <td><img src="img\label.jpg"></td>
        <td><span style="font-size: 30px ;top: 10px">收银台</span> </td>
    </tr>
</table>
<form>

    <table>
        <%%>
        <tr style="height: 30px;font-size: 30px">
            <td>订单号</td>
            <td><%=request.getAttribute("ID")%></td>
        <tr style="height: 30px; font-size: 30px">
            <td>合计</td>
            <td>￥<%=request.getAttribute("sum")%> </td>
        </tr>
        <tr style="height: 30px ;font-size: 30px">
            <td>付款方式</td>
            <td style="height: 30px"><input type="radio" name="paymethod"value="1" id="alipays" onclick="pay()" checked><label for="alipays">支付宝</label>
                <input type="radio"name="paymethod" value="2" id="wechats" onclick="pay()"><label for="wechats">微信</label> </td>

        </tr>

    </table>
    <div class="paycode" id="alipay"  >
        <img src="img\pay.jpg" id="alibaba" style="height: 400px ;width: 200px">
    </div>
    <div class="paycode" id="wechat" style="display: none">
        <img src="img\chat.jpg" id="tencent" style="height: 400px ;width: 200px">
    </div>
    <div>
        <span>&nbsp;</span>
    </div>
    <div>
        <span>&nbsp;</span>
    </div>

    <div>
        <span style="color:red">tips:请确保付款后点击下面的按钮</span>
    </div>
    <div>
        <span>&nbsp;</span>
    </div>
    <div>
        <span>&nbsp;</span>
    </div>
    <input type="button" value="我已付款"  onclick="goesto()" style="width: 300px;height: 60px;font-size: 20px;background-color: orange;color:white">
</form>



</body>
</html>
