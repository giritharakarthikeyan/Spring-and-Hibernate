<%@ page import="java.util.*,mypack.*,org.hibernate.*,org.hibernate.cfg.*" %>

<%! int id;double sal; String name; Session session1 = null; %>
<body>
<table width="220" border="1">
<form action="./delEmp.jsp">
<tr><th>NUMBER</th><th>NAME</th><th>SALARY</th></tr>		
<%
Configuration cf=new Configuration();
cf.configure();
SessionFactory sf = cf.buildSessionFactory();
session1 =sf.openSession();
//Using from Clause
String SQL_QUERY ="from Emp";
Query query = session1.createQuery(SQL_QUERY);
Iterator it=query.iterate();
while(it.hasNext())
{
Emp e=(Emp)it.next();
id=e.getEmpno();
name=e.getEname();
sal=e.getSal();		
%>		
<tr>
<td><%=id%></td>
<td><%=name%></td>
<td><%=sal%></td>
<td><a href="./updEmp.jsp?a=<%=id%>&b=<%=name%>&c=<%=sal%>">Edit</a></td>
<td><input type="checkbox" value="<%=id%>" name="c1"></td>
</tr>
<%
}
session1.close();

%>
<tr><td colspan="5" align="right"><input type="submit" value="delete"></td></tr>
</form>
</table>
</body>
</html>
