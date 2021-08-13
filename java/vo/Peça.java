package vo;

import java.util.Objects;

public class Peça {
	
	//Atributos
	private String codigo;
	private String peça;
	private String preço;
	
	//Construtores
	public Peça() {
	}

	public Peça(String codigo, String peça, String preço) {
		this.codigo = codigo;
		this.peça = peça;
		this.preço = preço;
	}
	
	public Peça(String[] csv) {
		this.codigo = csv[0];
		this.peça = csv[1];
		this.preço = csv[2];
	}

	//Getters && Setters
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getPeça() {
		return peça;
	}

	public void setPeça(String peça) {
		this.peça = peça;
	}

	public String getPreço() {
		return preço;
	}

	public void setPreço(String preço) {
		this.preço = preço;
	}

	//Chave Código
	@Override
	public int hashCode() {
		return Objects.hash(codigo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Peça other = (Peça) obj;
		return Objects.equals(codigo, other.codigo);
	}

		//toString, toCSV, toHTML
	@Override
	public String toString() {
		return codigo + "\t" + peça + "\t" + preço + "\n";
	}
	
	public String toCSV() {
		return codigo + ";" + peça + ";" + preço + "\r\n";
	}
	
	public String toHTML() {
		return "<tr><td>"+ codigo + "</td><td>" + peça + "</td><td>" + preço + "</td></tr>";
	}
	
}