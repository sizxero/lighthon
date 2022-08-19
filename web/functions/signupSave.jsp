<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-18
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/serverSideInclude.jsp"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<html>
<head>
    <title>⚡ 회원가입</title>
</head>
<body>
<%
    String path = application.getRealPath("./storage");
    int sizeLimit = 1024*1024*7;
    MultipartRequest multiReq = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
    m_id = multiReq.getParameter("id");
    m_pw = multiReq.getParameter("pw");
    m_name = multiReq.getParameter("name");
    m_nickname = multiReq.getParameter("nick");
    m_phone = multiReq.getParameter("phone");
    m_email = multiReq.getParameter("email");
    m_zipcode = Integer.parseInt(multiReq.getParameter("zipcode"));
    m_city = multiReq.getParameter("city");
    m_street = multiReq.getParameter("street");
    m_file = multiReq.getFilesystemName("file1");
    if(m_file != null)
        m_size = (int)multiReq.getFile("file1").length();
    else
        m_size = 0;

    gSQL = "insert into members values (members_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setString(1, m_id);
        pstmt.setString(2, m_pw);
        pstmt.setString(3, m_name);
        pstmt.setString(4, m_nickname);
        pstmt.setString(5, m_phone);
        pstmt.setString(6, m_email);
        pstmt.setInt(7, m_zipcode);
        pstmt.setString(8, m_city);
        pstmt.setString(9, m_street);
        pstmt.setString(10, m_file);
        pstmt.setInt(11, m_size);
        pstmt.executeUpdate();
    } catch (Exception e) {
        System.out.println("error: " + e);
    }
    System.out.println("가입 성공");
    response.sendRedirect("../pages/login.jsp");
%>
</body>
</html>
