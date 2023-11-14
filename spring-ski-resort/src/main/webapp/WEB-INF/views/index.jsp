<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
<style type="text/css">

</style>
</head>
<jsp:include page="common/nav.jsp"></jsp:include>
 <link rel="stylesheet" href="/resources/css/index.css">
<body>

	<div class="ytLandscape">
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/h1VWRkX8vD8?si=hXoOA0167YGh5z27&autoplay=1&mute=1&controls=0&loop=1&playlist=h1VWRkX8vD8&modestbranding=1"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen> </iframe>
	</div>
<h1 id="text1">好き</h1>
<h1 id="text2">Daisuki</h1>

	<P>The time on the server is ${serverTime}.</P>
</body>
<jsp:include page="common/footer.jsp"></jsp:include>
</html>
