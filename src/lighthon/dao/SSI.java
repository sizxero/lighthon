package lighthon.dao;

import java.util.Date;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.*;

public class SSI {
    ArrayList arrList = null;
    SimpleDateFormat sdf = null;
    java.util.Date date = null;

    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int mNo, mZipcode, mSize;
    String mId, mPw, mName, mNickName, mPhone, mEmail, mCity, mStreet, mFile;
    String SQL, SQL2, SQL3;
    int cnt, total;
    public static boolean duplIdCheck, duplNickCheck;

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
            conn = DriverManager.getConnection(url, "lighthon", "3333");
        } catch(Exception e) {
            System.out.println("DB Error: " + e);
        }
        return conn;
    }
}
