<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import="java.io.File" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="sb-nav-fixed">
        <%

            String nomeUsuario = (String) session.getAttribute("NomeUsuario");
            if (nomeUsuario == null) {
                response.sendRedirect("../index.jsp?erro=3");
            }
        %>
        <jsp:include page="includes/nav.jsp"/>
        <div id="layoutSidenav">
            <jsp:include page="includes/sidenav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Usuarios</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Cadastre-se</li>
                        </ol>
                    </div>
                    <div class="container-fluid px-4">
                        <small>Formulário de cadastro de usuários</small>
                        <form action="config/cadastraUsuarios.jsp" method="POST">
                            <div class="mb-3">
                                <label class="form-label" >Nome</label>
                                <input type="text" name="nome" class="form-control" placeholder="Informe seu nome" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label" >Email</label>
                                <input type="email" name="email" class="form-control" placeholder="Informe seu email" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label" >Telefone</label>
                                <input type="text" name="telefone" class="form-control" placeholder="Informe seu telefone" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label" >Senha</label>
                                <input type="password" name="senha" class="form-control" placeholder="Informe sua senha" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" >Nível</label>
                                <select name="nivel" class="form-select">
                                    <option value="">Escolha um nível de acesso</option>
                                    <option value="ADM">Administrador</option>
                                    <option value="CLIENTE">Cliente</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </form>
                    </div>

                    <div class="container-fluid px-4">
                        <hr>
                        <h3>Clientes cadastrados</h3>
                        <hr>
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th>Telefone</th>
                                    <th>Senha</th>
                                    <th>Nível</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th>Telefone</th>
                                    <th>Senha</th>
                                    <th>Nível</th>
                                    <th>Ações</th>
                                </tr>
                            </tfoot>


                            <tbody>
                                <%
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
                                        rs = st.executeQuery("SELECT * FROM usuario ORDER BY nome ASC");
                                        while (rs.next()) {
                                            String id= rs.getString("id");
                                %>
                                <tr>
                                    <td><%= rs.getString("nome")%></td>
                                    <td><%= rs.getString("email")%></td>
                                    <td><%= rs.getString("telefone")%></td>
                                    <td><%= rs.getString("senha")%></td>
                                    <td><%= rs.getString("nivel")%></td>
                                    <td>
                                        <a href="editarUsuario.jsp?id=<% out.print(id);%>" class="text-info"><i class="fa fa-pencil-square-o"></i></a> 
                                        <a href="" class="text-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<% out.print(id); %>"><i class="fa fa-trash"></i></a>

                                    </td>
                                </tr>
                                <!-- Modal Ecluir -->
                                 <div class="modal fade" id="exampleModal<% if (id == id)
                                    out.print(id);%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Excluir Cliente</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Tem certeza que deseja Exluir <%=rs.getString(2)%>?? Hein?!
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <a href="usuarios.jsp?funcao=excluir&id=<%=rs.getString(1)%>" class="btn btn-danger">Excluir</a>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- Final do Modal Ecluir -->
                                   <% }
                                    } catch (Exception e){
                                        out.print(e);
                                    } %>

                                                        
                            </tbody>

                        </table>
                    </div>
            <%
            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir")) {
                    String id = request.getParameter("id");
                    try {
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection(url, usuario, senhaBD);
                        st = con.createStatement();
                         st.executeUpdate("DELETE from usuario WHERE id= '" + id + "' ");
                        response.sendRedirect("usuarios.jsp?status=3");
                    } catch (Exception e) {
                         out.println(e);
                    }
                 }
         %>
                </main>
                <jsp:include page="includes/footer.jsp"/>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
