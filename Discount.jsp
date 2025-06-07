<jsp:useBean id="mybean" class="shopping.Product" />
<jsp:setProperty name="mybean" property="*" />
<% String result=mybean.addDiscount(); %>
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
			<a href="viewProducts.jsp"><button type="submit">Okay</button></a>
		</div>
	</div>