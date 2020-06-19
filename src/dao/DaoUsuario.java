package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeansCursoJsp;
import connection.SingleConnection;

public class DaoUsuario {

	private Connection connection;
	
	public DaoUsuario() {
		connection = SingleConnection.getConnetion();
	}
	
	public void salvar(BeansCursoJsp usuario) {
		
		
		try{
		String sql = "insert into usuario(login,senha) values(?, ?)";
		PreparedStatement insert = connection.prepareStatement(sql);
		insert.setString(1, usuario.getLogin());
		insert.setString(2, usuario.getSenha());
		insert.execute();
		connection.commit();
		
		}catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	public List<BeansCursoJsp> listar() throws Exception{
		List<BeansCursoJsp> listar = new ArrayList<BeansCursoJsp>();
		String sql = "select*from usuario";
		
		PreparedStatement  statement = connection.prepareStatement(sql);
		ResultSet  resultSet = statement.executeQuery();
		
		while(resultSet.next()) {
			
			BeansCursoJsp beansCursoJsp = new BeansCursoJsp();
			beansCursoJsp.setLogin(resultSet.getString("login"));
			beansCursoJsp.setSenha(resultSet.getString("senha"));
			
			listar.add(beansCursoJsp);
		}
		
		return listar;
	}
}
