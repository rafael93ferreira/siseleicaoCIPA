package br.com.eleicao.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import br.com.eleicao.Candidato;

/**
 * Servlet implementation class ServletControl
 */
@WebServlet("/ServletControl")
public class ServletControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/web-eleicao")
	private DataSource dataSource;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		try {
			con = dataSource.getConnection();
			
			if (request.getParameter("txtNumCandidato") != null) {
			
				int num = Integer.parseInt(request.getParameter("txtNumCandidato"));
				
				String sql = "SELECT * FROM tb_candidatos where numero = " + num + " LIMIT 1";
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery(sql);
				
				Candidato candidato = new Candidato();
				
				candidato.setNome( "NULO" );
				candidato.setFoto( "nulo.jpg" );
				
				while (rs.next()) {
					
					if (rs.getString("nome") == null) {
						candidato.setNome( "NULO" );
						candidato.setFoto( "nulo.jpg" );
					}
					
					candidato.setNome( rs.getString("nome") );
					candidato.setFoto( rs.getString("foto") );
				}
				
				con.close();
				
				String result = candidato.getNome() + "|" + candidato.getFoto();
				response.setContentType("text/plain");
				response.getWriter().write(result);
				
				
			} else if(request.getParameter("txtVoto") != null) {
				
				int num = Integer.parseInt(request.getParameter("txtVoto"));
				
				String sql = "INSERT INTO voto (numero_votado) VALUES (" + num + ")";
				Statement stm = con.createStatement();
				int rs = stm.executeUpdate(sql);
				
				con.close();
				
				String result = "Voto registrado com sucesso!";
				response.setContentType("text/plain");
				response.getWriter().write(result);
				
				
			}
			
			
			doGet(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
