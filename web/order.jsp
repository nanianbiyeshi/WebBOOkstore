<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javabean.Order" %>
<%@ page import="jdbc.MyDatasource" %>
<%@ page import="javabean.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<div class="header" style="background-color:red;color:white;text-align:center">
<h1>我的订单</h1>
</div>
<jsp:useBean id="ren1" class="javabean.User" scope="session"></jsp:useBean>

    <% Connection conn= MyDatasource.getConnection();
		Statement stm= conn.createStatement();
        String Sql="SELECT orde.ID,money,name,price,car.amount FROM orde ,car,book WHERE orde.userid="+"'"+ ren1.getName() +"'"+"AND car.ID2=book.ID AND orde.ID=car.ID ";
        ResultSet rs=stm.executeQuery(Sql);
        String m="00";
		ArrayList<Order> orders=new ArrayList<Order>();
       	Order order=new Order();
        while(rs.next()){
        	if(m.equals(rs.getString("orde.ID"))){
        		order.setID(rs.getString("orde.ID"));
        		order.setMoney(rs.getString("money"));
        		Book b=new Book();
        		b.setName(rs.getString("name"));
        		b.setPrice(rs.getString("price"));
        		b.setAmount(rs.getString("car.amount"));
        		order.books.add(b);
				if(rs.isLast())
					orders.add(order);
        	}
        	else {
        		m=rs.getString("orde.ID");
        		if(!(order.getID()==null)){
					orders.add(order);}
        		Book b=new Book();
        		b.setName(rs.getString("name"));
        		b.setPrice(rs.getString("price"));
        		b.setAmount(rs.getString("car.amount"));
               	order=new Order();
				order.setID(rs.getString("orde.ID"));
				order.setMoney(rs.getString("money"));
        		order.books.add(b);
        		if(rs.isLast())
					orders.add(order);
        		 	}
        		}
        		rs.close();
       	  stm.close();
       	MyDatasource.free(conn);
        		   for(int i=0; i<orders.size();i++){%>
<div class="order" style="float:right;width:90%;background-color:#F4F5F3">
	<div class="order_detail" align="center">

        
        <div style="float:left; width:35%; height:20px ">订单号：<%=orders.get(i).getID() %></div>
        <div style="float:left; width:35%; height:20px ">总价：<%=orders.get(i).getMoney() %></div>
	</div>
	<div class="order_list" align="right">
		<table width="80%";  border="0" cellspacing="0" >
    	<thead>
		<tr>
	    	<td width=30%>图书名称</td>
	    	<td width=30%>单价</td>
	    	<td width=10%>数量</td>
	    </tr>
    	</thead>
    	<tbody><%
			for (int j = 0; j<orders.get(i).books.size(); j++) {
		%>
            		<tr>
            			<td><%=orders.get(i).books.get(j).getName() %></td>
            			<td><%=new DecimalFormat( "0.00").format(Double.parseDouble(orders.get(i).books.get(j).getPrice())*0.8) %></td>
            			<td><%=orders.get(i).books.get(j).getAmount() %></td>
            		</tr>
		<%
			}
		%>
    	</tbody>
		</table>
	</div>
</div>

<div class="service" style="float:right;width:100%;font-size:small">
	<div style="float:right;width:20%;align:center">
	<p>申请售后</p>
	</div>
	<div style="float:right;width:20%;align:center">
	<p>查看物流</p>
	</div>
</div>
<%
	}
%>
<div style="float:right;width:30%">
<a href="index.jsp">返回主页</a>
</div>
</body>
</html>