package lighthon.dto.boards;

public class InsertReplyDTO {
    private int postNo;
    private String memberId;
    private String contents;

    public InsertReplyDTO(int postNo, String memberId, String contents) {
        this.postNo = postNo;
        this.memberId = memberId;
        this.contents = contents;
    }

    public int getPostNo() {
        return postNo;
    }

    public String getMemberId() {
        return memberId;
    }

    public String getContents() {
        return contents;
    }
}
