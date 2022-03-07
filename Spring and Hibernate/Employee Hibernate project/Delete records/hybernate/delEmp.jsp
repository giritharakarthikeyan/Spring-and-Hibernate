<%@ page import="mypack.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! String eno; int empno; Session sess = null; %>

<body>
<%

String eno[]=request.getParameterValues("c1");
if(eno!=null)
{
try
{

Configuration cf=new Configuration();
cf.configure();
SessionFactory fact = cf.buildSessionFactory();
sess = fact.openSession();
int count=0;
for(int i=0;i<eno.length;i++)
{
empno=Integer.parseInt(eno[i]);
String hql = "delete from Emp  where empno = "+empno;
Query query = sess.createQuery(hql);
int row = query.executeUpdate();
   if(row>0)
     count++;
}
if (count == 0)
{
out.println("Doesn't deleted any row!");
}
else
{
out.println("Deleted Row: " + count);
}
sess.close();
}
catch(Exception e)
{
System.out.println("e="+e.getMessage());
}

}
%>
<h2><A href="./index.html">Home</a></h2>
</body>
</html>
