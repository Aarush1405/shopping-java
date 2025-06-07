<jsp:useBean id="mybean" class="shopping.Category" />
<jsp:setProperty name="mybean" property="*" />
<%@ page import="java.sql.*" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product - ShopWithUs</title>
        <link rel="stylesheet" href="addProduct.css">
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
                        <li><a href="logoutAdmin.jsp"><button><i
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
        <div class="form-container">
            <form action="statusProduct.jsp" method="get">
                <a href="admin-dashboard.jsp"> <i class="fa-regular fa-circle-left"></i>
                </a>
                <h1>Add Product</h1>
                <label for="title">Enter Title</label>
                <input type="text" name="title">

                <label for="description">Enter Description</label>
                <textarea name="description" rows="5"></textarea>

                <label for="category">Category</label>

                <select name="category" id="select" style="min-height: 37px;
    width: 100%;
    margin-bottom: 4%;
    border-radius: 5px;
    border: 0.5px solid rgb(174, 174, 174);">
                    <% ResultSet rs=mybean.showCategory(); while(rs.next()){ String title=rs.getString(1); %>
                        <option value="<%=title%>">
                            <%=title%>
                        </option>
                        <% } %>
                </select>

                <label for="price">Enter Price</label>
                <input type="text" name="price" id="">

                <label for="stock" id="label">Stock</label>
                <label for="image" id="label">Image</label>
                <input type="number" name="stock" id="">
                <input type="file" name="image" id="in">

                <button type="submit">Submit</button>
            </form>
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
		<%
		}
		%>
    </body>

    </html>