<jsp:useBean id="mybean" class="shopping.Product" />
<jsp:setProperty name="mybean" property="*" />
<%@ page import="java.sql.*" %>
    <%@ include file="navbar.jsp" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="viewDetailProduct.css">
            <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
            <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
        </head>
<%
	String avail;
					int stockCheck=mybean.checkStock();
					if(stockCheck!=0){
						avail="Available";%>
					<style>
						.status{
							background-color:green;
							color:white;
							padding:2px;
						}
					</style>
				<%
					}
					else{
						avail="Out of Stock";
						%>
						<style>
							.status{
							background-color:red;
							color:white;
							padding:2px;
						}
						</style>
						<%
					}
%>
        <body>

            <div class="container">
                <a href="ProductsAll.jsp?userid=<%=userid%>"><i class="fa-solid fa-xmark"></i></a>
                <div class="view-container">
                    <h2>Product Detaill</h2>
                    <% 
					
					ResultSet rs=mybean.searchProduct();
						while(rs.next()){ String title=rs.getString(1); String
                        description=rs.getString(2); String category=rs.getString(3); Double price=rs.getDouble(4); int
                        stock=rs.getInt(5); String image=rs.getString(6);int id=rs.getInt(7);Double
                        discount=rs.getDouble(8); Double dis=(discount/100)*price; Double op=price-dis;
                        //session.setAttribute("product_id",id);
						%>
                        <div class="pic-div">

                            <img src="./img/<%=image%>" alt="">
                        </div>
                        <div class="detail-div">
                            <h1 name="product_name">
                                <%=title%>
                            </h1>
                            <h4>description : </h4>
                            <p>
                                <%=description%>
                            </p><br>
                            <h4>Product Details :</h4>
                            <p style="display:inline;">Status : </p><p class="status"style="display:inline;">  <%=avail%></p>
                                <p>
                                category : <%=category%>
                                    <br>
                                    Policy : 7 Days Replacement & Return
                            </p>
                            <br><br>
                            <h3 name="price">Price : <i class="fa-solid fa-indian-rupee-sign"></i>
                                <%=java.text.NumberFormat.getNumberInstance().format(op.floatValue())%>
                            </h3>
                            &nbsp; <font color="grey" style="text-decoration:line-through;">
                                <i class="fa-solid fa-indian-rupee-sign"></i>
                                <%=java.text.NumberFormat.getNumberInstance().format(price.floatValue())%>
                            </font>&nbsp;
                            <font id="off" color="green" style="font-weight: 700;">
                                <%=discount%>%off
                            </font><br>
                            <br>
                            <br>
                            <table border="0">
                                <tr>
                                    <td><i class="fa-solid fa-money-bill-wave"></i><br>Cash On Delivery</td>
                                    <td>
                                        <i class="fa-solid fa-rotate-left"></i>
                                        <br>
                                        Return available
                                    </td>
                                    <td>
                                        <i class="fa-solid fa-truck"></i>
                                        <br>
                                        free delivery
                                    </td>
                                </tr>

                            </table>
                            <a href="addCart.jsp?userid=<%=userid%>&productname=<%=title%>&id=<%=id%>&price=<%=op.floatValue()%>"><button type="submit">Add to cart</button></a>
                        </div>
                        <%}%>
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

        </html>