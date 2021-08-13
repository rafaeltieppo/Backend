package ctr;

import java.util.ArrayList;

import vo.Peça;
import vo.dao.PeçaDAO;

public class PeçaProcess {

	public static ArrayList<Peça> peças = new ArrayList<>();
	public static PeçaDAO pd = new PeçaDAO();

	public static void testes() {
		
		peças.add(new Peça("11111111111","Polia Regulável AP","R$ 199,00"));
		peças.add(new Peça("22222222222","Comando 49g AP","R$ 640,00"));
		peças.add(new Peça("33333333333","Cabeçote AP 1.8","R$ 1.300,00"));
		peças.add(new Peça("44444444444","Radiador Civic 2008","R$ 699,00"));
		peças.add(new Peça("55555555555","Alternador AP 1.8/2.0","R$ 859,00"));
		peças.add(new Peça("66666666666","2 Coifa Cambio Fusca ","R$ 33,00"));
		peças.add(new Peça("77777777777","Burrinho Mestre Idea","R$ 257,00"));
		peças.add(new Peça("88888888888","Caixa Direção Monza","R$ 455,00"));
		
	}
	
	public static void abrir() {
		peças = pd.abrir();
	}
	
	public static String salvar() {
		if(pd.salvar(peças)) {
			return "<p> Arquivo salvo com sucesso </p>";
		} else {
			return "<p> Erro ao salvar arquivo </p>";
		}
	}

}