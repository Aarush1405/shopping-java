<jsp:useBean id="mybean" class="shopping.Product" />
<jsp:setProperty name="mybean" property="*" />
<%@ page language="java" session="true" %>
<%@ page import="java.sql.*" %>



    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Product - ShopWithUs</title>
        <link rel="stylesheet" href="viewProducts.css">
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
                        <li><a href="index.jsp"><button><i
                                        class="fa-solid fa-right-from-bracket"></i>LogOut</button></a>
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

        <div class="view-container">
            <h1>View Products</h1>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Title</th>
                            <th>Stock</th>
                            <th>Category</th>
                            <th>Original Price</th>
                            <th>Discount</th>
                            <th>Price</th>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% ResultSet rs=mybean.showProducts(); while(rs.next()){ String title=rs.getString(1); String
                            description=rs.getString(2); String category=rs.getString(3); Double price=rs.getDouble(4);
                            String stock=rs.getString(5); String image=rs.getString(6); Double discount=rs.getDouble(8);
                            int id=rs.getInt(7); %>
                            <tr>
                                <% Double dis=(discount/100)*price; Double op=price-dis; %>
                                    <td>
                                        <img src="./img/<%= image %>" alt="" height="80px" width="80px">
                                    </td>
                                    <td>
                                        <h4>
                                            <%=title%>
                                        </h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <%= stock%>
                                        </h4>
                                    </td>
                                    <td>
                                        <p>
                                            <%=category%>
                                        </p>
                                    </td>
                                    <td>
                                        <p>
                                            <%=price%>
                                        </p>
                                    </td>
                                    <td>
                                        <p>
                                            <%=discount%> %
                                        </p>
                                    </td>
                                    <td>
                                        <h4>
                                            <%= op.floatValue() %>
                                        </h4>
                                    </td>
                                    <td colspan="3" id="action">
                                        <a href="editProduct.jsp?id=<%=id%>"><button id="blueBtn">Edit</button></a>
                                        <a href="deleteProduct.jsp?id=<%= id %>"><button id="redBtn">Delete</button></a>
                                        <a href="addDiscount.jsp?id=<%= id %>"">
                                            <button id="blueBtn">Discount</button>
                                        </a>


                            </tr>
                            <% } %>
                    </tbody>
                </table>
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
		<% }%>
    </body>

    </html>