<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URLEncoder"%>
<html>
<head>

</head>
<body>
<%
    String path = application.getRealPath("./storage");
    String filename=request.getParameter("filename");
    response.setHeader("Content-Disposition", "attachment;filename="+filename);
    try {
        File file = new File(path, filename);
        InputStream is = new FileInputStream(file);
        OutputStream os = response.getOutputStream();
        long size = file.length();
        byte[] bt = new byte[(int)size];
        is.read(bt, 0, bt.length);
        os.write(bt);
        is.close();
        os.close();
    } catch(Exception e) {
        System.out.println("error: " + e);
    }
%>
</body>
</html>
