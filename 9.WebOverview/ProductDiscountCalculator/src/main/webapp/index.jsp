<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/20/2022
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
  <form action="/display-discount" method="post">
    <label>Product Description: </label><br/>
    <input type="text" name="description" placeholder="RATE" value="22000"/><br/>
    <label>List Price: </label><br/>
    <input type="text" name="price" placeholder="USD" value="0"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="text" name="discountPercent" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
