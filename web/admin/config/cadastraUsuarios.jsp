<%-- 
    Document   : CadastrarUsuario
    Created on : 8 de nov. de 2022, 19:03:21
    Author     : Alunos
--%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>
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
    String nivel = request.getParameter("nivel");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/final";
    String usuario = "postgres";
    String senhaBD = "admin";
    if(nivel.equals("ADM")){
        try{
        Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO usuario(nome,email,telefone,senha,nivel) VALUES('" + nome + "','" + email + "','" + telefone + "','" + senha + "', '"+nivel+"')");
            response.sendRedirect("../usuarios.jsp?status=1");
                    }catch (Exception e){
                    out.println(e);

                    }
     }else{
            try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO usuario(nome,email,telefone,senha,nivel) VALUES('" + nome + "','" + email + "','" + telefone + "','" + senha + "', 'CLIENTE')");
            response.sendRedirect("../usuarios.jsp?status=1");
                    }catch (Exception e){
                    out.println(e);

                    }
      }
        %>
    </body>
</html>