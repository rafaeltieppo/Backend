<%@page import="ctr.PeçaProcess"%>
<%@page import="vo.Peça"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Cadastro de Peças</title>
</head>
<body>
	<form method="POST">
		<label>Código:</label><input type="text" name="codigo" required>
		<label>Peça:</label><input type="text" name="peça" required>
		<label>Preço:</label><input type="text" name="preço" required>
		<input type="reset" value="Limpar"><input type="submit" value="Cadastrar">
	</form>
	<%
	Peça peça = new Peça();
		peça.setCodigo(request.getParameter("codigo"));
		peça.setPeça(request.getParameter("peça"));
		peça.setPreço(request.getParameter("preço"));	
		if(peça.getCodigo() == null || peça.getCodigo().equals("")){
			out.print("<p>Aguardando dados</p>");
		}else{
			PeçaProcess.peças.add(peça);
			out.print(PeçaProcess.salvar());
		}
	%>
	<a href="peças.jsp">Listar Todos</a>
</body>
</html>