<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Cadastro de Usuário</title>

<link  rel="stylesheet" href="resources/css/cadastro.css">
</head>
<body>

	<center><h1>Cadastro de Usuário</h1></center>
	<form action="salvarUsuario" method="post">
<ul class="form-style-1"> <li>
		<center><table></center>
		<tr>
				<td>Codigo:</td>
				<td><input type="text" readonly="readonly" id="id" name="id" value="${user.id}" class="field-long"></td>
			</tr>
			<tr>
				<td>Login:</td>
				<td><input type="text" id="login" name="login" value="${user.login}"></td>
			</tr>

			<tr>
				<td>Senha:</td>
				<td><input type="password" id="senha" name="senha" value="${user.senha}"></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Salvar"></td>
			</tr>
		</table>
		
</li>
</ul>
	</form>
	<div class="container">
	<table class="responsive-table">
	<caption>Usuários cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Login</th>
				<th>Senha</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
			<tr>
			<td style="width: 150px"><c:out value="${user.id}"></c:out>
				</td>
				<td style="width: 150px"><c:out value="${user.login}"></c:out>
				</td>
				<td><c:out value="${user.senha}"></c:out></td>
				<td><a href="salvarUsuario?acao=delete&user=${user.login}"><img src="resources/img/excluir.png" alt="Excluir" title="Excluir" width="20px" height="20px"></a></td>
				<td><a href="salvarUsuario?acao=editar&user=${user.login}"><img alt="Editar" title="Editar" src="resources/img/editar.png" width="20px" height="20px"></a></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>