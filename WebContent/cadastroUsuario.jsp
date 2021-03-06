<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Cadastro de Usu�rio</title>

<link rel="stylesheet" href="resources/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>
	<a href="acessoliberado.jsp">Inic�o</a>
	<a href="index.jsp">Sair</a>
	<center>
		<h1>
			Cadastro de Usu�rio
			<h3 style="color: red;">${msg}</h3>
			<h3 style="color: blue;">${msg1}</h3>
		</h1>
	</center>
	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;" enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<center>
					<table>
						</center>
						<tr>
							<td>C�digo</td>
							<td><input type="text" readonly="readonly" id="id" name="id"
								value="${user.id}"></td>

							<td>CEP:</td>
							<td><input type="text" id="cep" name="cep"
								onblur="consultaCep();" value="${user.cep}"
								placeholder="Informe um cep valido"></td>
						</tr>
						<tr>
							<td>Login:</td>
							<td><input type="text" id="login" name="login"
								value="${user.login}"></td>

							<td>Rua:</td>
							<td><input type="text" id="rua" name="rua"
								value="${user.rua }" placeholder="Informe a rua do usu�rio"></td>
						</tr>

						<tr>
							<td>Senha:</td>
							<td><input type="password" id="senha" name="senha"
								value="${user.senha}"></td>

							<td>Bairro:</td>
							<td><input type="text" id="bairro" name="bairro"
								value="${user.bairro}" placeholder="Informe o bairro do usu�rio"></td>
						</tr>
						<tr>
							<td>Nome:</td>
							<td><input type="text" id="nome" name="nome"
								value="${user.nome}" placeholder="Informe o nome do usu�rio"></td>

							<td>Cidade:</td>
							<td><input type="text" id="cidade" name="cidade"
								value="${user.cidade}" placeholder="Informe a cidade do usu�rio"></td>
						</tr>
						<tr>
							<td>Telefone:</td>
							<td><input type="text" id="telefone" name="telefone"
								value="${user.telefone}"
								placeholder="Informe o telefone do usu�rio"></td>

							<td>Estado:</td>
							<td><input type="text" id="estado" name="estado"
								value="${user.estado}" placeholder="Informe o estado do usu�rio"></td>
						</tr>
						<tr>
							<td>IBGE:</td>
							<td><input type="text" id="ibge" name="ibge"
								value="${user.ibge}" placeholder="Informe o c�digo do IBGE"></td>
						</tr>
						<tr>
							<td>Foto:</td>
							<td><input type="file" name="foto"></td>
							<td><input type="text" style="display: none;" name="fotoTemp" readonly="readonly" value="${user.fotoBase64}"/> </td>
							<td><input type="text" style="display: none;" name="contentType" readonly="readonly" value="${user.contentType}"/> </td>
						</tr>
						<tr>
							<td>Curriculo:</td>
							<td><input type="file" name="curriculo" value="curriculo"></td>
							<td><input type="text" style="display: none;" name="fotoTempPDF" readonly="readonly" value="${user.curriculoBase64}"/> </td>
							<td><input type="text" style="display: none;" name="contentTypePDF" readonly="readonly" value="${user.contentTypeCurriculo}"/> </td>
						</tr>
						<tr>
							<td><input type="submit" value="Salvar"></td>
							<td><input type="submit" value="Cancelar"
								onclick="document.getElementById('formUser').action='salvarUsuario?acao=reset'"></td>
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
				<th>Foto</th>
				<th>Curriculo</th>
				<th>Nome</th>
				<th>Telefone</th>
				<th>Editar</th>
				<th>Delete</th>
				
			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>
					<td><c:out value="${user.id}"></c:out></td>

					<c:if test="${user.fotoBase64.isEmpty()==false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id}">
								<img src='<c:out value="${user.tempFotoUser}"/>' alt="Foto"
								title="Foto" width="32px" height="32px">
						</a></td>
					</c:if>
					<c:if test="${user.fotoBase64.isEmpty()==true}">
						<td><img alt="Imagem User" src="resources/img/userpadrao.png"
							width="32px" height="32px" onclick="alert('N�o possui Imagem!')"></td>
					</c:if>

					<c:if test="${user.curriculoBase64.isEmpty()==false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id}"><img
								alt="Curriculo" src="resources/img/pdf.png" width="32px"
								height="32px"></a></td>
					</c:if>
					<c:if test="${user.curriculoBase64.isEmpty()==true}">
						<td><img alt="Imagem User" src="resources/img/sempdf.png" 
							width="32px" height="32px" onclick="alert('N�o possui PDF!')"></td>
					</c:if>
					
					<td><c:out value="${user.nome}"></c:out></td>
					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="20px" height="20px"></a></td>

					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							src="resources/img/telefone.png" alt="Telefones"
							title="Telefones" width="20px" height="20px"></a></td>

					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/excluir.png" alt="Excluir" title="Excluir"
							width="20px" height="20px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert('Informe o login:');
				return false;
			}

			else if (document.getElementById("senha").value == '') {
				alert('Informe a senha:');
				return false;
			}

			else if (document.getElementById("nome").value == '') {
				alert('Informe o nome:');
				return false;
			}

			else if (document.getElementById("telefone").value == '') {
				alert('Informe o telefone:');
				return false;
			}

			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//https://viacep.com.br/
			//https://viacep.com.br/exemplo/jquery/
			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);
						} //end if.
						else {
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							//CEP pesquisado n�o foi encontrado.
							alert("CEP n�o encontrado.");

						}
					});

		}
	</script>
</body>
</html>