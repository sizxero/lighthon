package lighthon.dto.boards;

import java.util.Date;

public class BoardDTO {
    private int rn;
    private int no;
    private String title;
    private String nickname;
    private int hit;
    private Date wdate;

    public BoardDTO(int rn, int no, String title, String nickname, int hit, Date wdate) {
        this.rn = rn;
        this.no = no;
        this.title = title;
        this.nickname = nickname;
        this.hit = hit;
        this.wdate = wdate;
    }

    public int getNo() {
        return no;
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
