<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Song</title>
</head>
<body>
	<a href="/dash">Dashboard</a>
	
	<form:form method="POST" action="/songs/new" modelAttribute="newSong">
		<form:errors path="title"/>
		<form:input path="title" placeholder="Song Title"/><br>
		
		<form:errors path="artist"/>
		<form:input path="artist" placeholder="Artist"/><br>
		
		<form:label path="rating">Rating (1-10)<br>
		<form:input type="number" path="rating" min="1" max="10"/>
		</form:label><br>
		
		<form:hidden path="id"/>
		
		<input type="submit" value="Add">
	</form:form>
</body>
</html>