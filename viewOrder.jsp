<jsp:useBean id="mybe" class="shopping.Order" />
<jsp:setProperty name="mybe" property="*" />

<%@ page language="java" session="true" %>
    <%@ page import="java.sql.*" %>
	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ include file="navbar.jsp" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
                <link rel="stylesheet" href="viewOrder.css">
            </head>

            <body>
			<%
				if(session.getAttribute("id")==null){
						response.sendRedirect("UserLoginForm.jsp");
					}
					else{
				%>
                <div class="product-container">
                    <h2>Products</h2>
                    <div class="box-container">
                        <%	
											ResultSet rs=mybe.viewOrderDetails();
											while(rs.next()){
												String img = rs.getString("image"); 
												int orderId = rs.getInt("order_id");
												int productId = rs.getInt("product_id");
												String productName = rs.getString("product_name");
												int quantity = rs.getInt("quantity");
												double price = rs.getDouble("price");
												double totalPrice = rs.getDouble("total_price");
												String orderDate = rs.getString("order_date");
												String orderStatus = rs.getString("order_status");
												String paymentMethod = rs.getString("payment_method");
												String paymentStatus = rs.getString("payment_status");
												String paymentDate = rs.getString("payment_date");
												String username = rs.getString("username");
												String address=rs.getString("address");
												String city=rs.getString("city");
												String state=rs.getString("state");
												String pincode=rs.getString("pincode");
												String contact=rs.getString("contact");
												String addr=rs.getString("addr");
												double tax=totalPrice*3/100;
												double shipping=totalPrice*0.06/100;
												double totalAmt=totalPrice+tax+shipping;
										%>	
											
                            <div class="box">
                                <p style="background-color:#007bff; color:white;text-align:center;">
									<b><i><%=orderStatus%></i></b>
								</p><br>
								<img src="./img/<%=img%>" alt=""/>
                                <h2 style="text-align:center;">
                                    <b><%=productName%></b>
                                </h2>
                                <p>
                                    <b>Quantity : </b><%=quantity%>
                                </p>
								<p>
                                   <b>Payment : </b> <b><%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format((float)totalAmt)%></b>(including tax & shipping charge)
                                </p>
								<p>
									<b>Order Date & Time : </b> <%=orderDate%>
								</p>
								<p>
									<b>Delivery Address : </b><br><%=addr%>
								</p>
								<p>
									<b>Payment Method : </b> <%=paymentMethod%>
								</p>
								<p>
									<b>Payment Status : </b> <%=paymentStatus%>
								</p>
								<p>
									<b>Payment Date & Time : </b> <%=paymentDate%>
								</p>
									
                                
                            </div>
                            <%}%>
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
            </body>
			<%
					}
			%>
            </html>