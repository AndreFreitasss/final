<%-- 
    Document   : index
    Created on : 20 de out. de 2022, 18:51:26
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </head>
    <body>
        <form action="TrataLogin.jsp" method="POST" style="width:50%;margin:0 auto;padding:0 auto;background-color:#48D1CC;padding:20px;border-radius:10px;box-shadow:1px 1px 5px #ccc;">
            <h1>Login</h1>
            <%
                    if(request.getParameter("erro")==null){
                    }else{
                        if(request.getMethod().equals("GET")){
                    //String err = request.getParameter("erro");
                    int err = Integer.parseInt(request.getParameter("erro"));
                    if(err == 1){ 
                %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Erro</strong> Preencha todos os campos!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>
                <%    
                    }
                    if(err == 2){
                %>
                      <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Erro!</strong> Usuário ou senha inválidos!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>  
                <%
                    }
                if(err == 3){ 
                %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong></strong> Cadastro realizado com sucesso. Por favor faça o login!
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                      </div>
                <%    
                    }
                if(err == 4){ 
                %>
                   <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> You have been signed in successfully!
                  </div>
                <%    
                    }
                }
                
                    }
                 %>
                 
                 
                 <div class="alert alert-success" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Success!</strong> You have been signed in successfully!
                  </div>
             
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email address</label>
              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
              <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Password</label>
              <input type="password" name="senha" class="form-control" id="exampleInputPassword1">
            </div>
            <div class="mb-3 form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Check me out</label>
              <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal" >Cadastre-se</a>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
         </form>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastro de usuário</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <form action="CadastrarUsuario.jsp" method="POST">  
              <div class="modal-body">
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="text" name="nome" class="form-control" id="exampleFormControlInput1" placeholder="Nome">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="email" name="email" class="form-control" id="exampleFormControlInput1" placeholder="Email">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="text" name="telefone" class="form-control" id="exampleFormControlInput1" placeholder="Telefone (00)0000-0000">
                      </div>
                      <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email address</label>
                        <input type="password" name="senha" class="form-control" id="exampleFormControlInput1" placeholder="Senha">
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
        <script src="https://releases.jquery.com/git/jquery-git.min.js" ></script>
        <script>
            window.setTimeout(function() {
                $(".alert").fadeTo(500, 0).slideUp(500, function(){
                    $(this).remove(); 
                });
            }, 2000);
            
        </script>
    </body>
</html>