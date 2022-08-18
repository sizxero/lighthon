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
    paramId = multiReq.getParameter("id");
    m_pw = multiReq.getParameter("pw");
    m_name = multiReq.getParameter("name");
    m_nickname = multiReq.getParameter("nickname");
    m_phone = multiReq.getParameter("phone");
    m_email = multiReq.getParameter("email");
    m_zipcode = Integer.parseInt(multiReq.getParameter("zipcode"));
    m_city = multiReq.getParameter("city");
    m_street = multiReq.getParameter("street");
    m_file = multiReq.getFilesystemName("file1");
    m_size = (int)multiReq.getFile("file1").length();

    System.out.println(paramId);
    System.out.println(m_name);
    System.out.println(m_file);
    System.out.println(m_size);
%>
</body>
</html>
