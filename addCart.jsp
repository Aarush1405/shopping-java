<jsp:useBean id="mybean" class="shopping.Cart" />
<jsp:setProperty name="mybean" property="*" />
<jsp:useBean id="mybean1" class="shopping.Product" />
<jsp:setProperty name="mybean1" property="*" />
<%@ page language="java" session="true" %>
    <%@ page import="java.sql.*" %>
	<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("UserLoginForm.jsp");
	}
	else{
	int userid=(Integer)session.getAttribute("id");
	String avail;
	int stockCheck=mybean1.checkStock();
	if(stockCheck>0){
	int a=mybean.addToCart();
	if(a==1){
	%>
	 <script src=" https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous">
            </script>
                <style>
                    .container {
                        height: auto;
                        width: 35%;
                        margin: auto;
                        padding: 20px;
                        border-radius: 10px;
                        overflow: hidden;
                        box-shadow: 0px 0px 20px #333;
                        margin-top: 2%;
                    }
                    .i {
                        height: auto;
                        width: 100%;
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
                        <h3>
                            Product added into your cart....Successfully!
                        </h3>
                        <a href="cart.jsp?userid=<%=userid%>"><button type="submit">Okay</button></a>
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
                            border-radius: 10px;
                            overflow: hidden;
                            box-shadow: 0px 0px 20px #333;
                            margin-top: 2%;
                        }
                        .i {
                            height: auto;
                            width: 100%;
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
                            <h3>
									Product Not added to your cart....<br>
                            </h3>
                            
                            <a href="index.jsp?userid=<%=userid%>"><button type="submit">Okay</button></a>
                        </div>
                    </div>
	<% } }  else{%>
		  <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
                    <style>
                        .container {
                            height: auto;
                            width: 35%;
                            margin: auto;
                            padding: 20px;
                            border-radius: 10px;
                            overflow: hidden;
                            box-shadow: 0px 0px 20px #333;
                            margin-top: 2%;
                        }
                        .i {
                            height: auto;
                            width: 100%;
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
                            <h3>
									Out of Stock Product can not added into cart..<br>
                            </h3>
                            <a href="index.jsp?userid=<%=userid%>"><button type="submit">Okay</button></a>
                        </div>
                    </div>
	<%} }%>