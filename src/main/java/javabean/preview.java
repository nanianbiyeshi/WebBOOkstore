package javabean;

import jdbc.MyDatasource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
public class preview {
private Book B=new Book();
private  EBook EB=new EBook();


    public preview() {

    }

    public void getBooK(String S) throws Exception{
        if(S!=null)
        {
            Connection conn= MyDatasource.getConnection();
            Statement stm=conn.createStatement();
            String  sql="Select *from book where ID="+"'"+S+"'";
            ResultSet rs=stm.executeQuery(sql);
           if( rs.next()){
               B.setID(rs.getString("ID"));
               B.setPrice(rs.getString("price"));
               B.setPath(rs.getString("path"));
               B.setAuthor(rs.getString("author"));
               B.setName(rs.getString("name"));
               B.setAmount(rs.getString("amount"));
           }
           rs.close();
           stm.close();
           MyDatasource.free(conn);

        }else{
           return;
        }
    }
    public void  getEBooK(String S) throws Exception{
        if(S!=null)
        {
            Connection conn= MyDatasource.getConnection();
            Statement stm=conn.createStatement();
            String  sql="Select *from ebook where ID="+"'"+S+"'";
            ResultSet rs=stm.executeQuery(sql);
            if( rs.next()){
                EB.setID(rs.getString("ID"));
                EB.setPrice(rs.getString("price"));
                EB.setPath(rs.getString("path"));
                EB.setAuthor(rs.getString("author"));
                EB.setName(rs.getString("name"));
            }
            rs.close();
            stm.close();
            MyDatasource.free(conn);

        }else{
            return ;

        }
        return ;
    }
   public lbook getLbook(){
         lbook lb=new lbook();
         if(this.B.getName()!=null)
         {lb.setAmount(B.getAmount());
         lb.setAuthor(B.getAuthor());
         lb.setID(B.getID());
         lb.setPath(B.getPath());
         lb.setPrice(B.getPrice());
         lb.setName(B.getName());
             B=null;
         }
         else
       {
           lb.setAuthor(EB.getAuthor());
           lb.setID(EB.getID());
           lb.setPath(EB.getPath());
           lb.setPrice(EB.getPrice());
           lb.setName(EB.getName());
           EB=null;
       }
        return lb;
   }
}
