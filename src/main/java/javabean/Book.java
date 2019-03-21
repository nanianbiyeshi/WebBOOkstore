package javabean;

public class Book {
    private String name=null;
    private String author=null;
    private String  introduction=null;
    private String class1=null;
    private String phonenumber=null;
    private String path =null;
    private String price=null;
    private String amount=null;
    private String ID=null;
    public void setAmount(String amount) {

        this.amount = amount;
    }

    public String getAmount() {
        return amount;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {

        return price;
    }

    public Book() {
    }

    public String getClass1() {
        return class1;
    }

    public void setClass1(String class1) {
        this.class1 = class1;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getIntroduction() {
        return introduction;
    }


    public String getPhonenumber() {
        return phonenumber;
    }

    public String getPath() {
        return path;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }



    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getID() {

        return ID;
    }

}
