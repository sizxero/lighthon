package lighthon.dao;

import lighthon.dto.MemberDTO;
import lighthon.dto.MemberDetailDTO;
import lighthon.dto.MemberInfoDTO;

import java.util.ArrayList;

public class MemberDAO extends SSI {

    public MemberDAO() {
        try {
            conn = getConnection();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }

    public boolean getDuplIdCheck() {
        System.out.println("get" + duplIdCheck);
        return duplIdCheck;
    }

    public boolean getDuplNickCheck() {
        System.out.println("get" + duplNickCheck);
        return duplNickCheck;
    }

    public String findNicknameById(String id) {
        SQL = "select m_nickname from members where m_id=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next())
                mNickName = rs.getString(1);
        } catch (Exception e) {
            System.out.println("error: " + e);
            mNickName=null;
        }
        return mNickName;
    }

    public boolean login(String id, String pw) {
        SQL = "select count(*) from members where m_id= ? and m_pw= ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt(1);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
            cnt = -1;
        }
        return cnt == 1;
    }

    public boolean isExistId(String id) {
        SQL = "select count(*) from members where m_id=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt(1);
            }
            duplIdCheck = (cnt == 0);
            System.out.println("id중복: " + duplIdCheck);
        } catch(Exception e) {
            System.out.println("error: " + e);
            cnt = 999;
        }
        return cnt >= 1;
    }

    public boolean isExistNickname(String nick) {
        SQL = "select count(*) from members where m_nickname=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, nick);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt(1);
            }
            duplNickCheck = (cnt == 0);
            System.out.println("닉넴중복: " + duplNickCheck);
        } catch(Exception e) {
            System.out.println("error: " + e);
            cnt = 999;
        }
        return cnt >= 1;
    }

    public MemberDetailDTO findMemberById(String id) {
        MemberDetailDTO dto = null;
        SQL = "select * from members where m_id=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                mName = rs.getString("m_name");
                mNickName = rs.getString("m_nickname");
                mPhone = rs.getString("m_phone");
                mEmail = rs.getString("m_email");
                mZipcode = rs.getInt("m_zipcode");
                mCity = rs.getString("m_city");
                mStreet = rs.getString("m_street");
                mFile = rs.getString("m_file");
                dto = new MemberDetailDTO(mName, mNickName, mPhone, mEmail, mZipcode, mCity, mStreet, mFile);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return dto;
    }

    public MemberDetailDTO findMemberByCode(int code) {
        MemberDetailDTO dto = null;
        SQL = "select * from members where m_no=?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, code);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                mName = rs.getString("m_name");
                mNickName = rs.getString("m_nickname");
                mPhone = rs.getString("m_phone");
                mEmail = rs.getString("m_email");
                mZipcode = rs.getInt("m_zipcode");
                mCity = rs.getString("m_city");
                mStreet = rs.getString("m_street");
                mFile = rs.getString("m_file");
                dto = new MemberDetailDTO(mName, mNickName, mPhone, mEmail, mZipcode, mCity, mStreet, mFile);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return dto;
    }

    public int allMemberCnt() {
        SQL = "select count(*) from members";
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(SQL);
            if(rs.next()) {
                cnt = rs.getInt(1);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return cnt;
    }

    public int searchRegionMemberCnt(String region) {
        SQL = "select count(*) from members where M_CITY like '" +region+"%'";
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(SQL);
            if(rs.next()) {
                cnt = rs.getInt(1);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return cnt;
    }

    public ArrayList<MemberInfoDTO> findAllMembers(int start, int end) {
        ArrayList<MemberInfoDTO> dtos = new ArrayList<>();
        SQL = "select * from (select rownum rn, m_no, m_file, m_name, m_city from members) where rn between ? and ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                mNo = rs.getInt(2);
                mFile = rs.getString(3);
                mName = rs.getString(4);
                mCity = rs.getString(5);
                MemberInfoDTO dto = new MemberInfoDTO(mNo, mFile, mName, mCity);
                dtos.add(dto);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return dtos;
    }

    public ArrayList<MemberInfoDTO> findAllMembersSearchByRegion(String region, int start, int end) {
        ArrayList<MemberInfoDTO> dtos = new ArrayList<>();
        SQL = "select * from (select rownum rn, m_no, m_file, m_name, m_city from members where M_CITY like ? || '%') where rn between ? and ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, region);
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                mNo = rs.getInt(2);
                mFile = rs.getString(3);
                mName = rs.getString(4);
                mCity = rs.getString(5);

                MemberInfoDTO dto = new MemberInfoDTO(mNo, mFile, mName, mCity);
                dtos.add(dto);
            }
        } catch(Exception e) {
            System.out.println("error: " + e);
        }
        return dtos;
    }

    public void insertMember(MemberDTO dto) {
        SQL = "insert into members values (members_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPw());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getNickname());
            pstmt.setString(5, dto.getPhone());
            pstmt.setString(6, dto.getEmail());
            pstmt.setInt(7, dto.getZipcode());
            pstmt.setString(8, dto.getCity());
            pstmt.setString(9, dto.getStreet());
            pstmt.setString(10, dto.getFile());
            pstmt.setInt(11, dto.getSize());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }
}
