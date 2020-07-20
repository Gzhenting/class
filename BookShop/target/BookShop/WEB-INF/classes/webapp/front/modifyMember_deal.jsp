<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!-- 导入java.sql.ResultSet类 -->
<%@ page import="java.sql.ResultSet"%>
<!-- 创建com.tools.ConnDB类的对象 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>会员信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<%
	request.setCharacterEncoding("GBK");
	Integer id = member.getID();//获取流对象会员的ID
	String pwd = member.getPwd();//获取流对象会员输入的密码
	String newPwd = request.getParameter("newPwd");//获取流对象会员输入的新密码

	//通过id查寻会员
	ResultSet rs = conn.executeQuery("select * from tb_member where ID='" + id+ "'");
	String pwdSql="";
		while (rs.next()) {
			pwdSql = rs.getString("passWord");//得到数据库中的密码
		}
		if (!pwd.equals(pwdSql)) {//比较会员输入密码和数据库中的密码
			out.println("<script language='javascript'>alert('原密码不正确！');window.location.href='modifyMember.jsp';</script>");
			return;
		}
	    member.setPwd(newPwd);
		int ret = 0;//记录影响条数
		ret = ins_member.update(member); //更新会员信息
		if (ret != 0) {
		    session.setAttribute("username",member.getUsername());
			out.println("<script language='javascript'>alert('会员信息修改成功！');window.location.href='index.jsp';</script>");
		} else {
			out.println("<script language='javascript'>alert('会员信息修改失败！');window.location.href='modifyMember.jsp';</script>");
		}
	System.out.println("end");
%>
</body>
</html>
