<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*"%>
<%if (session.getAttribute("manager")==null){
	out.println("<script language='javascript'>alert('Äú»¹Ã»ÓÐµÇÂ¼!');window.location.href='../manage/Login_M.jsp';</script>");
}%>
