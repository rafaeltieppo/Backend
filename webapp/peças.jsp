<%@page import="vo.Peça"%>
<%@page import="ctr.PeçaProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style2.css">
<title>Lista de Peças</title>
</head>
<body>
	<div>
		<a href="cadastro.jsp"><button>Cadastrar Peça</button></a>
	    <a href="editar.jsp"><button>Buscar Peça </button></a>
	</div>
	<table>
		<tr>
			<th>Código</th>
			<th>Peça</th>
			<th>Preço</th>
		</tr>
		<% 
		PeçaProcess.testes();
				out.print("<table style='border: solid 1px'>");
				for (Peça p : PeçaProcess.peças) {
			out.print(p.toHTML());
				}
				out.print("</table>");
				out.print(PeçaProcess.salvar());
		%>
	</table>
</body>
</html>