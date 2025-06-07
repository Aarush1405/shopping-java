<jsp:useBean id="mybean" class="shopping.Category" />
<jsp:setProperty name="mybean" property="*" />
<jsp:useBean id="mybean1" class="shopping.Product" />
<jsp:setProperty name="mybean1" property="*" />
<%@ page import="java.sql.*" %>
    <%@ include file="navbar.jsp" %>
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

        <body>

            <div class="slider">
                <div class="img">
                </div>
            </div>
            <section id="category-container">
                <h2>Category</h2>
                <div class="cards-container">
                    <% ResultSet rs=mybean.showCategory(); while(rs.next()){ String title=rs.getString(1); String
                        image=rs.getString(2); int id=rs.getInt(3);%>
                        <a href="Products.jsp?category=<%=title%>&userid=<%=userid%>" style="text-decoration: none; color: #333;">
                            <div class="cards">
                                <img src="./img/<%=image%>" alt="">
                                <p>
                                    <%=title %>
                                </p>
                            </div>
                        </a>
                        <%}%>
                </div>
            </section>
            <section id="products-container">
                <h2>Products</h2>
                <div class="box-container">
                    <% ResultSet rs1=mybean1.displayProduct(); while(rs1.next()){ String title=rs1.getString(1); String
                        image=rs1.getString(6); double price=rs1.getDouble(4);int id1=rs1.getInt(7); double
                        dis=rs1.getDouble(8); double op=price-((dis/100)*price); %>
                        <div class="box">
                            <img src="./img/<%=image%>" alt="">
                            <p>
                                <%=title%>
                            </p>
                            <p>
                                <i class="fa-solid fa-indian-rupee-sign"></i>
                                <%= java.text.NumberFormat.getNumberInstance().format((float)op) %>
&nbsp;
                                    <font color="grey" style="text-decoration:line-through;">
                                        <i class="fa-solid fa-indian-rupee-sign"></i>
                                       <%= java.text.NumberFormat.getNumberInstance().format(price) %>
                                    </font>&nbsp;
                                    <font id="off" color="green">
                                        <%=dis%>%off
                                    </font>
                            </p>
                            <a href="viewDetailProduct.jsp?id=<%=id1%>&userid=<%=userid%>"><button type="submit">View Details</button></a>
                        </div>
                        <%}%>
                </div>
            </section>
            <footer>
                <div class="footer-content">
                    <div class="social-media">
                        <a href="#"><img src="./img/facebook.png" alt="Facebook"></a>
                        <a href="#"><img src="./img/twitter.png" alt="Twitter"></a>
                        <a href="#"><img src="../shopping/img/insta.png" alt="Instagram"></a>
                    </div>
                    <p>&copy; 2025 SHOP_WITH_US. All Rights Reserved.</p>
                </div>
            </footer>
        </body>

        </html>