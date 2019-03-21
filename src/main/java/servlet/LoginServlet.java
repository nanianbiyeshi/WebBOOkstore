package servlet;
import javabean.User;
import jdbc.MyDatasource;
import jdbc.login;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static jdbc.MyDatasource.free;

public class LoginServlet  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
	    login ulist=new login();
        ArrayList<User> ulist2= null;
        try {
            ulist2 = ulist.getUlist();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setCharacterEncoding("UTF-8");
        System.out.println(ulist2.size());
        String  action=request.getParameter("action");
        System.out.println(action);
        if(action!=null) {
            if (action.equals("登录")) {
                String username =request.getParameter("username");
                String password=request.getParameter("password");
                for(int i=0;i<ulist2.size();i++)
                { if(username.equals(ulist2.get(i).getName())&&password.equals(ulist2.get(i).getPassword())){
                    User ren=new User();
                    ren.setName(username);
                     request.setAttribute("user",ren);
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                   return;
                }}
                Object  sb="用户名与密码不一致";
                request.setAttribute("nihao",sb);
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
            if (action.equals("注册")) {
                String username =request.getParameter("username");
                String password=request.getParameter("password");
                for(int i=0;i<ulist2.size();i++){
                    if(username.equals(ulist2.get(i).getName())){
                        Object sn= "用户名已存在请重新注册";
                        request.setAttribute("nihao",sn);
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                        return;
                    }

                }
                Connection conn= null;
                try {
                    conn = MyDatasource.getConnection();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Statement stm= null;
                try {
                    stm = conn.createStatement();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String sql="insert into  usergroup(username,password) values("+"'" +username + "'"+","+"'"+password+"'"+")";
                try {
                    stm.executeUpdate(sql);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    stm.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    MyDatasource.free(conn);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                User ren=new User();
                ren.setName(username);
                request.setAttribute("user",ren);
                request.getRequestDispatcher("index.jsp").forward(request,response);
                return;

            }
        }

}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

