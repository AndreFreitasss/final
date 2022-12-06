<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import= "org.postgresql.Driver" %>
<%@ page import="java.io.File" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
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
        <jsp:include page="includes/nav.jsp"/>
        <div id="layoutSidenav">
                    <div class="container-fluid px-4">
                        <small>Formulário de cadastro de usuários</small>
                        <form action="config/cadastraUsuario.jsp" method="POST">
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
                            <input type="hidden" value="CLIENTE" name="nivel" />

                            <button type="submit" class="btn btn-primary">Cadastrar</button>
                        </form>
                    </div>
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
