<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<link rel="stylesheet" href="css/addstudent.css">
</head>
<body>
<%
  String msg = request.getParameter("msg");
%>
  <div class="container">
        <form method="post" action="checkupdatestudent.jsp">
            <h1 style="text-align:center;">Update Student</h1>
            <% if (msg != null && !msg.isEmpty()) { %>
                <p class="message"><%= msg %></p>
            <% } %>
            <div class="form-group">
                <label for="rollnumber">Roll Number</label>
                <input type="text" id="rollnumber" name="rollnumber" placeholder="Student Roll Number" required>
            </div>
            <div class="form-actions">
                <button type="submit" name="submit" value="Student">Add</button>
                <button type="reset">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>
