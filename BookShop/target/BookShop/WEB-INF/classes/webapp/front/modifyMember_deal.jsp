<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!-- ����java.sql.ResultSet�� -->
<%@ page import="java.sql.ResultSet"%>
<!-- ����com.tools.ConnDB��Ķ��� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>��Ա��Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<%
	request.setCharacterEncoding("GBK");
	Integer id = member.getID();//��ȡ�������Ա��ID
	String pwd = member.getPwd();//��ȡ�������Ա���������
	String newPwd = request.getParameter("newPwd");//��ȡ�������Ա�����������

	//ͨ��id��Ѱ��Ա
	ResultSet rs = conn.executeQuery("select * from tb_member where ID='" + id+ "'");
	String pwdSql="";
		while (rs.next()) {
			pwdSql = rs.getString("passWord");//�õ����ݿ��е�����
		}
		if (!pwd.equals(pwdSql)) {//�Ƚϻ�Ա������������ݿ��е�����
			out.println("<script language='javascript'>alert('ԭ���벻��ȷ��');window.location.href='modifyMember.jsp';</script>");
			return;
		}
	    member.setPwd(newPwd);
		int ret = 0;//��¼Ӱ������
		ret = ins_member.update(member); //���»�Ա��Ϣ
		if (ret != 0) {
		    session.setAttribute("username",member.getUsername());
			out.println("<script language='javascript'>alert('��Ա��Ϣ�޸ĳɹ���');window.location.href='index.jsp';</script>");
		} else {
			out.println("<script language='javascript'>alert('��Ա��Ϣ�޸�ʧ�ܣ�');window.location.href='modifyMember.jsp';</script>");
		}
	System.out.println("end");
%>
</body>
</html>
