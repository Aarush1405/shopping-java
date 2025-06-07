<jsp:useBean id="mybe" class="shopping.Order" />
<jsp:setProperty name="mybe" property="*" />
    <%@ page import="java.sql.*" %>
	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>SHOP_WITH_US - Customer's Order</title>
                <link rel="stylesheet" href="customerOrder.css">
				 <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
                <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
            </head>

            <body>
			<%
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("adminLoginForm.html");
		}
		else{
	%>
			<script>
				function printPage() {
        window.print();
    }
			</script>
			   
			   <header>
        <nav>
            <div class="left">
                <ul>
                    <li>
                        <i class="fa-solid fa-cart-shopping"></i>

                        Shop With Us
                    </li>

                </ul>
            </div>

            <div class="right">
                <ul>
                    <li><a href="index.jsp"><button><i class="fa-solid fa-right-from-bracket"></i>LogOut</button></a>
                    </li>

                </ul>
            </div>
        </nav>
    </header> <section class="quick-links">
            <div class="card">
                <a href="addProduct.jsp"><i class="fa-solid fa-square-plus"></i>&nbsp;Add Product</a>
            </div>
            <div class="card">
                <a href="category.jsp"><i class=" fa-solid fa-right-from-bracket"></i>&nbsp;Category</a>
            </div>
            <div class="card">
                <a href="viewProducts.jsp"><i class="fa-solid fa-book-open-reader"></i>&nbsp;View Product
                </a>
            </div>
            <div class="card">
                <a href="customerOrder.jsp"><i class="fa-solid fa-box-open"></i>&nbsp;Orders</a>
            </div>
            <div class="card">
                <a href="user.jsp">
                    <i class="fa-solid fa-circle-user"></i>&nbsp;Users
                </a>
            </div>
            <div class="card">
                <a href="addAdmin.html">
                    <i class="fa-solid fa-user-tie"></i>&nbsp;Add Admin
                </a>
            </div>

        </section>
                    <div class="container">
						<h2 style="text-align:left;"><button onclick="printPage()">Statement</button></h2>
                        <h2>Customer's Order</h2>
                        <div class="detail-container">
                            <div class="table-container">
							
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Order_Date
                                            </th>
                                            <th>Order_ID</th>
                                            <th>Delivery Address</th>
                                            <th>Product Details</th>
                                            <th>
                                                Payment Type
                                            </th>
											<th>
												Status
											</th>
											<th colspan="2">
												Action
											</th>

                                        </tr>
                                    </thead>
                                    <tbody>
										<%	
											ResultSet rs=mybe.showOrderDetails();
											while(rs.next()){
												int orderId = rs.getInt("order_id");
												int productId = rs.getInt("product_id");
												String productName = rs.getString("product_name");
												int quantity = rs.getInt("quantity");
												double price = rs.getDouble("price");
												double totalPrice = rs.getDouble("total_price");
												String orderDate = rs.getString("order_date");
												String orderStatus = rs.getString("order_status");
												String orderAddress = rs.getString("addr");
												String paymentMethod = rs.getString("payment_method");
												String paymentStatus = rs.getString("payment_status");
												String paymentDate = rs.getString("payment_date");
												String username = rs.getString("username");
												String address=rs.getString("address");
												String city=rs.getString("city");
												String state=rs.getString("state");
												String pincode=rs.getString("pincode");
												String contact=rs.getString("contact");
												double tax=totalPrice*3/100;
												double shipping=totalPrice*0.06/100;
												double totalAmt=totalPrice+tax+shipping;
										%>	
												
									
                                        <tr>
                                            <th>
												<%=orderDate%> 
												</th>
                                            <th><%=orderId%></th>
                                            <th style="text-align:left;width:15%;"><%=orderAddress%>
											</th>
                                            <th style="text-align:left;width:15%;""><%=productName%>
											<br>
											Quantity : <%=quantity%><br>
											 <%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(totalAmt)%>
                                            </th>
                                            <th><%=paymentMethod%>
											
											</th>
											<th><%=orderStatus%></th>
											<form action="updateStatus.jsp" method="get">
											<th>
												<select name="status">
													<option disabled selected>--select--</option>
													<option value="Order Processing">Order Processing</option>
													<option value="Order Received">Order Received</option>
													<option value="Order Packed">Order Packed</option>
													<option value="Out for delivery">Out for Delivery</option>
													<option value="Order Delivered">Order Delivered</option>
													
												</select>
												<input type="hidden" name="order_id" value="<%=orderId%>">
											</th>
											<th>
												<button style="background-color:#007bff;">Update</button>
											</th>
											</form>
                                        </tr>
			<%
											}
			%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                       
                    </div>

                    <footer>
                        <div class="footer-content">
                            <div class="social-media">
                                <a href="#"><img src="./img/facebook.png" alt="Facebook"></a>
                                <a href="#"><img src="./img/twitter.png" alt="Twitter"></a>
                                <a href="#"><img src="./img/insta.png" alt="Instagram"></a>
                            </div>
                            <p>&copy; 2025 SHOP_WITH_US. All Rights Reserved.</p>
                        </div>
                    </footer>
		<%}%>
            </body>
		
         

            </html>
				