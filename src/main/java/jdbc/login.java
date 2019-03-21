package jdbc;

import javabean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class login {
    ArrayList<User> ulist=new ArrayList<User>();
    public ArrayList<User> getUlist() throws Exception {
        Connection conn=MyDatasource.getConnection();
        String sql="select * from usergroup ";
        Statement stm=conn.createStatement();
        ResultSet rs=stm.executeQuery(sql);
        while(rs.next()){
            User u=new User();
            u.setPassword(rs.getString("password"));
            u.setName(rs.getString("username"));
            ulist.add(u);
        }
        stm.close();
        MyDatasource.free(conn);
        System.out.println(ulist.size());
        return  ulist;
    }
    public login() {
    }
}
