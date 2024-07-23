<%@page import="Demo.demo1"%>

<%
    String RollNumber= request.getParameter("rollnumber");
	String Name=request.getParameter("name");
    String Branch=request.getParameter("branch");
    String Year=request.getParameter("year");
	String Gender=request.getParameter("gender");
	response.setContentType("text/html");
	demo1 A=new demo1();
	int a=A.doinsert(RollNumber,Name,Branch,Year,Gender);
	if(a >0){
		    out.println("<html><body><h1>Insert successful</h1></body></html>");
            response.sendRedirect("addstudent.jsp?msg=Succefully inserted");
        }
        else 
        {
            response.sendRedirect("addstudent.jsp?msg=AuthenticationFailed");
	     }


%>
