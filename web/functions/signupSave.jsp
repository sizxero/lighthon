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
<%@ page import="lighthon.dto.MemberDTO" %>
<%@ page import="lighthon.dao.MemberDAO" %>
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

    MemberDTO dto = new MemberDTO(m_id, m_pw, m_name, m_nickname, m_phone, m_email, m_zipcode, m_city, m_street, m_file, m_size);
    MemberDAO dao = new MemberDAO();
    dao.insertMember(dto);
    response.sendRedirect("../pages/login.jsp");
%>
</body>
</html>
