package lighthon.dao;

import lighthon.dto.boards.BoardDTO;
import lighthon.dto.boards.FreePostInsertDTO;
import lighthon.dto.boards.ReplyDTO;

import java.util.ArrayList;

public class BoardDAO extends SSI {

    MemberDAO dao = new MemberDAO();

    public BoardDAO() {
        try {
            conn = getConnection();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }

    public int freeBoardPostCnt() {
        try {
            SQL = "select count(*) from posts where p_board_no=0";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(SQL);
            if(rs.next())
                cnt = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("error: " + e);
            cnt = -1;
        }
        return cnt;
    }

    public int replyCnt(int postNo) {
        try {
            SQL = "select count(*) from replies where r_post_no=?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postNo);
            rs = pstmt.executeQuery();
            if(rs.next())
                cnt = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("error: " + e);
            cnt = -1;
        }
        return cnt;
    }

    public void insertFreePost(FreePostInsertDTO dto) {
        try {
            SQL = "insert into posts values(POSTS_SEQ.nextval, 0, ?, ?, ?, 0, sysdate)";
            pstmt = conn.prepareStatement(SQL);
            mNo = dao.findNoById(dto.getMemberId());
            System.out.println(mNo);
            pstmt.setInt(1, mNo);
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContents());
            pstmt.executeUpdate();
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
    }

    public ArrayList<BoardDTO> findAllFreePost() {
        arrList = new ArrayList<BoardDTO>();
        try {
            SQL = "select * from (select rownum rn, p_title, p_member_no, p_hit, p_wdate from posts where p_board_no = 0)";
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String memberNick = dao.findNicknameByNo(rs.getInt(3));
                BoardDTO dto = new BoardDTO(rs.getInt(1), rs.getString(2), memberNick, rs.getInt(4), rs.getDate(5));
                arrList.add(dto);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return arrList;
    }

    public void updatePost(int postId) {

    }

    public void deletePost(int postId) {

    }

    public ArrayList<ReplyDTO> findAllReply(int postId) {
        arrList = new ArrayList<ReplyDTO>();
        return arrList;
    }

    public ReplyDTO findReply(int replyId) {
        ReplyDTO dto = null;
        return dto;
    }

    public void insertReply() {

    }

    public void updateReply() {

    }

    public void deleteReply() {

    }
}
