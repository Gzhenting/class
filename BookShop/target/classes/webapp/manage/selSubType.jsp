<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" class="com.tools.ConnDB" scope="page"></jsp:useBean>
<%
String str_subID=request.getParameter("subID");//ȡ�������е�����ID��

int P_superID=-1;//���常��ID
/*int superID=-1;//���������еĸ���ID*/
ResultSet rs_sub=null;
//��ѯ����С���Ĭ��ѡ��
if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	//��������и���IDΪ�գ���ֵΪ-1
	P_superID=-1;
}else{//����ֵΪ�����еø���ID
	P_superID=Integer.parseInt(request.getParameter("superID"));
}
//��ѯ��Ӧ����ID�µ���������ID��
rs_sub=conn.executeQuery("select * from tb_subType where superType="+P_superID);
int subID=-1;//�����Ӧ����ID
String subName="";//�����Ӧ��������
%>
<select name="typeID" class="textarea" id="typeID">
	<%--ȡ��ѯ������е����ݲ������ӵ�ѡ����--%>
<%
	while(rs_sub.next()){
		subID=rs_sub.getInt(1);//��ȡ��ѯ���ݼ��е�����ID
		subName=rs_sub.getString(3);//��ȡ��ѯ���ݼ��е���������
		if(str_subID!=null && !"".equals(str_subID)){
			int bookSubID=Integer.parseInt(str_subID);
%>
   <option value="<%=subID%>"<%if(subID==bookSubID){out.println(" selected");/*ע��˴��ķֺ�*/}%>><%=subName%></option>
<%}else{%>
   <option value="<%=subID%>"><%=subName%></option>
<%}
}%>
 </select>
