<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- 引入组件库 -->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>log in</title>
    <script type="text/javascript">
        function formreset() {
            var t = document.getElementById("tab").value = " ";
            var m = document.getElementById("tag").value = "";
        }
        $(document).ready(function(){
            $("#password").blur(function(){
                $('#quren').val("")
                $('#quren').val("请再次输入密码")
                $('#password2').css("border-color",'red')
            });
        });
        function check() {
                if($("#password").val()!=$("#password2").val())
                {$('#quren').val("两次输入的密码不一致")
                    $('#password2').css("border-color",'red')}
                else{
                $('#password2').css("border-color",'gainsboro')
                    $('#quren').val("")}
            }
        function alter() {
            $("#panduan").attr("value", "注册");
            $("#password1").css("display", "block");
            $("#shabi").css("display", "block");
            $("#denglu").css("display", "none");
            $("#zhuce").css("display", "none");
        };
        setTimeout(function() { $("#state").css("display", "none");},1000);
    </script>
</head>
<body>
<jsp:useBean id="user" class="javabean.User" scope="session"></jsp:useBean>

<%!String  nam;%>
<%
    request.setCharacterEncoding("UTF-8");
    nam = (String) request.getAttribute("nihao");
    System.out.println(nam);
    if(nam==null){
        nam="";
    }
%>
<div class="container">
    <div id="xianshi">
        <div class="mydiv"
             style="margin-left: 40px;margin-right: 80px; margin-top: 100px; height: 400px; width: 55%; float: left">
            <img src="http://img62.ddimg.cn/upload_img/00087/hw/ts_hw180330_01-1522377664.jpg" style="width: 100%;height: 300px">
        </div>
        <div class="mydiv" id="nihao3"
             style=" margin-left: 0px; margin-top: 100px; background-color: RGB(255, 255, 255); width: 22%; border: 1px solid black; height: 400px;float: left">

            <p id="state"  style="color: red;"><%=nam%></p>
            <form name="myform" align="center" method="post" action="/login1" style="margin-top: 20px">
                <table style="width: 100%;font-family: 楷体;font-size: 15px;">
                    <tr>
                        <input style="display: none" type="text" value="登录" name="action" id="panduan">
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="paddingtop15" align="left">
                            <div id="username"><span
                                    style=" ">用户&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <input type="text" id="username4" v-model="loginId"  name="username" class="input6 background09 border05"
                                       style="height: 20px; width: 70%;" onfocus="setFocusColor1();"
                                       onblur="setBlurColor1();"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="paddingtop15" align="left"><span
                                style=" font-family: 楷体;">密码&nbsp;&nbsp;&nbsp;&nbsp;</span> <input
                                type="password" id="password" name="password"
                                class="input6 background09 border05"
                                style="height: 20px; width: 70%;" onfocus="setFocusColor2();"
                                onblur="setBlurColor2();" v-model="password"></td>
                    </tr>
                    <tr>
                        <td class="paddingtop15" align="left">
                            <div id="password1" style="display: none">
                        <span
                                style="font-size: 15px; font-family: 楷体;">确认密码</span> <input v-model="password2"
                                    type="password" id="password2" name="password"
                                    style="height: 20px; width: 70%;border-style: solid;outline: none;" oninput="check()"
                                    >
                                <input style="border: none;color: red" id="quren">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="paddingtop15" align="center">
                            <div id="denglu"><input type="submit"
                                                    style="background-color: RGB(255, 68, 0); color: RGB(255, 255, 255); height: 50px; width: 100%;"
                                                    id="onlie"  :disabled="!loginId || !password" name="online" value="登录"
                            /></div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="paddingtop15" align="center">

                            <input type="button"
                                   style="background-color: RGB(255, 68, 0); color: RGB(255, 255, 255); height: 50px; width: 100%;"
                                   id="zhuce" name="oline" value="注册" onclick="alter()"/></td>
                    </tr>
                </table>
                <div id="shabi" style="display: none;width: 100%;float: right">
                    <input  type="submit" :disabled="!loginId || !password"
                           style="background-color: RGB(255, 68, 0); color: RGB(255, 255, 255); height: 50px; width: 100%;"
                             name="oline" value="提交数据" /></td>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
<script type="text/javascript">
    var  vn=new Vue({
        el:"#xianshi",
        data:{
            loginId: '',
            password: ''
        }
    })

</script>
</html>