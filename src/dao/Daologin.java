package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.SingleConnection;


public class Daologin {

	Connection connection;
	
	
	public Daologin() {
		connection = SingleConnection.getConnetion();
	}
	
	public boolean validarLogin(String login,String senha) throws Exception{
		String sql = "select*from usuario where login= '"+login+"' and senha = '"+senha+"' and senha= '"+senha+"'";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultSet = statement.executeQuery();
		
		if(resultSet.next()) {//Possui usuario
			return true;
		}else {
			return false;//Nao validou usuario
		}
	}
}
