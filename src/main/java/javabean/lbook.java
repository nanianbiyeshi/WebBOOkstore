package javabean;

public class lbook {
    private String name=null;
    private  String author=null;
    private String path =null;
    private String price=null;
    private String amount=null;
    private String ID=null;

    public lbook() {
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getPath() {
        return path;
    }

    public String getPrice() {
        return price;
    }

    public String getAmount() {
        return amount;
    }

    public String getID() {
        return ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public void setID(String ID) {
        this.ID = ID;
    }
}
