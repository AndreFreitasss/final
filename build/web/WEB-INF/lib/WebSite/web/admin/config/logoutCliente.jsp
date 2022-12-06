<%-- 
    Document   : logoutCliente
    Created on : 5 de dez. de 2022, 20:18:31
    Author     : Alunos
--%>

<%
    session.invalidate();//Encerra a sessão do usuario
    response.sendRedirect("../loginCliente.jsp?erro=4");//Redireciona para login msg -> sua sessão foi encerrada

%>
