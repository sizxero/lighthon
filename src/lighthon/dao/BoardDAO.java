package lighthon.dao;

import lighthon.dto.boards.*;

import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

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
            SQL = "select rownum rn, p.* from (select p_no, p_title, p_member_no, p_hit, p_wdate from posts where p_board_no = 0) p order by p.p_no desc";
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String memberNick = dao.findNicknameByNo(rs.getInt(4));
                BoardDTO dto = new BoardDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), memberNick, rs.getInt(5), rs.getDate(6));
                arrList.add(dto);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return arrList;
    }

    public PostDetailDTO findPostById(int postId) {
        PostDetailDTO dto = null;
        try {
            SQL = "select p_member_no, p_title, p_contents, p_hit, p_wdate from posts where p_no=?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postId);
            rs = pstmt.executeQuery();
            int hitupdate = 0;
            while(rs.next()) {
                String memberNick = dao.findNicknameByNo(rs.getInt(1));
                hitupdate = rs.getInt(4);
                dto = new PostDetailDTO(memberNick, rs.getString(2), rs.getString(3), hitupdate++, rs.getDate(5));
            }
            SQL2 = "update posts set p_hit=? where p_no=?";
            pstmt = conn.prepareStatement(SQL2);
            pstmt.setInt(1, hitupdate);
            pstmt.setInt(2, postId);
            pstmt.executeUpdate();
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return dto;
    }

    public void updatePost(UpdatePostDTO dto, int postId) {
        try {
            SQL = "update posts set p_title=?, p_contents=? where p_no=?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContents());
            pstmt.setInt(3, postId);
            pstmt.executeUpdate();
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
    }

    public void deletePost(int postId) {
        try {
            SQL = "delete from posts where p_no=?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postId);
            pstmt.executeUpdate();
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
    }

    public ArrayList<ReplyDTO> findAllReply(int postId) {
        arrList = new ArrayList<ReplyDTO>();
        try {
            SQL = "select * from replies where r_post_no=?";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postId);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ReplyDTO dto= new ReplyDTO(rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getDate(5));
                arrList.add(dto);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return arrList;
    }

    public ReplyDTO findReply(int replyId) {
        ReplyDTO dto = null;
        return dto;
    }

    public void insertReply(InsertReplyDTO dto) {
        try {
            SQL = "insert into replies values(replies_seq.nextval, ?, ?, ?, sysdate)";
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, dto.getPostNo());
            mNo = dao.findNoById(dto.getMemberId());
            pstmt.setInt(2, mNo);
            pstmt.setString(3, dto.getContents());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }

    public void updateReply() {

    }

    public void deleteReply() {

    }
}
