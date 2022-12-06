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
        <link rel="stylesheet" href="./CSS/estilos.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    </head>
    <body>
        
        <form action="TrataLogin.jsp" method="POST">
            <h1>Login</h1>
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email</label>
              <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
             
            </div>
            <div class="mb-3">
              <label for="exampleInputPassword1" class="form-label">Senha</label>
              <input type="password" name="senha" class="form-control" id="exampleInputPassword1">
            </div>
            <button type="submit" class="btn btn-dark">Login</button>
            <!-- Button trigger modal -->
<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
 Cadastre-se
</button>
            
         </form>
      
        <form action="CadastrarUsuario.jsp" method="POST">
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Cadastre-se</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <label class="texto-nome">Nome</label>
          <input type="text" name="nome" class="form-control" placeholder="Nome"> <br>
              
          <label class="texto-email">Email</label>
          <input type="email" name="email" class="form-control" placeholder="Email"> <br> 
    
          <label class="texto-telefone">Telefone</label>
          <input type="text" name="telefone" class="form-control" placeholder="Telefone"> <br> 
            
          <label class="texto-senha">Senha</label>
          <input type="password" name="senha" class="form-control" placeholder="Senha">
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-white" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-dark">Enviar</button>
      </div>
    </div>
  </div>
</div>
</form>
        
    </body>
</html>
