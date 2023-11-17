package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
	
	public static boolean login(String username, String password) {
		DBManager dbManager = new DBManager();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
            connection = dbManager.getConnection();
            String query = "SELECT IdUtilisateur FROM utilisateur WHERE Nom=? AND MotDePasse=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                return true;
            } 
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
	}
}
