package br.com.ases.teste.eselo;

public class CheckPoint {

	private Criterio criterio;
	private Long identificador;
	private Long totalErrors;
	private Long totalWarnings;

	public CheckPoint() {
		this.criterio = new Criterio();
	}
	
	public Long getTotalErrors() {
		return totalErrors;
	}

	public void setTotalErrors(Long totalErrors) {
		this.totalErrors = totalErrors;
	}

	public Long getTotalWarnings() {
		return totalWarnings;
	}

	public void setTotalWarnings(Long totalWarnings) {
		this.totalWarnings = totalWarnings;
	}

	public Criterio getCriterio() {
		return criterio;
	}

	public void setCriterio(Criterio criterio) {
		this.criterio = criterio;
	}

	public Long getIdentificador() {
		return identificador;
	}

	public void setIdentificador(Long identificador) {
		this.identificador = identificador;
	}

}
