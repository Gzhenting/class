<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" class="com.tools.ConnDB" scope="page"></jsp:useBean>
<%
String str_subID=request.getParameter("subID");//取得请求中的子类ID号

int P_superID=-1;//定义父类ID
/*int superID=-1;//定义请求中的父类ID*/
ResultSet rs_sub=null;
//查询所属小类的默认选项
if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	//如果请求中父类ID为空，则赋值为-1
	P_superID=-1;
}else{//否则赋值为请求中得父类ID
	P_superID=Integer.parseInt(request.getParameter("superID"));
}
//查询对应父类ID下的所有子类ID号
rs_sub=conn.executeQuery("select * from tb_subType where superType="+P_superID);
int subID=-1;//定义对应子类ID
String subName="";//定义对应子类名称
%>
<select name="typeID" class="textarea" id="typeID">
	<%--取查询结果集中得数据并逐个添加到选择中--%>
<%
	while(rs_sub.next()){
		subID=rs_sub.getInt(1);//获取查询数据集中的子类ID
		subName=rs_sub.getString(3);//获取查询数据集中的子类名称
		if(str_subID!=null && !"".equals(str_subID)){
			int bookSubID=Integer.parseInt(str_subID);
%>
   <option value="<%=subID%>"<%if(subID==bookSubID){out.println(" selected");/*注意此处的分号*/}%>><%=subName%></option>
<%}else{%>
   <option value="<%=subID%>"><%=subName%></option>
<%}
}%>
 </select>
