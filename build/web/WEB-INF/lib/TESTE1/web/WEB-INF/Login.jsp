<%-- 
    Document   : Login
    Created on : 20 de out. de 2022, 19:05:34
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="row-fluid">
                <h1>Login</h1>
                <%
                    if(request.getMethod().equals("GET")){
                    //String err = request.getParameter("erro");
                    int err = Integer.parseInt(request.getParameter("erro"));
                    if(err == 0){ 
                %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Erro</strong> Preencha todos os campos!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>
                <%    
                    }
                    if(err == 1){
                %>
                      <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Erro!</strong> Usuário ou senha inválidos!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>  
                <%
                    }
                }
                %>
                <form action="TrataLogin.jsp" method="POST">
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">Email address</label>
                      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                      <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3 form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                  </form>
            </div>
        </div>
    </body>
</html>
