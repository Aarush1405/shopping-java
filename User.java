package shopping;
import java.sql.*;

public class User{
	String username,contact,email,address,city,state,pincode,password,cpass,image;
	int userid;
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}
	
	public void setContact(String contact){
		this.contact=contact;
	}
	public String getContact(){
		return contact;
	}
	
	public void setEmail(String email){
		this.email=email;
	}
	public String getEmail(){
		return email;
	}
	
	public void setAddress(String address){
		this.address=address;
	}
	public String getAddress(){
		return address;
	}
	
	public void setCity(String city){
		this.city=city;
	}
	public String getCity(){
		return city;
	}
	
	public void setState(String state){
		this.state=state;
	}
	public String getState(){
		return state;
	}
	
	public void setPincode(String pincode){
		this.pincode=pincode;
	}
	public String getPincode(){
		return pincode;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword(){
		return password;
	}
	
	public void setCpass(String cpass){
		this.cpass=cpass;
	}
	public String getCpass(){
		return cpass;
	}
	
	public void setImage(String image){
		this.image=image;
	}
	public String getImage(){
		return image;
	}
	
	
	
	public void setUserid(int userid){
		this.userid=userid;
	}
	public int getUserid(){
		return userid;
	}
	
	
	
	public String addUser(){
		if(password.equals(cpass)){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
				PreparedStatement ps = con.prepareStatement("insert into users(username,contact,email,address,city,state,pincode,password,cpass,image) values(?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,username);
				ps.setString(2,contact);
				ps.setString(3,email);
				ps.setString(4,address);
				ps.setString(5,city);
				ps.setString(6,state);
				ps.setString(7,pincode);
				ps.setString(8,password);
				ps.setString(9,cpass);
				ps.setString(10,image);
				int a = ps.executeUpdate();
				if(a==1)
					return "Register Successfully....";
				else
					return "Registation Not Completed...";
			}
			catch(Exception e){
				System.out.println(e);
				return "Exception"+e;
			}
		}
		else{
			return "Wrong Password";
		}
	}
	public ResultSet searchUser(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps=con.prepareStatement("select * from users where email=? and password=?");
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
		
	}
	public ResultSet findUser() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from users where userid=?");
			ps.setInt(1,userid);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			
			return null;
		}
	}
	public ResultSet detailUser() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from users where userid=?");
			ps.setInt(1,userid);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			
			return null;
		}
	}
	public String login(){
		try {
			String status="login";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update users set status=? where userid=?");
			ps.setString(1, status);
			ps.setInt(2, userid);
			
			int a = ps.executeUpdate();
			if(a==1)
				return "Status Updated";
			else
				return "Status Not Updated";
		} catch (Exception e) {
			return "Exception"+e;
		}
	}
	public String logout(){
		try {
			String status="logout";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update users set status=? where userid=?");
			ps.setString(1, status);
			ps.setInt(2, userid);
			
			int a = ps.executeUpdate();
			if(a==1)
				return "Logout...Successfully";
			else
				return "Status Not Updated";
		} catch (Exception e) {
			return "Exception"+e;
		}
	}
	public ResultSet viewUser(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from users");
			ResultSet UserResult=ps.executeQuery();
			return UserResult;
		}
		catch(Exception e){
			return null;
		}
	}
	public int deleteUser(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("delete from users where userid=?");
			ps.setInt(1,userid);
			int a=ps.executeUpdate();
			return a;
		}
		catch(Exception e){
			return -1;
		}
	}
	public int changeAddress(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update users set username=?, contact=?, address=?, city=?, state=?, pincode=? where userid=?");
			ps.setString(1,username);
			ps.setString(2,contact);
			ps.setString(3,address);
			ps.setString(4,city);
			ps.setString(5,state);
			ps.setString(6,pincode);
			ps.setInt(7,userid);
			int a = ps.executeUpdate();
			return a;
			/*if(a==1){
				return"hello";
			}
			else
				return "no hello";*/
		}
		catch(Exception e){
			return -1;
		}
	}
}