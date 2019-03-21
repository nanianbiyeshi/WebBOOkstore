package servlet;

import javabean.Book;
import javabean.EBook;
import jdbc.MyDatasource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import static jdbc.MyDatasource.free;

public class search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String s=req.getParameter("search");
        if(s!=null) {
            Connection conn = null;
            try {
                conn = MyDatasource.getConnection();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                Statement stm = conn.createStatement();
                String sql = "Select*from book where name LIKE "+"'"+s+"%"+"'"+" OR class LIKE "+"'"+s+"%"+"'"+" OR author LIKE "+"'"+s+"%"+"'";
                System.out.println(sql);
                ResultSet rs=stm.executeQuery(sql);
                ArrayList<Book> blist=new ArrayList<Book>();
                while(rs.next()){
                    Book b=new Book();
                    b.setName(rs.getString("name"));
                    b.setPath(rs.getString("path"));
                    b.setPrice(rs.getString("price"));
                    b.setID(rs.getString("ID"));
                    blist.add(b);
                }
                rs.close();
                stm.close();
                MyDatasource.free(conn);
                conn=MyDatasource.getConnection();
                Statement stm1 = conn.createStatement();
                String sql1 = "Select*from ebook where name LIKE "+"'"+s+"%"+"'"+" OR author LIKE "+"'"+s+"%"+"'"+" OR class LIKE "+"'"+s+"%"+"'";
                System.out.println(sql1);
                ResultSet rs1=stm1.executeQuery(sql1);
                ArrayList<EBook> elist=new ArrayList<EBook>();
                while(rs1.next()){
                    EBook e=new EBook();
                    e.setName(rs1.getString("name"));
                    e.setPath(rs1.getString("path"));
                    e.setPrice(rs1.getString("price"));
                    e.setID(rs1.getString("ID"));
                    elist.add(e);
                }
                rs1.close();
                stm1.close();
                MyDatasource.free(conn);
                if(blist.size()==0&&elist.size()==0)
                {
                    String S="您查找的内容不存在";
                    req.setAttribute("state",S);
                    req.getRequestDispatcher("search.jsp").forward(req,resp);
                return;
                }

                req.setAttribute("search",blist);
                req.setAttribute("search1",elist);
                req.getRequestDispatcher("search.jsp").forward(req,resp);

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else
        {
            String S="您查找的内容不存在";
            req.setAttribute("state",s);
            req.getRequestDispatcher("search.jsp").forward(req,resp);
        }


    }
}
