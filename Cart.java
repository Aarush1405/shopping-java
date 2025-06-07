package shopping;
import java.sql.*;
public class Cart{
	int id,userid,cartid,quantity;
	String productname;
	double price;
	
	
	public void setId(int id){
		this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setCartid(int cartid){
		this.cartid=cartid;
	}
	public int getCartid(){
		return cartid;
	}

	public void setUserid(int userid){
		this.userid=userid;
	}
	public int getUserid(){
		return userid;
	}
	public void setProductname(String productname){
		this.productname=productname;
	}
	public String getProductname(){
		return productname;
	}
	public void setPrice(double price){
		this.price=price;
	}
	public double getPrice(){
		return price;
	}
	
	public int addToCart(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("insert into cart(user_id,product_id,product_name,price) values(?,?,?,?)");
			ps.setInt(1,userid);
			ps.setInt(2,id);
			ps.setString(3,productname);
			ps.setDouble(4,price);
			int a=ps.executeUpdate();
			return a;
		}
		catch(Exception e){
			return -1;
		}
	}
	
	public ResultSet cart(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("SELECT cart.id, cart.user_id, cart.product_id, cart.product_name, cart.price, cart.quantity, products.image FROM cart JOIN products ON cart.product_id = products.id WHERE cart.user_id = ?;");
			ps.setInt(1,userid);
			ResultSet CartResult=ps.executeQuery();
			return CartResult;
		}
		catch(Exception e){
			return null;
		}
	}
	public ResultSet cartForOrder(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("SELECT * from cart where user_id=?");
			ps.setInt(1,userid);
			ResultSet CartOrder=ps.executeQuery();
			return CartOrder;
		}
		catch(Exception e){
			return null;
		}
	}
	public double TotalPrice(){
		double totalPrice=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select price, quantity from cart where user_id=?");
			ps.setInt(1,userid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
                    double price = rs.getDouble("price");  
                    int quantity = rs.getInt("quantity");  
                    totalPrice += price * quantity;    
                }
			return totalPrice;
		}
		catch(Exception e){
			return 0;
		}
	}	
	
	public int quantityAdd(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("UPDATE cart c JOIN products p ON c.product_id = p.id SET c.quantity = c.quantity + 1 WHERE c.quantity < p.stock and c.id=?");
			ps.setInt(1,cartid);
			int a=ps.executeUpdate();
			return a;
		}
		catch(Exception e){
			return -1;
		}
	}
	public int quantityDecre(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update cart set quantity=quantity-1 where id=?");
			ps.setInt(1,cartid);
			int a=ps.executeUpdate();
			return a;
		}
		catch(Exception e){
			return -1;
		}
	}
	
	public int quantityZeroDelete(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("delete from cart where user_id=? and quantity=0");
			ps.setInt(1,userid);
			int a=ps.executeUpdate();
			return a;
		}
		catch(Exception e){
			return -1;
		}
	}
	
}