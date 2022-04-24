<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<table border="1">
  <thead>
  <th>No</th>
  <th>Name</th>
  <th>Birthday</th>
  <th>Address</th>
  <th>Avatar</th>
  </thead>

  <c:forEach var="c" items="${customers}" varStatus="no">
    <tr>
      <td class="no">${no.count}</td>
      <td>${c.name}</td>
      <td>${c.birthday}</td>
      <td>${c.address}</td>
      <td>
        <img src="${c.imgPath}">
      </td>
    </tr>
  </c:forEach>
</table>
  </body>
</html>
