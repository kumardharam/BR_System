package pack1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class connection {
	static Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public static Connection connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/br_system", "root", "kumardharam123");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error :" + e);
		}
		return con;
	}

	public static String stoppagename(String a) {
		String s_id = a, s_name = null;
		try {
			PreparedStatement ps1 = con.prepareStatement("select stop_name from stoppage_table where stop_id=?");
			ps1.setString(1, s_id);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				s_name = rs1.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return s_name;
	}

	public static String datestr(String d) {
		String sdate1[] = d.split("-");
		String sdate = sdate1[1] + "/" + sdate1[2] + "/" + sdate1[0];
		return sdate;

	}

	public static String datesql(String d) {
		String sdate1[] = d.split("/");
		String sdate = sdate1[2] + "-" + sdate1[0] + "-" + sdate1[1];
		return sdate;
	}

	public static String sd_stoppage(int n) {
		int bus_id = n;
		String sname = null;
		try {
			PreparedStatement ps1 = con
					.prepareStatement("select source_stop,destination_stop from bus_table where bus_id=?");
			ps1.setInt(1, bus_id);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				// s1=rs1.getString(1).toString();
				sname = stoppagename(rs1.getString(1)) + "," + stoppagename(rs1.getString(2));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return sname;
	}

	public static String question(String q) {
		String qname = q;
		if (qname.equals("school")) {
			qname="What was your First School";
		} else if (qname.equals("color")) {
			qname="What is Your Favourite Color";
		} else if (qname.equals("hero")) {
			qname="Who is Your Favourite Hero";
		}else if (qname.equals("teacher")) {
			qname="Who was Your Favourite Teacher";
		}else if (qname.equals("team")) {
			qname="What is your Favourite Sports";
		}

		return qname;
	}
	
	public static String username(String n) {
		String uid = n;
		try {
			PreparedStatement ps1 = con.prepareStatement("select name from user_table where user_id=?");
			ps1.setString(1, uid);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				// s1=rs1.getString(1).toString();
				uid = rs1.getString(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return uid;
	}
	
	public static String busname(int n) {
		int bus_id = n;
		String bname = null;
		try {
			PreparedStatement ps1 = con
					.prepareStatement("select bus_name from bus_table where bus_id=?");
			ps1.setInt(1, bus_id);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				// s1=rs1.getString(1).toString();
				bname = rs1.getString(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return bname;
	}
	
	public static String dayavail(int n) {
		int bus_id = n;
		String dname = null;
		int i=0;
		try {
			PreparedStatement ps1 = con
					.prepareStatement("select day from bus_day_avil where bus_id=?");
			ps1.setInt(1, bus_id);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				i=i+1;
				if(i==1){
					dname = rs1.getString(1);
				}
				else{
					dname=dname+","+rs1.getString(1);
				}
			
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return dname;
	}
	 
	 public static int yesno(int n) {
		 int bus_id=n,i=0;
		 try{
			 PreparedStatement ps=con.prepareStatement("select distinct bus_id from bus_status where bus_id=?");
			 ps.setInt(1, bus_id);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 i=1;
			 }
		 }catch(Exception e){
			 
		 }
		 return i;
	}
	
	 public static int yesno1(String n) {
		 String bus_id=n;
				 ;
		 int i=0;
		 try{
			 PreparedStatement ps=con.prepareStatement("select bus_id from bus_table  where source_stop=? or destination_stop=?;");
			 ps.setString(1, bus_id);
			 ps.setString(2, bus_id);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 i=1;
			 }
		 }catch(Exception e){
			 //System.out.println(e);
		 }
		 return i;
	}
	 
}
