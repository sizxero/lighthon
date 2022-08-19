<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-17
  Time: 오후 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<html>
<head>
</head>
<body>

<!-- server side include : SSI -->
<%!
    Connection conn = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String id, pw, paramId, m_id, m_pw, m_name, nick, m_nick, m_phone, m_email, m_city, m_street, m_file;
    String m_nickname;
    int gRn, gCode, gEno, gPay, gHit, sCode, m_size, m_zipcode;
    String gName, gTitle, gContent, gWriter, gEmail;
    java.util.Date gWDate, hiredate, birth;
    boolean gGender, gFlag;
    int gTotal=0, total=0, sTotal=0, cnt=0;
    String gData, gSQL, gSQL1, gSQL2, gSQL3;
%>

<%
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url="jdbc:oracle:thin:@localhost:1521:XE";
        conn = DriverManager.getConnection(url, "lighthon", "3333");
        System.out.println("DB Connection Success");
    } catch(Exception e) {
        System.out.println("error: " + e);
    }
%>

</body>
</html>