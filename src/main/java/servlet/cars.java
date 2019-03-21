package servlet;

import jdbc.MyDatasource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class cars extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if(request.getParameter("price1").equals("0.00"))
        {
            response.sendRedirect("shopcar.jsp");
            return ;
        }

        Connection conn = null;
        try {
            conn = MyDatasource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Statement st = null;
        try {
            st = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ms");
        String S = df.format(date);
        String username = request.getParameter("username");
        int amount = Integer.parseInt(request.getParameter("amt"));
        for (int i = 0; i < amount; i++) {
            String bo = request.getParameter(String.valueOf(i));

            if (bo.equals("true")) {
                try {
                    conn = MyDatasource.getConnection();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                try {
                    st = conn.createStatement();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String ID2 = request.getParameter(String.valueOf(++i));
                String sql = "update car set ID=" + "'" + S + "'" + "  where ID2= " + "'" + ID2 + "'" + " and uerrid=" + "'" + username + "' and  ID='0'";
                try {
                    if (st.executeUpdate(sql) > 0) {
                        st.close();
                        MyDatasource.free(conn);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            } else {
                i++;
            }
        }
        if(!request.getParameter("price1").equals("0.00")){
        try {
            Connection conn1=MyDatasource.getConnection();
            Statement Stm1=conn1.createStatement();
            String Sql1= "insert into orde values("+"'" + S + "'," + "'" + username + "'," + "'" +request.getParameter("price1") + "')";
            Stm1.executeUpdate(Sql1);
            Stm1.close();
            MyDatasource.free(conn1);
        } catch (Exception e) {
            e.printStackTrace();
        }}


        String sum = request.getParameter("price1");
        request.setAttribute("sum", sum);
        request.setAttribute("ID", S);
        request.getRequestDispatcher("pay.jsp").forward(request, response);
    }
}
