package lighthon.dto.members;

public class MemberInfoDTO {
    private int no;
    private String file;
    private String name;
    private String city;

    public MemberInfoDTO(int no, String file, String name, String city) {
        this.no = no;
        this.file = file;
        this.name = name;
        this.city = city;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
