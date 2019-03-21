package jdbc;
        import java.sql.Connection;
        import java.sql.DriverManager;
        import java.sql.SQLException;
        import java.util.LinkedList;

public final class MyDatasource {
    static LinkedList<Connection> list = new LinkedList<Connection>();
    static int max = 30;
    static int min = 10;
    static int uses = 50;
    static int current = 0;
    static int flag = 0;
    static String url = "jdbc:mysql://localhost:3306/new_schema?" + "user=root&password=men123&useUnicode=true&characterEncoding=UTF8";

    public static Connection getConnection() throws Exception {
        if (flag == 0)
            creat1();
        synchronized (list) {
            if (list.size() > 0)
                return list.removeLast();
            else {
                try {
                    if (current <= max) {
                        return creat();
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        throw new SQLException("已没有连接");
    }
    public static void free(Connection s) throws SQLException {
        if(current>max)
        {current--;
            s.close();}
        else
            list.addFirst(s);
    }

    public static Connection creat() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        current++;
        return DriverManager.getConnection(url);

    }

    public static void creat1() throws Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            int i = 0;
            while (i <= min) {
                Connection c = DriverManager.getConnection(url);
                list.addFirst(c);
                i++;
                current++;
            }
            flag++;
        } catch (SQLException e) {
            System.out.println("MySQL操作错误");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
