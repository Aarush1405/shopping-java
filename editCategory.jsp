<jsp:useBean id="mybean" class="shopping.Category" />
<jsp:setProperty name="mybean" property="*" />
<%@ page import="java.sql.*" %>
    <!DOCTYPE html>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="editCategory.css">
        <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
        <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
    </head>

    <body>
	<%
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("adminLoginForm.html");
		}
		else{
	
        ResultSet rs=mybean.editCategory(); while(rs.next()){ String title=rs.getString(1);
		String img=rs.getString(2);int id=rs.getInt(3);
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
                    <a href=""><i class=" fa-solid fa-right-from-bracket"></i>&nbsp;Category</a>
                </div>
                <div class="card">
                    <a href="viewProducts.jsp"><i class="fa-solid fa-book-open-reader"></i>&nbsp;View Product
                    </a>
                </div>
                <div class="card">
                    <a href=""><i class="fa-solid fa-box-open"></i>&nbsp;Orders</a>
                </div>
                <div class="card">
                    <a href="">
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
            <div class="form-container">
                <form action="eCategory.jsp" method="get">
                    <a href="admin-dashboard.html"> <i class="fa-regular fa-circle-left"></i>
                    </a>
                    <h1>Add Category</h1>
					<input type="hidden" value="<%=id%>" name="id"><input type="hidden" value="<%=title%>" name="oldcategory">
                    <label for="title" >Title</label>
                    <input type="text" value="<%=title%>" name="title">
                    <label for="image" Image</label>
                    <input type="file" value="<%=img%>" name="image" required>
                    <button type="submit">Submit</button>
                </form>
            </div>
		<%}%>
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