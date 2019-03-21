package javabean;

import java.util.ArrayList;

public class EBook  {
    private String name=null;
    private String author=null;
    private String  chapter=null;
    private String  price=null;
    private  String path=null;
    private String contrn=null;
    private String ID=null;

    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }


    public String getPrice() {
        return price;
    }

    public String getPath() {
        return path;
    }

    public String getContrn() {
        return contrn;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setContrn(String contrn) {
        this.contrn = contrn;
    }


}
