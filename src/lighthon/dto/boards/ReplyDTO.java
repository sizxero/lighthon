package lighthon.dto.boards;

import java.util.Date;

public class ReplyDTO {
    private int replyNo;
    private int postNo;
    private int memberNo;
    private String contents;
    private Date wdate;

    public ReplyDTO(int replyNo, int postNo, int memberNo, String contents, Date wdate) {
        this.replyNo = replyNo;
        this.postNo = postNo;
        this.memberNo = memberNo;
        this.contents = contents;
        this.wdate = wdate;
    }

    public int getReplyNo() {
        return replyNo;
    }

    public int getPostNo() {
        return postNo;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public String getContents() {
        return contents;
    }

    public Date getWdate() {
        return wdate;
    }
}
