package shopping;
import java.sql.*;
public class Order{
	int userid,order_id;
	double totalAmt;
	String pay,status,addr;
	
	public void setUserid(int userid){
		this.userid=userid;
	}
	public int getUserid(){
		return userid;
	}
	public void Totalamt(double totalAmt){
		this.totalAmt=totalAmt;
	}
	public double getTotalamt(){
		return totalAmt;
	}
	public void setPay(String pay){
		this.pay=pay;
	}
	public String getPay(){
		return pay;
	}
	public void setOrder_id(int order_id){
		this.order_id=order_id;
	}
	public int getOrder_id(){
		return order_id;
	}
	public void setStatus(String status){
		this.status=status;
	}
	public String getStatus(){
		return status;
	}public void setAddr(String addr){
		this.addr=addr;
	}
	public String getAddr(){
		return addr;
	} 
	
	
		
public String order() {
    Connection con = null;
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    PreparedStatement ps4 = null;
    PreparedStatement ps5 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
	int order_id=0;
    boolean inserted = false;

    try {
        // Load the driver and create ONE connection
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");

        // Retrieve cart items for the user
        ps = con.prepareStatement("SELECT * FROM cart WHERE user_id=?");
        ps.setInt(1, userid);
        rs = ps.executeQuery();

        // Prepare statement to insert into orders
        ps1 = con.prepareStatement(
            "INSERT INTO orders (userid, product_id, product_name, quantity, price, total_price, order_date, addr) " +
            "VALUES (?, ?, ?, ?, ?, ?, NOW(),?)"
        );

        // Prepare statement to update product stock
        ps2 = con.prepareStatement("UPDATE products SET stock = stock - ? WHERE id = ? and stock>0");

		ps3 = con.prepareStatement("delete from cart where user_id=?");
		
		ps5 = con.prepareStatement("select order_id from orders where userid=?");
		
		
		ps4 = con.prepareStatement("insert into payments (product_id,order_id,user_id,payment_method) values(?,?,?,?)");

        // Loop through cart items and insert orders and update stock
        while (rs.next()) {
			
            int product_id = rs.getInt("product_id");
            String product_name = rs.getString("product_name");
            double price = rs.getDouble("price");
            int quantity = rs.getInt("quantity");
            double total_price = price * quantity;
			
            // Insert order into orders table
            ps1.setInt(1, userid);
            ps1.setInt(2, product_id);
            ps1.setString(3, product_name);
            ps1.setInt(4, quantity);
            ps1.setDouble(5, price);
            ps1.setDouble(6, total_price);
			ps1.setString(7,addr);
            ps1.executeUpdate();  // Execute insert into orders

            // Update stock in products table
            ps2.setInt(1, quantity);
            ps2.setInt(2, product_id);
            ps2.executeUpdate();  // Execute stock update

			ps3.setInt(1,userid);
			ps3.executeUpdate();
			
			ps5.setInt(1, userid);
        rs1 = ps5.executeQuery();
			while(rs1.next()){
				order_id = rs1.getInt("order_id");
				
			
			}
			ps4.setInt(1,product_id);
				ps4.setInt(2,order_id);
				ps4.setInt(3,userid);
				ps4.setString(4,pay);
				ps4.executeUpdate();
			
			
			
            inserted = true;
        }

        // Close resources
        ps2.close();
        ps1.close();
        rs.close();
        ps.close();
        con.close();

        // Return appropriate response
        return inserted ? "Order placed successfully!" : "No items in cart!";
    } catch (Exception e) {
        return "Exception: " + e;
    }
}
public ResultSet showOrderDetails(){
	 try {
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
		PreparedStatement ps = con.prepareStatement("SELECT o.order_id, o.userid,o.addr, u.username, u.contact, u.email, u.address, u.city, u.state, u.pincode, o.product_id, o.product_name, o.quantity, o.price, o.total_price, o.order_date, o.order_status, p.payment_method, p.payment_status, p.payment_date FROM orders o INNER JOIN users u ON o.userid = u.userid INNER JOIN payments p ON o.order_id = p.order_id ");
		
		ResultSet rs = ps.executeQuery();
		return rs;
	 }
	 catch(Exception e){
		 return null;
	 }
}
public ResultSet viewOrderDetails(){
	 try {
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
		PreparedStatement ps = con.prepareStatement("SELECT o.order_id, o.userid,o.addr, u.username, u.contact, u.email, u.address, u.city, u.state, u.pincode, o.product_id, o.product_name, o.quantity, o.price, o.total_price, o.order_date, o.order_status, p.payment_method, p.payment_status, p.payment_date ,p1.image FROM orders o INNER JOIN users u ON o.userid = u.userid INNER JOIN payments p ON o.order_id = p.order_id INNER JOIN products p1 ON o.product_id = p1.id where o.userid=?");
		ps.setInt(1,userid);
		ResultSet rs = ps.executeQuery();
		return rs;
	 }
	 catch(Exception e){
		 return null;
	 }
}
public int updateStatus(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
		PreparedStatement ps = con.prepareStatement("update orders set order_status=? where order_id=?");
		ps.setString(1,status);
		ps.setInt(2,order_id);
		int a=ps.executeUpdate();
		return a;
	}
	catch(Exception e){
		return 0;
	}
}
public String updatePaymentStatus(){
	try{
		Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
		PreparedStatement ps = con.prepareStatement("UPDATE payments p " +
                           "INNER JOIN orders o ON p.order_id = o.order_id " +
                           "INNER JOIN users u ON o.userid = u.userid " +
                           "SET p.payment_status = 'completed', p.payment_date = NOW() " +
                           "WHERE u.userid = ?");
		ps.setInt(1,userid);
		int a=ps.executeUpdate();
		if(a==1){
			return "Updated";
		}
		else 
			return "Not Updated";
	}
	catch(Exception e){
		return "Exception : "+e;
	}
}

}