<jsp:useBean id="mybean" class="shopping.User" />
<jsp:setProperty name="mybean" property="*" />
<%@ page language="java" session="true" %>
    <%@ page import="java.sql.*" %>
        <%@ page
            import="java.sql.*, java.util.Properties, jakarta.mail.*, jakarta.mail.internet.*, jakarta.mail.Session" %>
            <% int ide=0;
			ResultSet rs=mybean.searchUser(); 
			if(rs.next()){ 
			final String senderEmail="aarush140506@gmail.com" ; // Replace with your email 
			final String senderPassword="grmc bact erxz ldyz" ; // Replace with your app password 
			try { 
			String userEmail=request.getParameter("email"); Properties props=new Properties();
                props.put("mail.smtp.auth", "true" ); props.put("mail.smtp.starttls.enable", "true" );
                props.put("mail.smtp.host", "smtp.gmail.com" ); props.put("mail.smtp.port", "587" );
                props.put("mail.smtp.ssl.protocols", "TLSv1.2" ); // Ensure TLS 1.2 is enabled 
				Session mailSession=Session.getInstance(props, new Authenticator() { protected PasswordAuthentication
                getPasswordAuthentication() { return new PasswordAuthentication(senderEmail, senderPassword); } });
                mailSession.setDebug(true); // Compose email 
				Message message=new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail));
                message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(userEmail));
                message.setSubject("Subject: Successful Login - Welcome Back!"); //Replace with actual order details
                message.setText("Dear User, You have successfully logged into your account.Have a great day! ");
				int id=rs.getInt(1);
				ide=id;
				session.setAttribute("id",id); // Send email 
				Transport.send(message);
				out.println(" Email sent successfully  to: " + userEmail);
        } 

    
	catch(Exception e){
		e.printStackTrace();
			
			out.println(e);
	}
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
                            Successfully.....Logged In !
                        </h3>
                        <a href="index.jsp?userid=<%=ide%>"><button type="submit">Okay</button></a>
                    </div>
                </div>

                <% } else{ %>


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
                            color: red;
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
                            <i class="fa-solid fa-circle-xmark"></i>
                        </div>
                        <div class="p">
                            <!-- <jsp:include page="addProduct.jsp" /> -->
                            <h3>
                                Invaild Email and Password.....<br>
                            </h3>
                            <p>Pls Enter Valid Email & Password</p>
                            <a href="UserLoginForm.html"><button type="submit">Okay</button></a>
                        </div>
                    </div>
                    <% } %>