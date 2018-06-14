<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javatools.AccessDB,net.sf.json.JSONArray,net.sf.json.JSONObject,java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<title>网络诊间</title>
		<style type="text/css">
		   table{
		       border:0;
		       cellspacing:0;
		       cellpadding:0;
		   }
		            
		   table tr{
		   
		        border:none;
		        padding:0;
		        margin:0;
		   }
		   td {
	       text-align:center;
	       border:none;
		   	margin:0;
		   	padding:0;
		   	width:150px;
		   }
	
			.tableTitle {
				background-color:#c0c0c0;
				font-size:16px;
				color:white;
			}
			.tableTitle td{
				height:35px;
				text-align:center;
			} 
			.tableContent:nth-child(even){
			    font-size:15px;
				background-color:white;
				color:#9f9f9f;	
				height:30px;
			}
			.tableContent:nth-child(odd){
			    font-size:15px;
				background-color:#7ba6e0;
				color:white;
				height:30px;	
			}

			.addPerson{
				color:#09719f;
				font-size:18px;
			    margin-top: 10px; 
			    margin-bottom: -10px;
			}  

			.addCon{
				margin-top: 20px;
				height: 600px;
				position:relative;
			}
	
</style>
	</head>
	<body>
		  <div id="userInfoDiv">
			<div class="addPerson">专科申请记录</div>
			<div class="addCon formDiv" style="width:90%;">
				<table cellspacing="0">
			  		<tr class="tableTitle">
				  		<td>
				  			患者姓名
				  		</td>
				  		<td>
				  			患者身份证
				  		</td>
				  		<td>
				  			科室名称
				  		</td>
				  		<td>
				  			有效日期
				  		</td>
			  		</tr>
		  		<%
				String id = (String)session.getAttribute("Userid");
				String select = "select * from onlinepreorder inner join doctors on onlinepreorder.doctorId=doctors.account where userId = '"+id+"'" +
				"order by validDay desc";
				AccessDB db = new AccessDB();
				ResultSet resultSet = db.excueteQuery(select);
				JSONArray jsonArray = new JSONArray();
				JSONObject jsonObject = null;
				try {
					while(resultSet!=null&&resultSet.next())
					{
						jsonObject = new JSONObject();
						String name = resultSet.getString("name");
						jsonObject.put("name",name);
						String patientId = resultSet.getString("patientId");
						jsonObject.put("patientId",patientId);
						String departName = resultSet.getString("departName");
						String doctName = resultSet.getString("doctors.name");
						jsonObject.put("departName",departName+" "+doctName);
						
						String validday = resultSet.getString("validday");
						jsonObject.put("validday",validday);
						jsonArray.put(jsonObject);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		  	%>
		  	<%for(int i=0;i<jsonArray.length();i++){ %>
		  		<tr class="tableContent">
		  			<td>
		  				<%=((JSONObject)jsonArray.get(i)).get("name")%>
		  			</td>
		  			<td> 
		  			    <%=((JSONObject)jsonArray.get(i)).get("patientId")%>
		  			</td>
		  			<td> 
		  			    <%=((JSONObject)jsonArray.get(i)).get("departName")%>
		  			</td>
		  			<td>
		  			    <%=((JSONObject)jsonArray.get(i)).get("validday")%>
		  			</td>
		  		</tr>
		  	<%}%>
		  </table>
		 </div>
	  </div>
	</body>
	<script type="text/javascript" src="lib/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../js/index.js"></script>
<script>
	
</script>
</html>
