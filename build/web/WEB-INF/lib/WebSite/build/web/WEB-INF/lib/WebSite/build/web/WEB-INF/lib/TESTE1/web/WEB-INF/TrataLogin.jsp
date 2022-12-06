<%-- 
    Document   : TrataLogin
    Created on : 20 de out. de 2022, 19:05:13
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           
           if(email == "" || password == ""){
                response.sendRedirect("Login.jsp?erro=0");
           }else{
               if(email.equals("bruno@gmail.com") && password.equals("12345")){
                    response.sendRedirect("Home.jsp");
               }else{
                    response.sendRedirect("Login.jsp?erro=1");
                } 
           }
       %>
    </body>
</html>
