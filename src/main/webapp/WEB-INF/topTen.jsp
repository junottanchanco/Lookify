<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lookify</title>
</head>
<body>
	<a href="/dash"><button>Dashboard</button></a><br>
	<h1>TOP 10 Songs</h1>
	<c:forEach items="${songs}" var="song">
		<li>
			<c:out value="${song.rating}"/> - <a href="/songs/show/${song.id}"><c:out value="${song.title}"/></a> - <c:out value="${song.artist}"/>
		</li>
	</c:forEach>
</body>
</html>