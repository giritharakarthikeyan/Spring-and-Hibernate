<!-- A jsp to insert record through hibernate -->
<%@ page import="mypack.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! 
int empno;double salary;String name; Session session1 = null; 
%>
<body>
<%
String num1=request.getParameter("t1");
if(num1 != null)
{

empno=Integer.parseInt(num1);
name=request.getParameter("t2");
String sal=request.getParameter("t3");
salary=Integer.parseInt(sal);
try
{
Configuration cf=new Configuration();
cf.configure();
SessionFactory sessionFactory = cf.buildSessionFactory();
session1 =sessionFactory.openSession();
Emp e=new Emp(empno,name,salary);
session1.save(e);
session1.flush();
session1.close();
out.println("<h1>Data Inserted Successfully</h1>");
}
catch(Exception e)
{
System.out.println("e="+e.getMessage());
}
}
%>

<form>
  <table width="352" border="1">
    
    <tr>
      <th>Emp Number</th>
      <td><input name="t1" type="text"></td>
    </tr>
    <tr>
      <th> Name </th>
      <td><input name="t2" type="text"></td>
    </tr>
    <tr>
      <th>Salary </th>
      <td><input name="t3" type="text"></td>
    </tr>
    
    <tr>
      <th colspan="2"><input type="submit"value="Submit" >
      </th>
    </tr>
  </table>
</form>

</body>
</html>
