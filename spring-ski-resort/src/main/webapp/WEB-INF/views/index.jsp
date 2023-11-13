<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<style type="text/css">
	
		#body {
		width : 100%;
	height: 1500px;
}
	</style>
</head>
<jsp:include page="common/nav.jsp"></jsp:include>
<body>
<h1>
	Hello world! 
</h1>
	<div id="body">a</div> 

<P>  The time on the server is ${serverTime}. </P>
</body>
<jsp:include page="common/footer.jsp"></jsp:include>
</html>
