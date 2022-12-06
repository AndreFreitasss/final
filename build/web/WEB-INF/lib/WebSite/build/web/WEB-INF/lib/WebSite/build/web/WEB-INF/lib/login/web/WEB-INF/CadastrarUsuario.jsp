<%-- 
    Document   : CadastrarUsuario
    Created on : 20 de out. de 2022, 20:07:41
    Author     : Alunos
--%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    String senhaBD = "adminadmin";
    
try{
Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO usuarios(id,email,pass,nome,telefone) VALUES(2,'"+email+"','"+senha+"','"+nome+"','"+telefone+"')");
            }catch (Exception e){
            out.println(e);
            
            }

    %>
    </body>
</html>

