package lighthon.dto.boards;

public class FreePostInsertDTO {
    private String memberId;
    private String title;
    private String contents;

    public FreePostInsertDTO(String memberId, String title, String contents) {
        this.memberId = memberId;
        this.title = title;
        this.contents = contents;
    }

    public String getMemberId() {
        return memberId;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }
}
