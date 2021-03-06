<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Cadastro de Telefones</title>

<link  rel="stylesheet" href="resources/css/cadastro.css">


</head>
<body>
<a href="acessoliberado.jsp" >Inic�o</a>
<a href="index.jsp" >Sair</a>
	<center>
	<h1>Cadastro de Telefone</h1>
	<h3 style="color: red;">${msg}</h3>
	<h3 style="color: blue;">${msg1}</h3>
	</center>
	<form action="salvarTelefones" method="post" id="formUser" onsubmit="return validarCampos() ? true : false;">
<ul class="form-style-1"> <li>
		<center><table></center>
						<tr>
							<td>User:</td>
							<td><input type="text"  id="id" name="id" readonly="true"
								value="${userEscolhido.id}"></td>
								
							<td><input type="text"  id="none" readonly="true"
								name="nome"  value="${userEscolhido.nome}"></td>
						</tr>
						<tr>
						<td>N�mero:</td>
						<td><input type="text" id="numero" name="numero">
						<select id="tipo" name="tipo">
						<option>Casa</option>
						<option>Contato</option>
						<option>Celular</option>
						</select>
						</td>
						</tr>
						<tr>
						<td />
							<td><input type="submit" value="Salvar">
						</tr>
					</table>
</li>
</ul>
	</form>
	<div class="container">
	<table class="responsive-table">
	<caption>Usu�rios cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>N�mero</th>
				<th>Tipo</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
			<tr>
			<td style="width: 150px"><c:out value="${fone.id}"></c:out>
				</td>
				<td style="width: 150px"><c:out value="${fone.numero}"></c:out>
				</td>
				<td><c:out value="${fone.tipo}"></c:out></td>
				</td>
					
					
					<td><a href="salvarTelefones?acao=deleteFone&foneId=${fone.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
				</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">
function validarCampos() {
	if(document.getElementById("numero").value ==''){
	alert('Informe o N�mero:');
	return false;}
	else if(document.getElementById("tipo").value ==''){
	alert('Informe o Tipo:');
	return false;}
	
	return true;
}

</script>
</body>
</html>