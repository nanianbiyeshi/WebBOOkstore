package servlet;

import javabean.EBook;
import jdbc.MyDatasource;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class find extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            String u=req.getParameter("u");
            String ID=req.getParameter("ID");
            String num=req.getParameter("num");
            EBook EB=getEB(u,ID,num);
            if(EB.getID()==null)
            {
            resp.sendRedirect("prewview.jsp?ID="+req.getParameter("ID"));
            }
            else{
                req.setAttribute("u",u);
                req.setAttribute("ID",ID);
                req.setAttribute("num",num);
                req.setAttribute("eb",EB);
                req.getRequestDispatcher("prewview1.jsp").forward(req,resp);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public EBook getEB(String u, String ID,String num) throws Exception {
        EBook e=new EBook();
        Connection conn= MyDatasource.getConnection();
        Statement stm=conn.createStatement();
        String sql="Select ebcontent.ID,name,chaapter,conten from car,ebcontent where ID2=ebcontent.ID AND car.ID!='0' AND uerrid="+"'"+u+"'"+"AND ID2="+"'"+ID+"'"+"AND chaapter="+"'"+num+"'";
        ResultSet rs=stm.executeQuery(sql);
        System.out.println(sql);
        while(rs.next()){
            e.setID(rs.getString("ebcontent.ID"));
            e.setChapter(rs.getString("chaapter"));
            e.setContrn(rs.getString("conten"));
            e.setName(rs.getString("name"));
        }
      return e;
    }
}
