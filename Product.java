package shopping;

import java.sql.*;

public class Product {
	String title, description, category, image;
	int stock, id, product_id;
	double discount, price;

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		return price;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getStock() {
		return stock;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage() {
		return image;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setProductId(int product_id) {
		this.product_id = product_id;
	}

	public int getProductId() {
		return product_id;
	}
	
	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getDiscount() {
		return discount;
	}

	public String addProduct() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement(
					"insert into products (title,description,category,price,stock,image) values(?,?,?,?,?,?)");
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, category);
			ps.setDouble(4, price);
			ps.setInt(5, stock);
			ps.setString(6, image);

			int a = ps.executeUpdate();
			if (a == 1) {
				return "Successfully.....Product Added";
			} else
				return "Product Not Added";
		} catch (Exception e) {
			System.out.println(e);
			return "Exception : " + e;
		}
	}

	public ResultSet showProducts() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products");
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public ResultSet displayProduct() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products where discount!=0.00");

			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			return null;
		}
	}

	public ResultSet searchProduct() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			return null;
		}
	}
	
	public ResultSet searchProductId() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products where id=?");
			ps.setInt(1, product_id);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			return null;
		}
	}

	public ResultSet searchProductCategory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products where category=?");
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			return null;
		}
	}
	public ResultSet searchBarProduct() {
		ResultSet rs=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select * from products where title like ?");
			ps.setString(1, "%"+title+"%");
			rs = ps.executeQuery();
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return rs;
	}
			
	public String deleteProduct() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("delete from products where id=?");
			ps.setInt(1, id);
			int a = ps.executeUpdate();
			if (a == 1)
				return "Product Deleted......Successfully!";
			else
				return "Product not deleted";
		} catch (Exception e) {
			System.out.println(e);
			return "Exception : " + e;
		}
	}

	public String addDiscount() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("update products set discount=? where id=?");
			ps.setDouble(1, discount);
			ps.setInt(2, id);
			int a = ps.executeUpdate();
			if (a == 1)
				return "Product's Discount Is Added....Successfully!";
			else
				return "discount not added";
		} catch (Exception e) {
			System.out.println(e);
			return "Exception : " + e;
		}
	}

	public String editProduct() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement(
					"update products set title=?, description=?, category=?, price=?, stock=?, image=? where id=?");
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, category);
			ps.setDouble(4, price);
			ps.setInt(5, stock);
			ps.setString(6, image);
			ps.setInt(7, id);
			int a = ps.executeUpdate();
			if (a == 1)
				return "Successfully......Product Details Updated !";
			else
				return "Record not updated";
		} catch (Exception e) {
			System.out.println(e);
			return "Exception : " + e;
		}
	}
	public int checkStock() {
		try {
			int stock=0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shopping?user=root&password=aarush");
			PreparedStatement ps = con.prepareStatement("select stock from products where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				stock=rs.getInt("stock");
			}
			return stock;
		}
		catch(Exception e){
			return -1;
		}
	}
}