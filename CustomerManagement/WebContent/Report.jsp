<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Model.Customer" %>
<%@ page import="Service.Customerimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<style type="text/css">
body{
		background-image: url(./images/bgg.jpg);
		background-attachment:fixed;
 }
table,th,td{
border:1px solid black;
font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
}
table{
width:50%;
margin:10% 25%;
}
tr:hover {background-color: #f5f5f5;}
h1{
margin:0% 45%;
font-size: 2em;
  text-align: center;
  color: black;
  font-weight: 100;
  text-transform: capitalize;
  letter-spacing: 1px;
  font-family: 'Geogia', serif;
}
th{

background-color: #4CAF50;
}
th,td{
padding:15px;
text-align:center;
 border-bottom: 1px solid #ddd;
}
.button {
			background-color: Transparent;
			border: 2px solid #8e44ad;
			border-radius: 10px;
			color: black;
			display: block;
			font-family: inherit;
			font-size: 18px;
			padding: 12px;
			width: 17%;
			text-align: center;
			margin: 0;
			margin-left:50%;
  			position: absolute;
			cursor: pointer;
			transition: all 0.3;
  			-ms-transform: translate(-50%, -50%);
  			transform: translate(-50%, -50%);
		}
		
		.button:hover {
			opacity: 0.9;
			background-color: red;
			color: white;
			box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
		}
</style>
</head>

	<%
		Customerimpl impl = new Customerimpl();
		ArrayList<Customer> customers = new ArrayList<>();
		
		customers = impl.listcustomer();
	
	
	%>
<body>
		<div id="cus">
			<h1>Customers</h1>
			<p>Date % Time: <%=new Date().toString()%></p>
			<table>
				<tr>
					<th>Customer Id</th>
					<th>Phone</th>
					<th>Name</th>
					<th>City</th>
					<th>Email</th>
					
				</tr>
				<%for(Customer st:customers){%>
				
				<tr>
					<td><%=st.getId()%></td>
					<td><%=st.getPhoneNo() %></td>
					<td><%=st.getName() %></td>
					<td><%=st.getCity() %></td>
					<td><%=st.getEmail() %></td>
					
				</tr>
			
			
			
			
			<%} %>
			
			</table>
		</div>	
		
<button class="button"onClick="print()">Download Report</button>
<script type="text/javascript">

			function print(){
				var element = document.getElementById("cus");
				var opt = {
				  margin:       1,
				  filename:     'CustomerList.pdf',
				  image:        { type: 'jpeg', quality: 0.98 },
				  html2canvas:  { scale: 2 },
				  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
				};
				 
				// New Promise-based usage:
				html2pdf().from(element).set(opt).save();
	
	
	
}




</script>


</body>
</html>