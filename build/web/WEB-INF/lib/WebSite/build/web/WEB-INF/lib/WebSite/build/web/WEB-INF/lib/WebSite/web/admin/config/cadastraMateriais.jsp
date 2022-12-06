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
        String desc = up.getForm().get("desc").toString();
        Float valor = Float.parseFloat(up.getForm().get("valor").toString());
        
        String url = "jdbc:postgresql://localhost:5432/final";
        String usuario = "postgres";
        String senhaBD = "admin";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url,usuario,senhaBD);
            st = con.createStatement();
            st.execute("INSERT INTO material(nome,descricao,valor,imagem)VALUES('"+nome+"','"+desc+"', '"+valor+"', '"+imagem+"')");
            response.sendRedirect("../materiais.jsp?status=1");//Adicionado com sucesso
        }catch(Exception e){
            out.print(e);
        }
        
    }
    
    

%>