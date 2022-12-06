<%-- 
    Document   : editarColaborador
    Created on : 2 de dez. de 2022, 19:44:34
    Author     : Alunos
--%>

<%@ page import="java.io.*" %>
<%@ page import= "java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>

 
<%
 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String id = request.getParameter("id");
    String nameImg = request.getParameter("imagem");
    Upload up = new Upload();
    up.setFolderUpload("arquivos");
 
 
    if(up.formProcess(getServletContext(), request)) {
 
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String area = up.getForm().get("area").toString();
        String telefone = up.getForm().get("telefone").toString();
        String email = up.getForm().get("email").toString();
 
        String url = "jdbc:postgresql://localhost:5432/final";
        String usuario = "postgres";
        String senhaBD = "admin";
 
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            st.executeUpdate("UPDATE colaborador set nome = '"+nome+"', area = '"+area+"', telefone = '"+telefone+"',email = '"+email+"', imagem= '"+imagem+"' WHERE id = '"+id+"' ");
 
            File file = new File("C:\\Users\\Alunos\\Documents\\WebSite\\build\\web\\arquivos\\"+nameImg);
            file.delete();
 
            response.sendRedirect("../colaboradores.jsp?status=2"); //Atualizado com sucesso.
        } catch (Exception e) {
            out.print(e);
        }
 
    }else{
        out.print("erro");
    }
 
%>