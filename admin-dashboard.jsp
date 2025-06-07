<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop With Us - Admin Dashboard</title>
    <link rel="stylesheet" href="admin-dashboard.css">
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
                    <li><a href="logoutAdmin.jsp"><button><i class="fa-solid fa-right-from-bracket"></i>LogOut</button></a>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <div class="container">
        <h1>admin dashboard
        </h1>
        <div class="cards-container">
            <a href="addProduct.jsp">
                <div class="cards">
                    <ul>
                        <li>
                            <i class="fa-solid fa-square-plus"></i>
                        </li>
                        <li>
                            <h2>Add Product</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>
            <a href="category.jsp">
                <div class="cards">
                    <ul>
                        <li><i class="fa-solid fa-right-from-bracket"></i></li>
                        <li>
                            <h2>Category</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>
            <a href="viewProducts.jsp">
                <div class="cards">
                    <ul>
                        <li><i class="fa-solid fa-book-open-reader"></i></li>
                        <li>
                            <h2>View Product</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>
            <a href="customerOrder.jsp">
                <div class="cards">
                    <ul>
                        <li><i class="fa-solid fa-box-open"></i></li>
                        <li>
                            <h2>Orders</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>
            <a href="user.jsp">
                <div class="cards">
                    <ul>
                        <li><i class="fa-solid fa-circle-user"></i></li>
                        <li>
                            <h2>User</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>

            <a href="addAdmin.html">
                <div class="cards">
                    <ul>
                        <li><i class="fa-solid fa-user-tie"></i></li>
                        <li>
                            <h2>Add Admin</h2>
                        </li>
                        <li>
                            <p>...........</p>
                        </li>
                    </ul>
                </div>
            </a>

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