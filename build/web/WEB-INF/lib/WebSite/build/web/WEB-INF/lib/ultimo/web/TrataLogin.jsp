<%-- 
    Document   : TrataLogin
    Created on : 20 de out. de 2022, 18:52:46
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<% 
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    
    String user = "";
    String pass = "";
    
    String url = "jdbc:postgresql://localhost:5432/login";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    if(email == "" || senha == ""){
        response.sendRedirect("index.jsp?erro=1");
    }else{
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT *FROM usuarios WHERE email = '"+email+"' and pass = '"+senha+"' ");
            while(rs.next()){
                user = rs.getString(2);
                pass = rs.getString(3);
            }
            
        }catch(Exception e){
            out.println(e);
        }
        if(email.equals(user) && senha.equals(pass)){
            response.sendRedirect("Home.jsp");
        }else{
           response.sendRedirect("index.jsp?erro=2");
        }
    }

