<%-- 
    Document   : Home
    Created on : 20 de out. de 2022, 20:47:37
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
         <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Navbar</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Dropdown
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Another action</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                  </li>
                </ul>
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" name="buscar" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" name="btn-buscar" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>
        <h1>Usuarios cadastrados</h1>
        <table class="table table-striped">
           <tr>
            <th>Id</th>
            <th>Email</th>
            <th>Senha</th>
            <th>Nome</th> 
            <th>Telefone</th>
            <th>Ações</th>
           </tr>
           <%    
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
   
            String url = "jdbc:postgresql://localhost:5432/login";
            String usuario = "postgres";
            String senhaBD = "admin";
            
            if(request.getParameter("btn-buscar")!= null){
                String buscar = "%" + request.getParameter("buscar") + "%";
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url,usuario,senhaBD);
                st = con.createStatement();
                rs = st.executeQuery("SELECT *from usuarios WHERE nome LIKE '"+buscar+"' ORDER BY nome ASC ");
                while(rs.next()){
                String id = rs.getString(1);
            %>        
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td>
                        <a href="" class="text-info" data-bs-toggle="modal" data-bs-target="#modalEditar<% out.print(id); %>"><i class="fa fa-pencil-square-o"></i></a>
                        <a href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<% out.print(id); %>"><i class="fa fa-trash"></i></a>

                    </td>
                </tr>
                <!-- Modal Editar -->
        <div class="modal fade" id="modalEditar<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              

                <form action="EditarUsuario.jsp?id=<% out.print(id); %>" method="POST">  
              <div class="modal-body">
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Nome</label>
                        <input type="text" name="nome" value="<%=rs.getString(4)  %>" class="form-control" id="exampleFormControlInput1" placeholder="Nome">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="email" name="email" value="<%=rs.getString(2)%>" class="form-control" id="exampleFormControlInput1" placeholder="Email">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Telefone</label>
                        <input type="text" name="telefone" value="<%=rs.getString(5)%>" class="form-control" id="exampleFormControlInput1" placeholder="Telefone (00)0000-0000">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Senha</label>
                        <input type="password" name="senha" value="<%=rs.getString(3)%>" class="form-control" id="exampleFormControlInput1" placeholder="Senha">
                      </div>            
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary">Cadastrar</button>
              </div>
              </form>
                
    </div>
  </div>
</div>
<!-- Final do Modal Editar -->
<!-- Modal Ecluir -->
<div class="modal fade" id="exampleModal<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir Usuário</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Tem certeza que deseja Exluir <%=rs.getString(4)%>?? Hein?!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <a href="Home.jsp?funcao=excluir&id=<%=rs.getString(1)%>" class="btn btn-danger">Excluir</a>
      </div>
    </div>
  </div>
</div> <!-- Final do Modal Ecluir -->
            <%    }
            }else{
                try{
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection(url,usuario,senhaBD);
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT *from usuarios");
                    while(rs.next()){
                    String id = rs.getString(1);
            %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                    <td>
                          <a href="" class="text-info" data-bs-toggle="modal" data-bs-target="#modalEditar<% out.print(id); %>"><i class="fa fa-pencil-square-o"></i></a>
                         <a href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<% out.print(id); %>"><i class="fa fa-trash"></i></a>
                    </td>
                    </tr>
                 <!-- Modal Editar -->
        <div class="modal fade" id="modalEditar<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              

                <form action="EditarUsuario.jsp?id=<% out.print(id); %>" method="POST">  
              <div class="modal-body">
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Nome</label>
                        <input type="text" name="nome" value="<%=rs.getString(4)  %>" class="form-control" id="exampleFormControlInput1" placeholder="Nome">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="email" name="email" value="<%=rs.getString(2)%>" class="form-control" id="exampleFormControlInput1" placeholder="Email">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Telefone</label>
                        <input type="text" name="telefone" value="<%=rs.getString(5)%>" class="form-control" id="exampleFormControlInput1" placeholder="Telefone (00)0000-0000">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Senha</label>
                        <input type="password" name="senha" value="<%=rs.getString(3)%>" class="form-control" id="exampleFormControlInput1" placeholder="Senha">
                      </div>            
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary">Cadastrar</button>
              </div>
              </form>
                
    </div>
  </div>
</div>
<!-- Final do Modal Editar -->
<!-- Modal Ecluir -->
<div class="modal fade" id="exampleModal<% if(id==id)out.print(id); %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir Usuário</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Tem certeza que deseja Exluir <%=rs.getString(4)%>?? Hein?!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <a href="Home.jsp?funcao=excluir&id=<%=rs.getString(1)%>" class="btn btn-danger">Excluir</a>
      </div>
    </div>
  </div>
</div> <!-- Final do Modal Ecluir -->
                  <% }
                }catch(Exception e){
                    out.println(e);
                }
            }
           %>
        </table>
        <%
              if(request.getParameter("funcao")!= null && request.getParameter("funcao").equals("excluir")){
                String id=request.getParameter("id");
                try{
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection(url,usuario,senhaBD);
                    st = con.createStatement();
                    st.executeUpdate("DELETE from usuarios WHERE id= '"+id+"' ");
                    response.sendRedirect("Home.jsp?msg=1");
                 }catch(Exception e){
                out.println(e);
                 }
            }
        %>
    </body>
</html>

