<%-- 
    Document   : clienteLogout
    Created on : 2 de dez. de 2022, 19:09:56
    Author     : Alunos
--%>

<%
    session.invalidate();//Encerra a sessão do usuario
    response.sendRedirect("index.jsp?erro=4");//Redireciona para login msg -> sua sessão foi encerrada

%>