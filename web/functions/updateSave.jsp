<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-23
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="lighthon.dto.members.MemberDTO" %>
<%@ page import="lighthon.dao.MemberDAO" %>
<html>
<head>
    <title>⚡ 회원정보 수정</title>
</head>
<body>
<%
    String path = application.getRealPath("./storage");
    int sizeLimit = 1024*1024*7;
    MultipartRequest multiReq = new MultipartRequest(request, path, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
    String m_id = multiReq.getParameter("id");
    String m_pw = multiReq.getParameter("pw");
    String m_name = multiReq.getParameter("name");
    String m_nickname = multiReq.getParameter("nick");
    String m_phone = multiReq.getParameter("phone");
    String m_email = multiReq.getParameter("email");
    int m_zipcode = Integer.parseInt(multiReq.getParameter("zipcode"));
    String m_city = multiReq.getParameter("city");
    String m_street = multiReq.getParameter("street");
    String m_file = multiReq.getFilesystemName("file1");
    int m_size = 0;
    if(m_file != null)
        m_size = (int)multiReq.getFile("file1").length();

    MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_nickname, m_phone, m_email, m_zipcode, m_city, m_street, m_file, m_size);
    MemberDAO dao = new MemberDAO();
    dao.updateMember(dto);
    response.sendRedirect("../pages/mypage.jsp");
%>
</body>
</html>
