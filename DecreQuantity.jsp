<jsp:useBean id="mybean" class="shopping.Cart" />
<jsp:setProperty name="mybean" property="*" />

<%@ page language="java" session="true" %>
    <%@ page import="java.sql.*" %>
	<%
		int userid=(Integer)session.getAttribute("id");
		
		int a=mybean.quantityDecre();
		
		
		if(a==1)
			response.sendRedirect("cart.jsp?userid="+userid);
		else
			out.println("failed");
	%>