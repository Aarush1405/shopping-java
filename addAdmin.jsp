<jsp:useBean id="mybean" class="shopping.Admin" />
<jsp:setProperty name="mybean" property="*" />

<%@ page import="java.sql.*" %>
    <% String result=mybean.addAdmin(); %>

<%@ page
            import="java.sql.*, java.util.Properties, jakarta.mail.*, jakarta.mail.internet.*, jakarta.mail.Session" %>
            <% 
		if(session.getAttribute("admin_id")==null){
			response.sendRedirect("adminLoginForm.html");
		}
		else{
	
			 // Database connection setup // Sender email credentials 
				final String senderEmail="aarush140506@gmail.com" ; // Replace with your email
				final String senderPassword="grmc bact erxz ldyz" ; // Replace with your app password 
				try { String userEmail=request.getParameter("email"); 
				Properties props=new Properties();
                props.put("mail.smtp.auth", "true" ); 
				props.put("mail.smtp.starttls.enable", "true" );
                props.put("mail.smtp.host", "smtp.gmail.com" ); props.put("mail.smtp.port", "587" );
                props.put("mail.smtp.ssl.protocols", "TLSv1.2" ); // Ensure TLS 1.2 is enabled
				Session mailSession=Session.getInstance(props, new Authenticator() 
				{
					protected PasswordAuthentication getPasswordAuthentication() 
					{ return new PasswordAuthentication(senderEmail, senderPassword); } });
                mailSession.setDebug(true); // Compose email 
				Message message=new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail)); 
				message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(userEmail)); 
				message.setSubject("Welcome Aboard!"); 
                //Replace with actual order details 
				message.setText("Congratulations! You have been added as an admin to ShopWithUs. ");

            // Send email
            Transport.send(message);
            out.println(" Email sent successfully to: " + userEmail);
        } 

    
	catch(Exception e){
		e.printStackTrace();
			
			out.println(e);
	}
%>

        <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>

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
                box-shadow: 0px 0px 20px #333;
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
            }

            button {
                height: 35px;
                width: 70%;
                background-color: #075ed0;
                color: white;
                font-size: 17px;
                border: none;
                border-radius: 5px;
            }

            button:hover {
                cursor: pointer;
                background-color: #1379ff;
            }
        </style>


        <div class="container">
            <div class="i">
                <i class="fa-solid fa-circle-check"></i>
            </div>
            <div class="p">
                <!-- <jsp:include page="addProduct.jsp" /> -->
                <h3>
                    <%=result%>
                </h3>
                <a href="admin-dashboard.jsp"><button type="submit">Okay</button></a>
            </div>
        </div>
		<%}%>