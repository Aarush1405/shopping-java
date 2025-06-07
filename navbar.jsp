<jsp:useBean id="mybean2" class="shopping.User" />
<jsp:setProperty name="mybean2" property="*" />
<jsp:useBean id="my" class="shopping.Category" />
<jsp:setProperty name="my" property="*" />
<%@ page language="java" session="true" %>
    <%@ page import="java.sql.*" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Shop_With_Us-Home</title>
            <link rel="stylesheet" href="style.css">
            <link rel="shortcut icon" href="./img/logo.png" type="image/x-icon">
            <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
        </head>
		 
        <style>
           /* Base Styles */
ul li button {
    background-color: red;
    height: 35px;
    width: 100px;
    text-align: center;
    color: white;
    border: none;
    text-transform: uppercase;
    border-radius: 5px;
}

header nav .right ul li a button:hover {
    background-color: rgb(219, 0, 0);
    cursor: pointer;
}

/* For Screens Between 590px and 1005px */
@media (max-width: 1005px) and (min-width: 910px) {
    nav {
        height: auto;
        display: block;
        width: 100%;
		text-align:center
        background-color: #007bff;
    }
    nav .left, nav .center, nav .right {
        width: 100%;
        height: auto;
        padding: 10px;
        text-align: center;
    }
}
@media (max-width: 910px) and (min-width:590px){
    header{
		height:auto;
		min-height:180px;
		background-color:#007bff;
	}
	nav {
        height: auto;
        display: flex;
        flex-wrap:wrap;
        align-items: center;
        background-color: #007bff;
        padding: 10px 0;
    }
    nav .left, nav .center{
        width: 50%;
		height:70px;
        height: auto;
       
        padding: 10px;
		float:left;
    }
	 nav .right {
		  width: 65%;
		height:70px;
        height: auto;
        text-align: center;
        padding: 10px;
		margin:auto;
	 }
    nav ul {
        padding: 0;
		text-align:center;
    }
    nav ul li {
        display: block;
        text-align: center;
        padding: 10px 0;
	
    }
    nav select {
        width: 80%;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
    }
}
/* For Mobile Screens Below 590px */
@media (max-width: 590px) {
    header{
		height:auto;
		min-height:250px;
		background-color:#007bff;
	}
	nav {
        height: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #007bff;
        padding: 10px 0;
    }
    nav .left{
        width: 60%;
		height:70px;
        height: auto;
        text-align: center;
        padding: 10px;
    }
	  nav .center,nav .right{
		 width: 100%;
		height:70px;
        height: auto;
        text-align: center;
        padding: 10px;
		margin:auto;
	 }
    nav ul {
        padding: 0;
		text-align:center;
    }
    nav ul li {
        display: block;
        text-align: center;
        padding: 10px 0;
	
    }
    nav select {
        width: 80%;
        padding: 12px;
        font-size: 16px;
        border-radius: 5px;
    }
}

/* Dropdown & Button Improvements */
nav select {
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
}

select:focus {
    outline: none;
    border-color: #007bff;
}


        </style>

        <body>
           <% Integer useridObj=(Integer) session.getAttribute("id"); int userid=(useridObj !=null) ? useridObj :0; %>

                <% if (userid!=0) { %>
                    <header>
                        <nav>
                            <div class="left">
                                <ul>
                                    <li>
									<a href="index.jsp?userid=<%=userid%>">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                        &nbsp;
                                        Shop With Us
									</a>
						   </li>

                                </ul>
                            </div>
                            <div class="center">
                                <ul>
                                    <li>
                                        <a href="index.jsp?userid=<%=userid%>">
                                            <!-- <i class="fa-solid fa-house"></i> -->
                                            Home</a>
                                    </li>
                                    <li><a href="ProductsAll.jsp?userid=<%=userid%>">
                                            Products
                                        </a></li>
                                    <li>
									<form action="Products.jsp" method="get">
										<input type="hidden" name="userid" value="<%=userid%>">
                                        <select name="category" id="" onchange="this.form.submit()">
                                            <option value="" disabled selected>Category</option>
                                            <% 
											ResultSet rs2=my.showCategory();
											while(rs2.next()){ 
											String title=rs2.getString(1); 
											String image=rs2.getString(2); 
											int id=rs2.getInt(3);
											%>
									
                                                <option value="<%=title%>">
                                                   

                                                        <%=title%>
                                                   
                                                </option>

                                                <%}%>
                                        </select>
										</form>


                                    </li>
                                </ul>
                            </div>
                            <div class="right">
                                <ul>
                                    <li><a href="cart.jsp?userid=<%=userid%>"><i class="fa-solid fa-basket-shopping"></i>&nbsp;cart</a>
                                    </li>
                                    <li><a href="viewOrder.jsp?userid=<%=userid%>"><i
                                                class="fa-solid fa-bag-shopping"></i>&nbsp;order</a>
                                    </li>
                                    <li>
                                        <select>
                                            <% String result=mybean2.login(); ResultSet rs3=mybean2.findUser();
                                                while(rs3.next()){ String username=rs3.getString(2); String
                                                contact=rs3.getString(3); String email=rs3.getString(4); String
                                                address=rs3.getString(5); String city=rs3.getString(6); String
                                                state=rs3.getString(7); String pincode=rs3.getString(8);
                                                //out.println(username);
												session.setAttribute("rs3",rs3);												%>
                                                <br>
                                                <option value="<%=username%>">Welcome, <%= username %>
                                                </option>

                                                <%}%>
                                        </select>
                                        <a href="logout.jsp?userid=<%=userid%>"><button><i
                                                    class="fa-solid fa-right-from-bracket"></i>LogOut</button></a>

                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </header>
                    <%} else{ %>
                        <header>
                            <nav>
                                <div class="left">
                                    <ul>
                                        <li><a href="index.jsp">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                            &nbsp;
                                            Shop With Us
											</a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="center">
                                    <ul>
                                        <li>
                                            <a href="index.jsp">
                                                <!-- <i class="fa-solid fa-house"></i> -->
                                                Home</a>
                                        </li>
                                        <li><a href="ProductsAll.jsp?userid=<%=userid%>">
                                            Products
                                        </a></li>
                                    <li>
									<form action="Products.jsp" method="get">
										<input type="hidden" name="userid" value="<%=userid%>">
                                        <select name="category" id="" onchange="this.form.submit()">
                                            <option value="" disabled selected>Category</option>
                                            <% ResultSet rs2=my.showCategory(); 
											while(rs2.next()){ 
											String title=rs2.getString(1);
											String image=rs2.getString(2);
											int id=rs2.getInt(3);%>
									
                                                <option value="<%=title%>">
                                                   

                                                        <%=title%>
                                                   
                                                </option>

                                                <%
												}
												%>
                                        </select>
										</form>


                                        </li>
                                    </ul>
                                </div>
                                <div class="right">
                                    <ul>
                                        <li><a href="UserLoginForm.jsp"><i
                                                    class="fa-solid fa-right-to-bracket"></i>&nbsp;login</a>
                                        </li>
                                        <li><a href="registerForm.jsp"><i
                                                    class="fa-solid fa-user"></i>&nbsp;register</a>
                                        </li>
                                        <li><a href="./adminLoginForm.html"><i
                                                    class="fa-solid fa-user-tie"></i>&nbsp;admin</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </header>
                        <% } %>