package lighthon.dto;

public class MemberDetailDTO {
    private String name;
    private String nickname;
    private String phone;
    private String email;
    private int zipCode;
    private String city;
    private String street;
    private String file;

    public MemberDetailDTO(String name, String nickname, String phone, String email, int zipCode, String city, String street, String file) {
        this.name = name;
        this.nickname = nickname;
        this.phone = phone;
        this.email = email;
        this.zipCode = zipCode;
        this.city = city;
        this.street = street;
        this.file = file;
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

    public int getZipCode() {
        return zipCode;
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
}
