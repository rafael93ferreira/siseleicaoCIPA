package br.com.eleicao;


public class Candidato implements Logica{
	
	private String nome, foto;
	private int numero;
	
		
	
	public String getCandidatoById(int id)
	{
		return;
	}
	
	public void listarCandidatos()
	{
		
	}
	
	// Getters and Setters
	public void setNome(String nome)
	{
		this.nome = nome;
	}
	
	public String getNome()
	{
		return this.nome;
	}
	
	public void setFoto(String foto)
	{
		this.foto = foto;
	}
	
	public String getFoto()
	{
		return this.foto;
	}
	
	public void setNumero(int numero)
	{
		this.numero = numero;
	}
	
	public int getNumero()
	{
		return this.numero;
	}
}
