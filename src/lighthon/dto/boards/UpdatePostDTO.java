package lighthon.dto.boards;

public class UpdatePostDTO {
    private String title;
    private String contents;

    public UpdatePostDTO(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }
}
