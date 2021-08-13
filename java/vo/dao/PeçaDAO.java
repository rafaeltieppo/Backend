package vo.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import vo.Peça;

public class PeçaDAO {

	private BufferedReader br;
	private BufferedWriter bw;
	private String arquivo = "c:\\dbs\\peças.csv";
	private ArrayList<Peça> peças;
	private Peça peça;
	
	public boolean salvar(ArrayList<Peça> peças) {
		try {
			bw = new BufferedWriter(new FileWriter(arquivo,false));
			for(Peça c: peças) {
				bw.write(c.toCSV());
			}
			bw.close();
			return true;
		} catch (IOException e) {
			System.out.println("Erro ao gravar arquivo "+e);
			return false;
		}
	}
	
	public ArrayList<Peça> abrir(){
		peças = new ArrayList<>();
		try {
			br = new BufferedReader(new FileReader(arquivo));
			String linha = null;
			while((linha = br.readLine()) != null) {
				peça = new Peça(linha.split(";"));
				peças.add(peça);
			}
			br.close();
		} catch (FileNotFoundException e) {
			System.out.println("Arquivo n�o encontrado "+e);
		} catch (IOException e) {
			System.out.println("Erro ao ler arquivo "+e);
		}
		return peças;
	}
	
}