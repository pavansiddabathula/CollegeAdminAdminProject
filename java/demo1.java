package Demo;
import Demo.Data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class demo1 {
    public Connection con;
    public demo1() {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded...");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb", "root", "");
            System.out.println("Connected to database");
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public String loginCheck1(String username, String password) {
        return loginCheck("studentecap", username, password);
    }

    public String loginCheck2(String username, String password) {
        return loginCheck("facultyecap", username, password);
    }

   
    public String loginCheck3(String username, String password) {
        return loginCheck("adminecap", username, password);
    }

    public String loginCheck(String tableName, String username, String password) {
        String user = null;
        try {
        	PreparedStatement ptm = con.prepareStatement("SELECT * FROM " + tableName + " WHERE User=? AND Password=?");
            ptm.setString(1, username);
            ptm.setString(2, password);
            ResultSet rst = ptm.executeQuery();
            if (rst.next()) {
                    user = rst.getString("User");
                }
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public int doinsert(String RollNumber, String Name, String Branch, String Year, String Gender) {
        int flag = 0;
        try {
            PreparedStatement ptm = con.prepareStatement(
                "INSERT INTO college1 (RollNumber, Name, Branch, Year, Gender) VALUES (?, ?, ?, ?, ?)"
            );
            ptm.setString(1, RollNumber);
            ptm.setString(2, Name);
            ptm.setString(3, Branch);
            ptm.setString(4, Year);
            ptm.setString(5, Gender);
            int r = ptm.executeUpdate();
            if (r > 0) {
                flag = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
	public ArrayList<Data> update(String RollNumber)
	{
		ArrayList<Data> dataList=new ArrayList<Data>();
		try {
	
			 PreparedStatement ptm = con.prepareStatement("Select * from college1 where RollNumber=?");
             ptm.setString(1, RollNumber);
             ResultSet rs=ptm.executeQuery();
            
			while(rs.next())
			{
				dataList.add(new Data(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)));
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return dataList;
	}
   
}
