<%-- 
    Document   : cadastraColaboradores
    Created on : 2 de dez. de 2022, 19:44:04
    Author     : Alunos
--%>

<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import= "util.Upload" %>

<%  
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    
    Upload up = new Upload();
    
    up.setFolderUpload("arquivos");
    
    if(up.formProcess(getServletContext(),request)){
        
        String imagem = up.getFiles().get(0);
        String nome = up.getForm().get("nome").toString();
        String area = up.getForm().get("area").toString();
        String telefone = up.getForm().get("telefone").toString();
        String email = up.getForm().get("email").toString();
        
        String url = "jdbc:postgresql://localhost:5432/final";
        String usuario = "postgres";
        String senhaBD = "admin";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO colaborador(nome,area,telefone,email,imagem)VALUES('"+nome+"','"+area+"', '"+telefone+"', '"+email+"', '"+imagem+"')");
            response.sendRedirect("../colaboradores.jsp?status=1");//Adicionado com sucesso
        }catch(Exception e){
            out.print(e);
        }
        
    }
    
    

%>