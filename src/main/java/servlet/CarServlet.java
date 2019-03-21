package servlet;

import jdbc.MyDatasource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String s = req.getParameter("ID");
        String s1 = req.getParameter("user");
        String s2 = req.getParameter("amount");

        System.out.println(s1);
        if (s1.equals("null")) {
            System.out.println(s1);
            resp.sendRedirect("login.jsp");
            return;
        }else{
        if (s!="null"&&s2!="null") {
            Connection conn = null;
            try {
                conn = MyDatasource.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Statement stm = conn.createStatement();
                String sql = "Select *from car where ID2=" + "'" + s + "'" + "AND ID=0"+" AND uerrid="+"'"+s1+"'";
                ResultSet rs = stm.executeQuery(sql);
                if (rs.next()) {
                    rs.close();
                    stm.close();
                    MyDatasource.free(conn);
                    Statement stm1 = conn.createStatement();
                    String sql1 = "update car set amount=" + "'" + s2 + "'" + " where ID2=" + "'" + s + "'" + " AND ID='0'"+" AND uerrid="+"'"+s1+"'";
                    if (stm1.executeUpdate(sql1) > 0) {
                        resp.sendRedirect("prewview.jsp?ID=" + s);
                        return;
                    }

                } else {
                    conn = MyDatasource.getConnection();

                    Statement stm2 = conn.createStatement();
                    String sql2 = "insert into car values('0'," + "'" + s + "'," + "'" + s1 + "'," + "'" + s2 + "')";
                    if (stm2.executeUpdate(sql2) > 0) {
                        stm2.close();
                        MyDatasource.free(conn);
                        resp.sendRedirect("prewview.jsp?ID=" + s);
                        return;

                    } else
                    {
                        stm2.close();
                        MyDatasource.free(conn);
                        resp.sendRedirect("index.jsp");
                        return;}
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }}

    }

}
