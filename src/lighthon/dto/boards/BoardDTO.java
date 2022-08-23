package lighthon.dto.boards;

import java.util.Date;

public class BoardDTO {
    private int rn;
    private String title;
    private String nickname;
    private int hit;
    private Date wdate;

    public BoardDTO(int rn, String title, String nickname, int hit, Date wdate) {
        this.rn = rn;
        this.title = title;
        this.nickname = nickname;
        this.hit = hit;
        this.wdate = wdate;
    }

    public int getRn() {
        return rn;
    }

    public String getTitle() {
        return title;
    }

    public String getNickname() {
        return nickname;
    }

    public int getHit() {
        return hit;
    }

    public Date getWdate() {
        return wdate;
    }
}
