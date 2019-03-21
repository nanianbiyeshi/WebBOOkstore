package jdbc;

import javabean.Book;
import javabean.EBook;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class indexj {
    private ArrayList<Book> blistxin=new ArrayList<Book>();
    private ArrayList<Book> blistwen=new ArrayList<Book>();
    private ArrayList<Book> blistke=new ArrayList<Book>();
    private ArrayList<Book> blisttong=new ArrayList<Book>();
    private ArrayList<Book> blistli=new ArrayList<Book>();
    private ArrayList<EBook> elist=new ArrayList<EBook>();
    private ResultSet ResultSetrs;
    public void getbook () throws Exception {
        Connection conn= MyDatasource.getConnection();
        Statement stm=conn.createStatement();
        String sql="select name,price,path,ID,class from book";
        ResultSet rs=stm.executeQuery(sql);
        while(rs.next()){
             Book b=new Book();
            b.setName(rs.getString("name"));
            b.setPath(rs.getString("path"));
            b.setClass1(rs.getString("class"));
            b.setPrice(rs.getString("price"));
            b.setID(rs.getString("ID"));
            if(b.getClass1().equals("新书推荐"))
                blistxin.add(b);
            if(b.getClass1().equals("文学"))
                blistwen.add(b);
            if(b.getClass1().equals("科技"))
                blistke.add(b);
            if(b.getClass1().equals("童书"))
                blisttong.add(b);
            if(b.getClass1().equals("励志"))
                blistli.add(b);
        }
        rs.close();
        stm.close();
        MyDatasource.free(conn);
    }

    public ArrayList<Book> getBlistli() {
        return blistli;
    }

    public ArrayList<EBook> getEbook() throws Exception {
        Connection conn=MyDatasource.getConnection();
        Statement stm=conn.createStatement();
        String sql="select name,price,path,ID from ebook";
        ResultSet rs=stm.executeQuery(sql);
        while(rs.next()){
            EBook e=new EBook();
            e.setName(rs.getString("name"));
            e.setID(rs.getString("ID"));
            e.setPrice(rs.getString("price"));
            e.setPath(rs.getString("path"));
            elist.add(e);
        }
        stm.close();
        MyDatasource.free(conn);
        return elist;
    }

    public ArrayList<Book> getBlistxin() {
        return blistxin;
    }

    public ArrayList<Book> getBlistwen() {
        return blistwen;
    }

    public ArrayList<Book> getBlistke() {
        return blistke;
    }

    public ArrayList<Book> getBlisttong() {
        return blisttong;
    }
}
