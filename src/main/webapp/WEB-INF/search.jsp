<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
	<a href="/dash"><button>Dashboard</button></a>
	<form action="/search" method="post">
		<input type="search" name="artist" placeholder="Artist">
		<input type="submit" value="Search Artists">
	</form>
	<h1>Songs by <c:out value="${artist}"/></h1>
	<table border="1">
		<tr>
			<th>Title</th>
			<th>Rating</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${songs}" var="song">
		<tr>
			<td><a href="/songs/show/${id}"><c:out value="${song.title}"/></a></td>
			<td><c:out value="${song.rating}"/></td>
			<td><a href="/songs/delete/${id}">delete</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>