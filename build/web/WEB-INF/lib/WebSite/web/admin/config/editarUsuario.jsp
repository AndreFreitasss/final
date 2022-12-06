
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
            
            String id = request.getParameter("id");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String telefone = request.getParameter("telefone");
            String nome = request.getParameter("nome");

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String url = "jdbc:postgresql://localhost:5432/final";
            String usuario = "postgres";
            String senhaBD = "admin";

            try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, usuario, senhaBD);
                st = con.createStatement();
                st.executeUpdate("update usuario set nome = '"+nome+"', email = '"+email+"', telefone = '"+telefone+"', senha = '"+senha+"' WHERE id = '"+id+"' ");
                response.sendRedirect("../usuarios.jsp?status=2");
            } catch (Exception e) {
                out.println(e);

            }

        %>
    </body>
</html>