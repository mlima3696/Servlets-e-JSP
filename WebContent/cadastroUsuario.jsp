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

	<center>
	<h1>Cadastro de Usuário
	<h3 style="color: red;">${msg}</h3>
	</h1></center>
	<form action="salvarUsuario" method="post" id="formUser">
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
				<td>Nome:</td>
				<td><input type="text" id="nome" name="nome" value="${user.nome}"></td>
			</tr>
			<tr>
				<td>Telefone:</td>
				<td><input type="text" id="telefone" name="telefone" value="${user.telefone}"></td>
			</tr>
			<tr>
			<td><input type="submit" value="Salvar"></td>
			<td><input type="submit" value="Cancelar" onclick="document.getElementById('formUser').action='salvarUsuario?acao=reset'"></td>
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
				<th>Nome</th>
				<th>Telefone</th>
				<th>Editar</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
			<tr>
			<td style="width: 150px"><c:out value="${user.id}"></c:out>
				</td>
				<td style="width: 150px"><c:out value="${user.login}"></c:out>
				</td>
				<td><c:out value="${user.nome}"></c:out></td>
				<td style="width: 150px"><c:out value="${user.telefone}"></c:out>
				</td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
				</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>