<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs_main=conn.executeQuery("select * from tb_order where orderID="+ID);
	int orderID=0;
	String address="";
	String postcode="";
	String tel="";
	String bz="";
	int goodID=-1;
	String bookname="";
	float nowprice=0;
	int number=0;
	if(rs_main.next()){
		orderID=rs_main.getInt("orderID");
		address=rs_main.getString("address");
		postcode=rs_main.getString("postcode");
		tel=rs_main.getString("tel");
		bz=rs_main.getString("bz");
		if (bz.equals("")){
			bz="无";
		}
	}
%>
<html>
<head>
<title>BDS书铺――后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script src="onclock.JS"></script>
</head>
<body> 
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1070" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>订单详细信息</b></td>
        <td width="20" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
 <table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="220" align="center" valign="top">
					  <table width="96%" height="131"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LTR_dashed">
                        <tr>
                          <td width="16%" style="padding:5px;">订 单 号：&nbsp;<%=orderID%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">地&nbsp;&nbsp;&nbsp;&nbsp;址：&nbsp;<%=address%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">邮政编码：&nbsp;<%=postcode%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">电&nbsp;&nbsp;&nbsp;&nbsp;话：&nbsp;<%=tel%></td>
                          </tr>
                        <tr>
                          <td style="padding:5px;">备&nbsp;&nbsp;&nbsp;&nbsp;注：&nbsp;<%=bz%></td>
                        </tr>
                      </table>
					  <table width="96%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#E6E6E6" bordercolordark="#FFFFFF" class="tableBorder_dashed">
                        <tr align="center" bgcolor="#eeeeee">
                          <td width="21%" height="24">书名称</td>
                          <td width="45%">书名称</td>
                          <td width="22%">单价</td>
                          <td width="12%">数量</td>
                          </tr>
						<%ResultSet rs=conn.executeQuery("select * from V_order_detail where orderID="+orderID);
						while(rs.next()){
							goodID=rs.getInt("bookID");
							bookname=rs.getString("bookname");
							nowprice=rs.getFloat("price");
							number=rs.getInt("number");
						%>  
                        <tr align="center">
                          <td height="27"><%=bookname%></td>
                          <td height="27"><%=bookname%></td>
                          <td><%=nowprice%>(元)</td>
                          <td><%=number%></td>
                          </tr>
						 <%}%>
                      </table>
					  <table width="100%" height="49"  border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center"><input name="Submit" type="submit" class="btn_bg_short" value="返回" onClick="history.back(-1)"></td>
                        </tr>
                      </table></td>
            </tr>
          </table> 
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>
<%}
%>