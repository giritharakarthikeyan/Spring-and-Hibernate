package mypack;
/*
  a BEAN FOR HIBERNATE MAPPING
*/
public class Emp {
    
    private Integer empno;
    private String ename;
    private Double sal;
	
	public Emp() {}

    public Emp(int no,String nm,double sl)
    {
        this.empno=no;
        this.ename=nm;
        this.sal=sl;
    }
    
    public Integer getEmpno() {
        return empno;
    }
    public void setEmpno(Integer empno) {
        this.empno = empno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Double getSal() {
        return sal;
    }
    public void setSal(Double sal) {
        this.sal = sal;
    }

}
