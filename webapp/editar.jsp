<%@page import="ctr.PeçaProcess"%>
<%@page import="vo.Peça"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Alterar ou Excluir Peças</title>
</head>
<body>
	<%
	Peça peça = new Peça();
			peça.setCodigo(request.getParameter("codigo"));
			peça.setPeça(request.getParameter("peça"));
			peça.setPreço(request.getParameter("preço"));
			int indice = PeçaProcess.peças.indexOf(peça);
			String opcao = request.getParameter("opcao");
			String formulario1 = "<form method='GET'>"
			+ "<label>Código:</label><input type='text' name='codigo'>"
			+ "<input type='reset' value='Limpar'><input type='submit' value='Buscar'>" + "</form>";
			if (peça.getCodigo() == null || peça.getCodigo().equals("")) {
		out.print("<p>Digite o codigo da peça e clique em buscar</p>");
		out.print(formulario1);
			} else {
		if (PeçaProcess.peças.contains(peça)) {
			peça = PeçaProcess.peças.get(indice);
			String formulario2 = "<form method='GET'>"
		+ "<label>Código</label><input type='text' name='codigo' value='"	+ peça.getCodigo() + "'>"
		+ "<label>Peça:</label><input type='text' name='peça' value='" + peça.getPeça() + "'>"
		+ "<label>Preço:</label><input type='text' name='preço' value='" + peça.getPreço() + "'>"
		+ "<div><label>Excluir</label><input type='radio' name='opcao' value='excluir'></div>"
		+ "<div><label>Alterar</label><input type='radio' name='opcao' value='alterar'></div>"
		+ "<input type='submit' value='Enviar'>"
		+ "</form>";
			out.print(formulario2);
		} else {
			out.print("<p>Código não encontrado</p>");
			out.print(formulario1);
		}
		
		if(opcao != null){
			switch(opcao){
			case "excluir":
		PeçaProcess.peças.remove(indice);
		PeçaProcess.salvar();
		break;
			case "alterar":
		peça.setPeça(request.getParameter("peça"));
		peça.setPreço(request.getParameter("preço"));
		PeçaProcess.peças.set(indice,peça);
		PeçaProcess.salvar();
		break;
			default:
		break;
			}
			response.sendRedirect("peças.jsp");
		}
			}
	%>
	<a href="peças.jsp">Listar todos</a>
</body>
</html>