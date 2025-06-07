<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="addDiscount.css">
    <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
</head>

<body>
    <% String id=request.getParameter("id");%>
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
        <div class="form-container">
            <form action="Discount.jsp" method="get">
                <a href="viewProducts.jsp"> <i class="fa-regular fa-circle-left"></i>
                </a>
                <h1>Add Discount</h1>
                <label for="id">Product Id</label>
                <input type="text" name="id" value="<%=id%>" readonly>
                <label for="discount">Discount</label>
                <input type="text" name="discount" id="">
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
		<%}%>
</body>

</html>