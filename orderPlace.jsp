<jsp:useBean id="mybeanOrder" class="shopping.Order" />
<jsp:setProperty name="mybeanOrder" property="*" />

<jsp:useBean id="mybean" class="shopping.User" />
<jsp:setProperty name="mybean" property="*" />
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.File" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.BarcodeFormat" %>
<%@ page import="com.google.zxing.EncodeHintType" %>
<%@ page import="com.google.zxing.MultiFormatWriter" %>
<%@ page import="com.google.zxing.common.BitMatrix" %>
<%@ page import="com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ page import="java.sql.*" %>
	 <%@ include file="navbar.jsp"%>
	      <%@ page
            import="java.sql.*, java.util.Properties, jakarta.mail.*, jakarta.mail.internet.*, jakarta.mail.Session" %>
            <% ResultSet rs=mybean.findUser();
		
			if(rs.next()){ // Database connection setup // Sender email credentials 
				final String senderEmail="aarush140506@gmail.com" ; // Replace with your email
				final String senderPassword="grmc bact erxz ldyz" ; // Replace with your app password 
				try { 
				 
				String userEmail=rs.getString("email");
				Properties props=new Properties();
                props.put("mail.smtp.auth", "true" ); 
				props.put("mail.smtp.starttls.enable", "true" );
                props.put("mail.smtp.host", "smtp.gmail.com" );
				props.put("mail.smtp.port", "587" );
                props.put("mail.smtp.ssl.protocols", "TLSv1.2" ); // Ensure TLS 1.2 is enabled
				Session mailSession=Session.getInstance(props, new Authenticator() 
				{
					protected PasswordAuthentication getPasswordAuthentication() 
					{ 
					return new PasswordAuthentication(senderEmail, senderPassword);
					} 
				});
                mailSession.setDebug(true); // Compose email 
				Message message=new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail)); 
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(userEmail)); 
				message.setSubject("Order Confirmation "); 
                //Replace with actual order details 
				message.setText("Your order has been successfully placed. Thank you for shopping with us! Have a great day! ");

            // Send email
            Transport.send(message);
            out.println(" Email sent successfully to: " + userEmail);
			
			}
				

    
	catch(Exception e){
		e.printStackTrace();
			
			out.println(e);
			}}

		
	   int user_id=(Integer)session.getAttribute("id");
		String result2=mybeanOrder.order();
		String result3=mybeanOrder.updatePaymentStatus();
		//out.println(result3);

	   %> 
	  
	   <script src=" https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous">
            </script>

                <style>
                    .container {
                        height: auto;
                        width: 35%;
                        margin: auto;
                        padding: 20px;
                        /* background-color: antiquewhite; */
                        border-radius: 10px;
                        overflow: hidden;
                        /* position: absolute;
            			top: 20px; */
                       /* box-shadow: 0px 0px 20px #333;*/
                        margin-top: 2%;
                    }

                    .i {
                        height: auto;
                        width: 100%;
                        /* background-color: aqua; */
                        font-size: 30px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .container .i i {
                        font-size: 80px;
                        color: green;
                    }

                    .p {
                        height: auto;
                        width: 100%;
                        text-align: center;
                    }a{
						text-decoration:none;
					}
					button{
						margin-top:3%;
					}
                    /* Footer */

footer {
    margin-top: 2%;
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
}

.social-media img {
    width: 24px;
    margin: 0 10px;
    margin-bottom: 10px;
    border-radius: 5px;
}

footer p {
    color: white;
}
                </style>


                <div class="container">
                    <div class="i">
                        <i class="fa-solid fa-circle-check"></i>
                    </div>
                    <div class="p">
					 
<h2>Thank You</h2><br>
 <h3>View Order:</h3>
 <%
    String data = request.getParameter("data");
    if (data != null && !data.trim().isEmpty()) {
        try {
            // Define file path for QR Code
            String filePath = application.getRealPath("/") + "img/qrcode.png"; // Save in 'img/' folder
            int width = 300, height = 300;

            Map<EncodeHintType, Object> hints = new HashMap<>();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");

            // Generate QR Code
            BitMatrix matrix = new MultiFormatWriter().encode(data, BarcodeFormat.QR_CODE, width, height, hints);
            BufferedImage image = MatrixToImageWriter.toBufferedImage(matrix);

            // Save the QR Code image
            File qrFile = new File(filePath);
            ImageIO.write(image, "png", qrFile);
        %>
        
            <img src="img/qrcode.png" alt="QR Code">
        <%
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error generating QR Code: " + e.getMessage() + "</p>");
        }
    }
%>

               
                        <!-- <jsp:include page="addProduct.jsp" /> -->
						
                        <h3>
                           <%=result2%>	
                        </h3>
						<p>With in 7 Days Your Product will be Delivered in your Address</p>
                        <a href="index.jsp?userid=<%=user_id%>" ><button type="submit" >Home</button></a>
						<a href="viewOrder.jsp?userid=<%=user_id%>"><button style="background-color:red">View Order</button></a>
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