package javabean;

import java.util.ArrayList;

public class Order {
    private  String money=null;
    private  String ID=null;
    public ArrayList<Book> books=new ArrayList<Book>();

    public Order() {
    }

    public String getMoney() {
        return money;
    }

    public String getID() {
        return ID;
    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setBooks(ArrayList<Book> books) {
        this.books = books;
    }
}
