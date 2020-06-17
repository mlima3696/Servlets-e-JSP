<jsp:useBean id="calcula" class="beans.BeansCursoJsp" type="beans.BeansCursoJsp" scope="page"/>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!--  
<c:import var="data" url="https://www.google.com.br"/>
<c:set var="data" scope="page" value="${500*6}"/>

<c:remove var="data"/>
<c:out value="${data}"></c:out>
<c:catch var="erro">
//< int var = 100/0;%>
</c:catch>
<c:if test="${erro!=null}">
${erro.message}
</c:if>
<c:out value="Bem vindo ao JSTL"/>-->

<!--  
<c:set var="numero" value="${500/2 }"/>

<c:choose>

<c:when test="${numero>50}">
<c:out value="${'Maior que 50'}"/>
</c:when>

<c:when test="${numero<50}">
<c:out value="${'Menor que 50'}"/>
</c:when>

<c:otherwise>
<c:out value="${'Não encontrou valor correto'}"/>
</c:otherwise>

</c:choose>
-->

<!--  
<c:set var="numero" value="${100/3}"/>

<c:forEach var="n" begin="1" end="${numero}">
Item : ${n}
<br/>
</c:forEach>
---------
<c:forTokens items="kkkkkkkk-aaaaaaaaaa-zzzzzzzzzz" delims="-" var="nome">
Nome: <c:out value="${nome}"></c:out>
<br/>
</c:forTokens>
-----------
<c:set var="numero" value="${100/3}"/>

<c:url value="/acessoliberado.jsp" var="acesso">
<c:param name="para1" value="111" />
<c:param name="para2" value="112" />
${acesso}
</c:url>
-->


<p/>
<p/>
<p/>
<p/>

	<form action="LoginServlet" method="post">
	Login:
	<input type="text" id="login" name="login">
	<br/>
	Senha:
	<input type="text" id="senha" name="senha">
	<br/>
	<input type="submit" value="Logar" >
	</form>
</body>
</html>