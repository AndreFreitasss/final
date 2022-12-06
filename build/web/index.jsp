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
        <link href="admin/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Seja bem-vindo! Mas antes:</a>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="./config/clienteLogout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
</nav>
    <div class="container-fluid px-4" style=" height:700px">
        <small id="msg1">Para acessar o catálogo e fazer compras cadastra-se abaixo ou faça login:</small>
                        <form action="admin/config/cadastraClientes.jsp" method="POST">
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

                            <button type="submit" class="btn btn-primary" style="width:45%">Cadastrar</button>
                            <a class="btn btn-primary" href="admin/loginCliente.jsp" style="width:45%">Fazer login</a>
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
