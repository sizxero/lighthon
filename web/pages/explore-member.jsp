<%--
  Created by IntelliJ IDEA.
  User: gsu07
  Date: 2022-08-19
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dto.ExploreMemberDTO" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>⚡ 팀원찾기</title>
    <style>
        div#page-info {
            padding-top: 30px;
        }
        div#members_container {
            display: flex;
            justify-content: space-between;
            padding: 30px 0;
        }

        div.member {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        div.member a{
            color: black;
            font-weight: bold;
        }

        div.member a:hover{
            color: #ffc107;
        }

        div#pagination {
            padding-bottom: 30px;
        }

    </style>
</head>
<body>
<%@ include file="/commons/header.jsp"%>
<%!
    String pnum;
    int pageNum;
    int start, end;
    int startPage, endPage;
    int pageSize = 3;
    int pageCount = 5;
    String returnPage;
%>
<%
    pnum = request.getParameter("page");
    if(pnum == null)
        pageNum = 1;
    else
        pageNum = Integer.parseInt(pnum);
    start = pageSize*(pageNum-1) + 1;
    end = pageSize*pageNum;
    if(pageNum%pageCount != 0) {
        startPage = (pageNum/pageCount)*pageCount+1;
        endPage = (pageNum/pageCount+1) * pageCount;
    } else {
        startPage = ((pageNum/pageCount)-1)*pageCount + 1;
        endPage = (pageNum/pageCount)*pageCount;
    }
%>
<%
    gSQL = "select count(*) from members";
    try {
        stmt = conn.createStatement();
        rs = stmt.executeQuery(gSQL);
        if(rs.next()) {
            cnt = rs.getInt(1);
        }
    } catch(Exception e) {
        System.out.println("error: " + e);
    }
    if(endPage > cnt/pageSize) {
        endPage = cnt/pageSize + 1;
    }
%>
<%
    ArrayList<ExploreMemberDTO> dtos = new ArrayList<>();

    gSQL = "select * from (select rownum rn, m_no, m_file, m_name, m_city from members) where rn between ? and ?";
    try {
        pstmt = conn.prepareStatement(gSQL);
        pstmt.setInt(1, start);
        pstmt.setInt(2, end);
        rs = pstmt.executeQuery();
        while(rs.next()) {
            m_no = rs.getInt(2);
            m_file = rs.getString(3);
            m_name = rs.getString(4);
            m_city = rs.getString(5);

            ExploreMemberDTO dto = new ExploreMemberDTO(m_no, m_file, m_name, m_city);
            dtos.add(dto);
        }
    } catch(Exception e) {
        System.out.println("error: " + e);
    }
%>
<div class="container">
    <div id="page-info">
        <h1>팀원 찾기</h1>
    </div>
    <div class="container" id="members_container">
        <%
            for (ExploreMemberDTO dto: dtos) {
                String[] addrArr = dto.getCity().split(" ");
                String address = addrArr[0] + " " + addrArr[1];

                String filename = "";
                if(dto.getFile() == null) {
                    filename = "default.jpeg";
                } else {
                    filename = dto.getFile();
                }
        %>
        <div class="member">
            <div><img src="/storage/<%=filename%>" width="250px" height="250px"></div>
            <div><a href="explore-member-detail.jsp?code=<%=dto.getNo()%>"><h2><%=dto.getName()%></h2></a></div>
            <div><h5><%=address%></h5></div>
        </div>
        <%
            }
        %>
    </div>

    <div id="pagination" align="center">
        <%
            returnPage="explore-member.jsp?";
            if(startPage != 1)
                out.println("<a class='btn btn-outline-warning' href='" + returnPage +"page=" + (startPage-1) + "'><<</a>");
            for(int i = startPage; i <= endPage; i++) {
                out.println("<a class='btn btn-outline-warning' href='" + returnPage +"page=" + i +"'>" + i + "</a>");
            }
            if(endPage != cnt/pageSize+1)
                out.println("<a class='btn btn-outline-warning' href='" + returnPage +"page=" + (endPage+1) + "'>>></a>");
        %>
    </div>
</div>
</body>
</html>
