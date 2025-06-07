<jsp:useBean id="mybe" class="shopping.User" />
<jsp:setProperty name="mybe" property="*" />
    <%@ page import="java.sql.*" %>
       
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>SHOP_WITH_US-Cart</title>
                <link rel="stylesheet" href="user.css">
                <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
            </head>

            <body>
			<%
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("adminLoginForm.html");
		}
		else{
	%>
			   
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
    </header>
	<section class="quick-links">
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
                        <h2>User's Details</h2>
                        <div class="detail-container">
                            <div class="table-container">
							
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Image
                                            </th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Mobile Number</th>
                                            <th>
                                                Address
                                            </th>
											<th>
												Action
											</th>

                                        </tr>
                                    </thead>
                                    <tbody>
										<%	
											ResultSet rs=mybe.viewUser();
											while(rs.next()){
												int id=rs.getInt(1);
												String name=rs.getString(2);
												String contact=rs.getString(3);
												String email=rs.getString(4);
												String address=rs.getString(5);
												String city=rs.getString(6);
												String state=rs.getString(7);
												String pincode=rs.getString(8);
												String img=rs.getString(11);
											
										%>	
												
									
                                        <tr>
                                            <th>
												<img src="./img/<%=img%>" style="height:120px;width:120px;">
                                            </th>
                                            <th><%=name%></th>
                                            <th><%=email%></th>
                                            <th><%=contact%>
                                            </th>
                                            <th><%=address%>
											<br><%=city%>
											<br><%=state%>
											<br><%=pincode%>
											</th>
											<th>
												<a href="deleteUser.jsp?userid=<%=id%>"><button>Delete</button></a>
											</th>
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
            </body>
		<%}%>
         

            </html>
				