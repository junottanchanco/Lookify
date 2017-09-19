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
	<p>
		<a href="/songs/new"><button>Add New</button></a> 
		<a href="/songs/topTen"><button>Top 10 Songs</button></a>
	</p>
	<form action="/search/${artist}" method="post">
		<input type="search" name="artist" placeholder="Artist">
		<input type="submit" value="Search Artists">
	</form>
	<table class="table" border="1">
		<tr>
			<th>Title</th>
			<th>Rating</th>
			<th>Action</th>
		</tr>
	 <c:forEach items="${songs}" var="song" varStatus="loop">
		<tr>
			<td><a href="/songs/show/${song.id}"><c:out value="${song.title}"/></a></td>
			<td><c:out value="${song.rating}"/></td>
			<td><a href="/songs/delete/${song.id}">delete</a></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>