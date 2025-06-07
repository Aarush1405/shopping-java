 <%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - ShopWithUs</title>
  <link rel="stylesheet" href="registerForm.css">
  <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
  <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>

</head>

<body>
  
  <div class="container">
    <div class="left-container">
      <img src="./img/delivery.png" alt="delivery" height="340px" width="340px">
    </div>
    <div class="right-container">
      <form action="newUser.jsp" method="get">
        <h1>Register</h1>
        <table>
          <tr>
            <td><label for="username">&nbsp;&nbsp;Full Name</label></td>
            <td><label for="contact">&nbsp;&nbsp;Mobile Number</label></td>
          </tr>
          <tr>
            <td><input type="text" name="username" required></td>
            <td><input type="text" name="contact" required></td>
          </tr>
          <tr>
            <td colspan="2"><label for="email">&nbsp;&nbsp;Email</label></td>

          </tr>
          <tr>
            <td colspan="2"><input type="text" id="full" name="email" required></td>

          </tr>
          <tr>
            <td><label for="address">&nbsp;&nbsp;Address</label></td>
            <td><label for="city">&nbsp;&nbsp;City</label></td>
          </tr>
          <tr>
            <td><input type="text" name="address" required></td>
            <td><input type="text" name="city" required></td>
          </tr>
          <tr>
            <td><label for="state">&nbsp;&nbsp;State</label></td>
            <td><label for="pincode">&nbsp;&nbsp;Pin Code</label></td>
          </tr>
          <tr>
            <td><input type="text" name="state" required></td>
            <td><input type="text" name="pincode" required></td>
          </tr>
          <tr>
            <td><label for="password">&nbsp;&nbsp;Password</label></td>
            <td><label for="cpass">&nbsp;&nbsp;Confirm Password</label></td>
          </tr>
          <tr>
            <td><input type="password" name="password" required></td>
            <td><input type="password" name="cpass" required></td>
          </tr>
          <tr>
            <td colspan="2"><label for="image">&nbsp;&nbsp;Profile Image</label></td>

          </tr>
          <tr>
            <td colspan="2"><input type="file" name="image" id="full"></td>
          </tr>
        </table>
        <button type="submit" class="btn">Register</button>

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