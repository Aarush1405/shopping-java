<jsp:useBean id="mybean" class="shopping.Category" />
<jsp:setProperty name="mybean" property="*" />
<% String result=mybean.dlt(); %>
	<jsp:include page="category.jsp" />
	<% out.println(result); %>