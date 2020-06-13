<jsp:useBean id="calcula" class="beans.BeansCursoJsp" type="beans.BeansCursoJsp" scope="page"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula"/>
	<h3>Cabecalho</h3>
	<jsp:getProperty property="nome" name="calcula"/>
	<br/>
	<jsp:getProperty property="ano" name="calcula"/>
	<br/>
	<jsp:getProperty property="sexo" name="calcula"/>
</body>
</html>