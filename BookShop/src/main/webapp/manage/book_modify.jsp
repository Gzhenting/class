<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String PID="";//定义图书ID
String bookname="";//定义图书名
int superID1=-1;//定义父类ID
int subID1=-1;//定义子类ID
String introduce="";//定义图书介绍
String picture="";//定义图书图片
float price=0f;//定义图书原价格
float nowprice=0f;//定义图书现价
int sale=0;//定义是否折扣
int newbook=0;//定义是否为新书

PID=request.getParameter("ID");//获得请求中的图书ID
if (PID!=null && PID!=""){//不为空查询图书信息
	int ID=Integer.parseInt(PID);
    ResultSet rs = conn.executeQuery("select t1.ID, t1.typeID, t1.BookName, t1.introduce, t1.price, " +
            "t1.nowPrice, t1.picture, t1.newBook, t1.sale, t2.superType " +
            "from tb_book t1, tb_subtype t2 where t1.ID=" + ID + " and t1.typeID=t2.ID");
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
	}else{
	    //赋值图书信息
		superID1=rs.getInt("superType");
		subID1=rs.getInt("typeID");
		bookname=rs.getString("BookName");
		introduce=rs.getString("introduce");
		price=rs.getFloat("price");
		nowprice=rs.getFloat("nowPrice");		
		picture=rs.getString("picture");
		newbook=rs.getInt("newBook");
		sale=rs.getInt("sale");
	}
	//查询父类ID
	ResultSet rs_super=conn.executeQuery("select ID,TypeName from tb_supertype group by ID,TypeName");
	int superID=-1;
	String superName="";
	if(!rs_super.next()){
		out.println("<script language='javascript'>alert('请先录入类别信息!');window.location.href='index.jsp';</script>");
		return;
	}
%>
<html>
<head>
<title>BDS书铺――后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/jquery.min.js"></script>
<script language="javascript">
/***************************调用函数*************************/
$(document).ready(function(){
	selSubType(<%=superID1%>);
});

function selSubType(val){
$.get("selSubType.jsp",
		{superID:val},
		function(data){
			$("#subType").html(data); 		//显示获取到的小分类
});
}
</script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.bookName.value==""){
		alert("请输入书名称！");form1.bookName.focus();return;
	}
	if (form1.picture.value==""){
		alert("请输入图片文件的路径！");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("请输入图书的定价！");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("您输入的定价错误，请重新输入！");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("请输入图书简介！");form1.introduce.focus();return;
	}		
	form1.submit();
}
</script>

<body>
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
      <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="10" height="38" align="right">&nbsp;</td>
            <td colspan="3" class="tableBorder_B_dashed"><img src="images/manage_ico1.GIF" width="11" height="11">&nbsp;<a href="superType.jsp"> [大分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[小分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="book_add.jsp">[添加图书信息]</a></td>
            <td width="12">&nbsp;</td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td height="10" colspan="3">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="29" align="right">&nbsp;</td>
            <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
            <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>修改图书信息</b></td>
            <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          </table>
                <!---->
            <form action="book_modify_deal.jsp" method="post" name="form1">
                <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;图书ID:
                      <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
                    <td height="27" colspan="3">&nbsp;图书名称:
                      <input name="bookName" type="text" class="Sytle_text" value="<%=bookname%>" size="50"></td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;所属大类：</td>
                    <td width="31%" height="27">
                      <select name="supertype" class="textarea" id="supertype"  onChange="selSubType(this.value)">
					  <%rs_super.first();//从第一个数据开始遍历输出到选择框中
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"<%if(superID==superID1){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    <td width="13%" height="27"> &nbsp;所属小类：</td>
                    <td width="31%" height="27" id="subType">正在调用小分类信息……</td>
                  </tr>
                  <tr>
                    <td height="16">&nbsp;图片文件：</td>
                    <td height="27" colspan="3">&nbsp;
                        <input name="picture" type="text" class="Style_upload" id="picture" value="<%=picture%>" size="30"> 
                        (此处只填写图片文件路径即可)                         </td>
                  </tr>
                  <tr>
                    <td height="27" align="left">&nbsp;定&nbsp;价: </td>
                    <td height="27"><span style="float:left;">
                        <input name="price" type="text" class="Sytle_text" id="price3" value="<%=price%>" size="14"></span>
                        <span  style="float:left;padding-top:10px;">&nbsp;(元)</span></td>
                    <td height="27" align="left">&nbsp;现&nbsp;价: </td>
                    <td height="27"><span style="float:left;">
                        <input name="nowPrice" type="text" class="Sytle_text" id="price4" value="<%=nowprice%>" size="14"></span>
                        <span  style="float:left;padding-top:10px;">&nbsp;(元)</span></td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;是否新品：</td>
                    <td>&nbsp;
                        <input name="newBook" type="radio" class="noborder" value="1"<%if(newbook==1){out.print(" checked");}%>>是
                        <input name="newBook" type="radio" class="noborder" value="0"<%if(newbook==0){out.print(" checked");}%>>否
                    </td>
                    <td>&nbsp;是否特价：</td>
                    <td>
                        <input name="sale" type="radio" class="noborder" value="1"<%if(sale==1){out.print(" checked");}%>>是
                        <input name="sale" type="radio" class="noborder" value="0"<%if(sale==0){out.print(" checked");}%>>否
                    </td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;图书简介：</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce" style="height:180px"><%=introduce%></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_bg_short" value="保存" onClick="mycheck()">
                        <input name="Submit2" type="reset" class="btn_bg_short" value="重置">
                        <input name="Submit3" type="button" class="btn_bg_short" value="返回" onClick="JScript:history.back()">
                    </td>
                  </tr>
                </table>
            </form>
	 <!----> 
      </td>

      <td width="182" valign="top">
          <table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="199" valign="top" bgcolor="#FFFFFF">
                    <jsp:include page="navigation.jsp"/></td>
              </tr>
          </table>
      </td>
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>

<%}else{
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';");
}%>