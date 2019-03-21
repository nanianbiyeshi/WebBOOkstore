package javabean;

public class User {
    private String ID=null;
    private String Name=null;
    private String level=null;
    private String  address=null;
    private String phonenumber=null;
    private String password=null;

    public User() {
    }

    public String getID() {
        return ID;
    }

    public String getName() {
        return Name;
    }

    public String getLevel() {
        return level;
    }

    public String getAddress() {
        return address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public String getPassword() {
        return password;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"ID\":\"").append(ID).append('\"');
        sb.append(",\"Name\":\"").append(Name).append('\"');
        sb.append(",\"level\":\"").append(level).append('\"');
        sb.append(",\"address\":\"").append(address).append('\"');
        sb.append(",\"phonenumber\":\"").append(phonenumber).append('\"');
        sb.append(",\"password\":\"").append(password).append('\"');
        sb.append('}');
        return sb.toString();
    }
}
