<%@ page import="Demo.demo1"%>
<%@page import="Demo.Data"%>
<%@page import="java.util.ArrayList"%>
<% 
   String RollNumber = request.getParameter("rollnumber");
   String msg = request.getParameter("msg");
   if (msg == null) msg = "";
   demo1 dao = new demo1();
   ArrayList<Data> dataList = dao.update(RollNumber);
%>
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
  <div class="container">
         <%
        for (Data data : dataList) {
       %>
        <form method="POST" action="registration.jsp">
            <h1 style="text-align:center;">ADD Student</h1>
            <% if (msg != null && !msg.isEmpty()) { %>
            <p class="message"><%= msg %></p>
            <% } %>
            <div class="form-group">
                <label for="rollnumber">Roll Number</label>
                <input type="text" id="rollnumber" name="rollnumber" placeholder="Student Roll Number" value="<%= data.getRollNumber() %>" required>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Student Name" value="<%= data.getName() %>" required>
            </div>
            <div class="form-group">
                <label for="branch">Branch</label>
                <select id="branch" name="branch" required>
                    <option value="<%= data.getBranch() %>"><%= data.getBranch() %></option>
                    <option value="CSE">CSE</option>
                    <option value="IT">IT</option>
                    <option value="ECE">ECE</option>
                    <option value="EEE">EEE</option>
                    <option value="AIML">AIML</option>
                    <option value="AI&DS">AI&DS</option>
                    <option value="Civil">Civil</option>
                    <option value="Mech">Mech</option>
                    <option value="IoT">IoT</option>
                </select>
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <select id="year" name="year" required>
                    <option value="<%= data.getYear() %>"><%= data.getYear() %></option>
                    <option value="1st Year">1st Year</option>
                    <option value="2nd Year">2nd Year</option>
                    <option value="3rd Year">3rd Year</option>
                    <option value="4th Year">4th Year</option>
                </select>
            </div>
            <div class="form-group gender">
                <p>Gender:</p>
                <label>
                    <input type="radio" id="male" name="gender" value="Male" <%= data.getGender().equals("Male") ? "checked" : "" %> required>
                    Male
                </label>
                <label>
                    <input type="radio" id="female" name="gender" value="Female" <%= data.getGender().equals("Female") ? "checked" : "" %> required>
                    Female
                </label>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Student Password" value="<%= data.getPassword() %>" required>
            </div>
            <div class="form-actions">
                <button type="submit" name="submit" value="Student">Add</button>
                <button type="reset">Clear</button>
            </div>
        </form>
         <%
        }
       %>
    </div>
</body>
</html>
