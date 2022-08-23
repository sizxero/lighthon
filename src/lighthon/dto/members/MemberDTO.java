package lighthon.dto.members;

public class MemberDTO {
    private String id;
    private String pw;
    private String name;
    private String nickname;
    private String phone;
    private String email;
    private int zipcode;
    private String city;
    private String street;
    private String file;
    private int size;

    public MemberDTO(String id, String pw, String name, String nickname, String phone, String email, int zipcode, String city, String street, String file, int size) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.email = email;
        this.zipcode = zipcode;
        this.city = city;
        this.street = street;
        this.file = file;
        this.size = size;
    }

    public String getId() {
        return id;
    }

    public String getPw() {
        return pw;
    }

    public String getName() {
        return name;
    }

    public String getNickname() {
        return nickname;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public int getZipcode() {
        return zipcode;
    }

    public String getCity() {
        return city;
    }

    public String getStreet() {
        return street;
    }

    public String getFile() {
        return file;
    }

    public int getSize() {
        return size;
    }
}
