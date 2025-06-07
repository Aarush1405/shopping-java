<!DOCTYPE html>
 <%@ include file="navbar.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - ShopWithUs</title>
    <link rel="stylesheet" href="UserLoginForm.css">
    <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
    <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>

</head>

<body>
    
    <div class="container">
        <div class="left-container">
            <img src="./img/delivery.png" alt="delivery" height="340px" width="340px">
        </div>
        <div class="right-container">
            <form action="checkUser.jsp" method="get">
                <h1>Login Forms</h1>

                <label for="email">Email</label>
                <input type="email" name="email" required>
                <label for="pass">Password</label>
                <input type="password" name="password" id="">
                <button type="submit">Submit</button>
            </form>
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