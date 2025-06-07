<jsp:useBean id="mybean" class="shopping.Category" />
<jsp:setProperty name="mybean" property="*" />
<jsp:useBean id="mybean1" class="shopping.Product" />
<jsp:setProperty name="mybean1" property="*" />
<%@ page language="java" session="true" %>
<%@ page import="java.sql.*" %>
    <%@ include file="navbar.jsp" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Shop With Us - Products</title>
            <link rel="stylesheet" href="Products.css">
            <script src="https://kit.fontawesome.com/71a06f9aff.js" crossorigin="anonymous"></script>
        </head>

        <body>
            <div class="searchbar">
			<form action="searchProduct.jsp" method="get">
				<input type="hidden" value="<%=userid%>" name="userid" >
                <input type="search" placeholder=" Search " name="title">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> &nbsp;Search</button>
            </form>
			</div>
            </header>
            <div class="container">
                <div class="category-container">
                    <div class="category-list">
                        <table>
                            <h3>Category</h3>
                            <tbody>
                                <tr>
                                   
                                        <td> <a href="ProductsAll.jsp">All</a></td>
                                    
                                </tr>
                                <% ResultSet rs=mybean.showCategory(); while(rs.next()){ String title=rs.getString(1);
                                    %>
                                    <tr>
									
                                        <td><a href="Products.jsp?userid=<%=userid%>&category=<%=title%>">
                                                <%=title%>
                                            </a></td>
                                    </tr>
                                    <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="product-container">
                    <h2>Products</h2>
					 <div class="box-container">
                   
                        <% 
							ResultSet rs1=mybean1.searchBarProduct();
							boolean hasData = rs1.next();
							//out.println(rs1.next());
							if(hasData){
								
						 String title=rs1.getString(1); String image=rs1.getString(6); double price=rs1.getDouble(4); int
                            id1=rs1.getInt(7); double dis=rs1.getDouble(8); double op=price-((dis/100)*price); %>
                            <div class="box">
                                <img src="./img/<%=image%>" alt="">
                                <p>
                                    <%=title%>
                                </p>
                                <p>
                                    <i class="fa-solid fa-indian-rupee-sign"></i>
                                    <%=java.text.NumberFormat.getNumberInstance().format((float)op)%>&nbsp;
                                        <font color="grey" style="text-decoration:line-through;">
                                            <i class="fa-solid fa-indian-rupee-sign"></i>
                                            <%=java.text.NumberFormat.getNumberInstance().format(price)%>
                                        </font>&nbsp;
                                        <font id="off" color="green">
                                            <%=dis%>%off
                                        </font>
                                </p>
                                <a href="viewDetailProduct.jsp?id=<%=id1%>&userid=<%=userid%>"><button type=" submit">View
                                        Details</button></a>
                            </div>
						
							<%	
						 while(rs1.next()){ 
						title=rs1.getString(1); image=rs1.getString(6); price=rs1.getDouble(4); 
                            id1=rs1.getInt(7);  dis=rs1.getDouble(8);  op=price-((dis/100)*price); %>
                            <div class="box">
                                <img src="./img/<%=image%>" alt="">
                                <p>
                                    <%=title%>
                                </p>
                                <p>
                                    <i class="fa-solid fa-indian-rupee-sign"></i>
                                    <%=java.text.NumberFormat.getNumberInstance().format((float)op)%>&nbsp;
                                        <font color="grey" style="text-decoration:line-through;">
                                            <i class="fa-solid fa-indian-rupee-sign"></i>
                                            <%=java.text.NumberFormat.getNumberInstance().format(price)%>
                                        </font>&nbsp;
                                        <font id="off" color="green">
                                            <%=dis%>%off
                                        </font>
                                </p>
                                <a href="viewDetailProduct.jsp?id=<%=id1%>&userid=<%=userid%>"><button type=" submit">View
                                        Details</button></a>
                            </div>
                            <%
							}
							}else{%>
							<div class="notFound"></div>
								
							<%	
							}
							%>
							
							
                    </div>
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