package shopping;
import java.sql.*;
public class Category{
	String title,image,category,oldcategory;
	int id;
	
	public void setTitle(String title){
		this.title=title;
	}
	public String getTitle(){
		return title;
	}
	public void setCategory(String category){
		this.category=category;
	}
	public String getCategory(){
		return category;
	}
	public void setOldcategory(String oldcategory){
		this.oldcategory=oldcategory;
	}
	public String getOldcategory(){
		return oldcategory;
	}
	
	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	
	public void setImage(String image){
		this.image=image;
	}
	public String getImage(){
		return image;
	}
	
	public String addCategory(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("insert into category(title,image) values(?,?)");
			ps.setString(1,title);
			ps.setString(2,image);
			int a = ps.executeUpdate();
			if(a==1)
				return "Record Added";
			else
				return "Record Not Added";
		}
		catch(Exception e){
			System.out.println(e);
			return "Exception"+e;
		}
	}
	public ResultSet showCategory(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from category");
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
	public ResultSet editCategory(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from category where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			return rs;
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
	public String editDBCategory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update category set title=?, image=? where id=?");
			ps.setString(1,title);
			ps.setString(2,image);
			ps.setInt(3,id);
			int a = ps.executeUpdate();
			if(a==1)
				return "Successfully......Category Details Updated !";
			
			else
				return "Record not updated";
		} catch(Exception e) {
			System.out.println(e);
			return "Exception : " + e;
		}
	}
	public String dlt(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("delete from category where id=?");
			ps.setInt(1,id);
			int a=ps.executeUpdate();
			if(a==1)
				return "Deleted";
			else return "not deleted";
		}
		catch(Exception e){
			System.out.println(e);
			return "Exception : "+e;
		}
	}
	public String updateCategoryData(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update products set category='"+title+"' where category='"+oldcategory+"' ");
			
			int a=ps.executeUpdate();
			if(a==1)
				return "Updated Category Data";
			else
				return "Not updated category data";
		}
		catch(Exception e){
			return "Exception : "+e;
		}
	}
}