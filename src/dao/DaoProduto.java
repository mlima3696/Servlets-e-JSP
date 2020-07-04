package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeansProduto;
import connection.SingleConnection;

public class DaoProduto {

	private Connection connection;
	
	
	public DaoProduto() {
		connection = SingleConnection.getConnetion();;
	}
	
	public void salvar(BeansProduto produto) {
		String sql = "insert into  produtos (nome,quantidade,valor) values(?,?,?)";
		PreparedStatement insert;
		try {
			insert = connection.prepareStatement(sql);
			insert.setString(1, produto.getNome());
			insert.setDouble(2, produto.getQuantidade());
			insert.setDouble(3, produto.getValor());
			
			insert.execute();
			connection.commit();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	}
	
	
	public List<BeansProduto> listar() throws Exception{
		List<BeansProduto> listar = new ArrayList<BeansProduto>();
		String sql = "select*from produtos";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		
		
		while(resultSet.next()){
			BeansProduto beansProduto = new BeansProduto();
			beansProduto.setId(resultSet.getLong("id"));
			beansProduto.setNome(resultSet.getString("nome"));
			beansProduto.setQuantidade(resultSet.getDouble("quantidade"));
			beansProduto.setValor(resultSet.getDouble("valor"));
			
			listar.add(beansProduto);
		}
		return listar;
	}
	
	public void delete(String id) {
		try {
		String sql = "delete from produtos where id = '"+id+"'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.execute();
		
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
	
	public BeansProduto consultar(String id)  throws Exception{
		
		String sql = "select * from produtos where id = '"+id+"'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			BeansProduto beansProduto = new BeansProduto();
			beansProduto.setId(resultSet.getLong("id"));
			beansProduto.setNome(resultSet.getString("nome"));
			beansProduto.setQuantidade(resultSet.getDouble("quantidade"));
			beansProduto.setValor(resultSet.getDouble("valor"));
			
			return beansProduto;
		}
		
		return null;
		
	}
	
	public void atualizar(BeansProduto produto) {
		try {
			String sql = "update produto set nome = ?, quantidade = ?, valor = ?  where id = "
					+ produto.getId();

			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			preparedStatement.setString(1, produto.getNome());
			preparedStatement.setDouble(2, produto.getQuantidade());
			preparedStatement.setDouble(3, produto.getValor());
			preparedStatement.executeUpdate();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}

	

	public boolean validarNome(String nome) throws Exception {
		
		String sql = "select count(1) as qtd from produtos where nome = '"+nome+"'";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			return resultSet.getInt("qtd")<=0;
		}
		
		return false;
	}
}
