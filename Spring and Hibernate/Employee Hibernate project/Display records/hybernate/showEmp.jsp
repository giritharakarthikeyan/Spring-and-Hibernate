<%@ page import="java.util.*,mypack.*,org.hibernate.*,org.hibernate.cfg.*" %>

<%! int id;double sal; String name; Session session1 = null; %>
<body>
<table width="220" border="1">
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
</tr>
<%
}
session1.close();
%>
</table>
</body>
</html>
