package lighthon.dao;

import java.util.Date;

public class PostDetailDTO {
    private String writer;
    private String title;
    private String contents;
    private int hit;
    private Date wdate;

    public PostDetailDTO(String writer, String title, String contents, int hit, Date wdate) {
        this.writer = writer;
        this.title = title;
        this.contents = contents;
        this.hit = hit;
        this.wdate = wdate;
    }

    public String getWriter() {
        return writer;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public int getHit() {
        return hit;
    }

    public Date getWdate() {
        return wdate;
    }
}
