<%@ page import="java.util.*,mypack.*,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration" %>

<body>
<%
String num=request.getParameter("a");
String  name=request.getParameter("b");
String sal=request.getParameter("c");
String sub=request.getParameter("s1");
int empno=0;
double salary=0;
if(sub != null)
{
 empno=Integer.parseInt(num);
salary=Double.parseDouble(sal);
try
{
Configuration cf=new Configuration();
cf.configure();
SessionFactory fact = cf.buildSessionFactory();
Session sess = fact.openSession();
Transaction tr = sess.beginTransaction();
Emp e = (Emp)sess.get(Emp.class,empno);
e.setEname(name);
e.setSal(salary);
tr.commit();
sess.update(e);
sess.close();
out.println("<h1>Updated successfully!</h1>");
}
catch(Exception e)
{
System.out.println("e="+e.getMessage());
}

}
%>

<form name="f1">
  <table width="371" border="1">
    <tr>
      <th> Emp No </th>
      <td><input name="a" type="text" value="<%= num %>" onFocus="this.blur()">
      </td>
    </tr>
    <tr>
      <th>Emp Name </th>
      <td><input name="b" type="text" value="<%= name %>" ></td>
    </tr>
    <tr>
      <th>Salary </th>
      <td><input name="c" type="text" value="<%= sal %>"></td>
    </tr>
   <tr>
      <th colspan="2"><input type="submit"  name="s1" value="Save" >
      </th>
    </tr>
  </table>
</form>
</body>
</html>
