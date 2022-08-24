package lighthon.dto.boards;

public class UpdateReplyDTO {
    private int rNo;
    private String contents;

    public UpdateReplyDTO(int rNo, String contents) {
        this.rNo = rNo;
        this.contents = contents;
    }

    public int getrNo() {
        return rNo;
    }

    public String getContents() {
        return contents;
    }
}
