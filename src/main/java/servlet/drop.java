package servlet;

import jdbc.MyDatasource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import static jdbc.MyDatasource.free;

public class drop extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    {
        String S=request.getParameter("name");
        String ID=request.getParameter("ID");
        String ID2 =request.getParameter("name");
        try {
            request.setCharacterEncoding("UTF-8");

            System.out.println(S);
            if(S!=null){
                Connection conn=MyDatasource.getConnection();
                String sql="update car set amount=amount-1 where amount>1 AND  ID='0' AND uerrid="+"'"+ID+"'"+"AND ID2="+"'"+ID2+"'";
                Statement st=conn.createStatement();
                System.out.println(sql);
                st.executeUpdate(sql);
                st.close();
                free(conn);
                response.sendRedirect("shopcar.jsp");
            }
            else
                return;

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
