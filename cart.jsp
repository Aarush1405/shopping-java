<jsp:useBean id="mybe" class="shopping.User" />
<jsp:setProperty name="mybe" property="*" />
<jsp:useBean id="mybean" class="shopping.Product" />
<jsp:setProperty name="mybean" property="*" />
<jsp:useBean id="mybeanCart" class="shopping.Cart" />
<jsp:setProperty name="mybeanCart" property="*" />
<%@ page language="java" session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ page import="java.sql.*" %>
       <%@ include file="navbar.jsp" %> 
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>SHOP_WITH_US-Cart</title>
                <link rel="stylesheet" href="cart.css">
                <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
            </head>


            <body>

                <% 
					String addr=null;
					String userEmail;
					ResultSet cartResult=mybeanCart.cart();
					
					if(session.getAttribute("id")==null){
						response.sendRedirect("UserLoginForm.jsp");
					}
					else{
						ResultSet user = mybeanCart.cartForOrder();
						if(user.next()){
							
				%>
                    <div class="container">
                        <h2>Cart Page</h2>
                        <div class="detail-container">
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Image
                                            </th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>
                                                Total Price
                                            </th>

                                        </tr>
                                    </thead>
                                    <tbody>
										<%
										int res=mybeanCart.quantityZeroDelete();
										if(res==1)
										response.sendRedirect("cart.jsp?userid="+userid);
									else{	
											
											
										
											while(cartResult.next()){
												String img=cartResult.getString("image");
												String productname=cartResult.getString(4);
												Double price=cartResult.getDouble(5);
												int quantity=cartResult.getInt(6);
												double tp=quantity*price;
												int id=cartResult.getInt(1);
												
												
										%>
                                        <tr>
                                            <th>
												<img src="./img/<%=img%>" style="height:120px;width:120px;">
                                            </th>
                                            <th><%=productname%></th>
                                            <th><%= java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(price) %></th>
                                            <th><a href="AddQuantity.jsp?cartid=<%=id%>"><button id="plus" style="height: 30px;
    padding: 10px;
    background-color: transparent;
    color: black;font-size: 18px;color:#007BFF;" >+</button></a><input type="text" id="input" style="height: 30px;
                                        max-width: 40px;
                                        border: none;
										
    background-color: transparent;
    text-align: center; margin-top: 2px;font-size:15px" value="<%=quantity%>" /><a href="DecreQuantity.jsp?cartid=<%=id%>"><button id="minus" style=" font-size: 18px;height: 30px;
    padding: 10px;
    background-color: transparent; margin-top: 2px;
    color:#007BFF;" >-</button></a>
                                            </th>
                                            <th>
											<%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(tp)%></th>
                                        </tr>
			<%
				
				}
									}
									
			%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="payment-container">
                            <div id="container-address" class="div-card">
                                <h3 class="h3">Delivery Address</h3>
                                <div id="delivery-container" class="content-div">
                                    <%  ResultSet rs3=mybe.findUser(); while(rs3.next()){
                                        String username=rs3.getString(2); String contact=rs3.getString(3); String
                                        email=rs3.getString(4); String address=rs3.getString(5); String
                                        city=rs3.getString(6); String state=rs3.getString(7); String
                                        pincode=rs3.getString(8); //out.println(username); 
										session.setAttribute("email",email);%>
										<p name="addr">
                                        <p>
                                            <%=username%>
                                        </p>
                                        <p>
                                            <%=address%>
                                        </p>
                                        <p>
                                            <%=city%>
                                        </p>
                                        <p>
                                            <%=state%> - <%=pincode%>.
                                        </p>
                                        <p>Mobile Number : <%=contact%>
                                        </p>
                                        <br><% addr=username+"<br>"+address+"<br>"+city+"<br>"+state+"-"+pincode+"<br>Mob.No.:"+contact;%>
										</p>
                                        <% } %>
                                            <a href="changeAddress.jsp?userid=<%=userid%>">Change Address</a>
                                            <br><br>
											
                                </div>

                            </div>
                            <div id="container-payment" class="div-card">
                                <h3 class="h3">Payment</h3>
                                <div class="content-div">
                                    <table>
                                        <tr>
										<%
											
											double total_price=mybeanCart.TotalPrice();
											double tax=(total_price*3)/100;
											double ship=tax*2/100;
											double total_amt=total_price+tax+ship;
										%>
                                            <th>Amount : </th>
                                            <th class="rth">
											<%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format(total_price)%>
											</th>
                                        </tr>
                                        <tr>
                                            <th>Shipping : </th>
                                            <th class="rth"><%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format((float)ship)%></th>
                                        </tr>
                                        <tr>
                                            <th>Tax : </th>
                                            <th class="rth">
											<%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format((float)tax)%></th>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <hr>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>Total Amount</th>
                                            <th class="rth"><%=java.text.NumberFormat.getCurrencyInstance(new java.util.Locale("en", "IN")).format((float)total_amt)%></th>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <hr>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="2" style="color:rgb(167, 167, 167);">Payment Mode</th>

                                        </tr>
                                        <tr>
									<form action="orderPlace.jsp" method="get">
                                            <th colspan="2">
                                                <select name="pay" id="">
                                                    <option value="" disabled selected>--select--</option>
													
                                                
                                                    <option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
                                                    <option value="Debit Card/Credit Card">Debit Card/Credit Card</option>
                                                    <option value="UPI">UPI</option>
													<input type="hidden" value="<%=userid%>" name="userid">
													<input type="hidden" value="<%=addr%>" name="addr">
													<input type="hidden" value="http://localhost:8082/shopping/viewOrder.jsp?userid=<%=userid%>" name="data">
                                                </select>
                                            </th>
										

                                        </tr>
										<tr>
											<th colspan="2">
											<%session.setAttribute("TotalAmt",total_amt);%>
												<button type="submit" id="orderBtn">Order</button>
											</th>
											</form>
										</tr>
                                    </table>
		
                                </div>
                            </div>
                        </div>
                    </div>
					<%
						}
						else{
					%>
						
						<div class="noFound" style="background-color:white;"></div>
					<%
						}
					%>

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
		
            <script src="./quantity.js"></script>

            </html>
					<%}%>