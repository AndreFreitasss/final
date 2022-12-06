<%-- 
    Document   : index
    Created on : 20 de out. de 2022, 18:44:52
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <% 
          String nome = "Bruno";
          out.println(nome);
        %>
        <h1>Hello World!</h1>
       
        <form action="index.jsp" method="post">
            <input type="text" name="vlr1" />
            <input type="text" name="vlr2" />
            <input type="submit" value="Enviar" />
        </form>
        <h2>
        <% 
            if(request.getMethod().equals("POST")){
            double num1 = Double.parseDouble(request.getParameter("vlr1"));
            double num2 = Double.parseDouble(request.getParameter("vlr2"));
            double soma = num1+num2;
            out.println("A soma = " + soma);
           }
        %>
        </h2>
    </body>
</html>

