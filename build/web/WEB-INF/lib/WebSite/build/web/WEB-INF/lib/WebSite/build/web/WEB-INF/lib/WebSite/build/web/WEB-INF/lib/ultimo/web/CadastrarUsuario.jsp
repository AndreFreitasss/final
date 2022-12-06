<%-- 
    Document   : CadastrarUsuario
    Created on : 20 de out. de 2022, 20:07:41
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>

<% 
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String telefone = request.getParameter("telefone");
    String nome = request.getParameter("nome");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
   
    String url = "jdbc:postgresql://localhost:5432/login";
    String usuario = "postgres";
    String senhaBD = "admin";
    
    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,usuario,senhaBD);
        st = con.createStatement();
        st.execute("INSERT INTO usuarios(id,email,pass,nome,telefone) VALUES(122,'"+email+"','"+senha+"','"+nome+"','"+telefone+"') ");
        response.sendRedirect("index.jsp?erro=3");
    }catch(Exception e){
        out.println(e);
    }
%>

