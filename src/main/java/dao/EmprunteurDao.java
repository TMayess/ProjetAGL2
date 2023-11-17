package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Emprunteur;

public class EmprunteurDao {
	public static Emprunteur getEmprunteurById(String idEmprunteur) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Emprunteur emprunteur = null;
        DBManager dbManager = new DBManager();
    

        try {
        	connection = dbManager.getConnection();
            String query = "SELECT * FROM emprunteur WHERE idEmprunteur = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, idEmprunteur);

    
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                emprunteur = new Emprunteur();
                emprunteur.setIdEmprunteur(resultSet.getInt("idEmprunteur"));
                emprunteur.setNom(resultSet.getString("nom"));
                emprunteur.setPrenom(resultSet.getString("prenom"));
                emprunteur.setDateNaissance(resultSet.getDate("dateNaissance"));
                emprunteur.setAdresse(resultSet.getString("adresse"));
                emprunteur.setMobile(resultSet.getString("mobile"));
                emprunteur.setEmail(resultSet.getString("email"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
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

        return emprunteur;
    }
    
    public static List<Emprunteur> getAllEmprunteur() {
    	 List<Emprunteur> emprunteurs = new ArrayList<>();

    	    
         DBManager dbManager = new DBManager();
         Connection connection = null;
         PreparedStatement preparedStatement = null;

         try {
             connection = dbManager.getConnection();
             String query = "SELECT * FROM emprunteur";

             preparedStatement = connection.prepareStatement(query);
             ResultSet result = preparedStatement.executeQuery();

             while (result.next()) {
                 Emprunteur emprunteur = new Emprunteur();
                 emprunteur.setIdEmprunteur(result.getInt("IdEmprunteur"));
                 emprunteur.setNom(result.getString("nom"));
                 emprunteur.setPrenom(result.getString("prenom"));
                 emprunteur.setDateNaissance(result.getDate("DateNaissance"));
                 emprunteur.setAdresse(result.getString("Adresse"));
                 emprunteur.setMobile(result.getString("Mobile"));
                 emprunteur.setEmail(result.getString("Email"));

                 emprunteurs.add(emprunteur);
             }

     
             result.close();
         } catch (SQLException e) {
             e.printStackTrace();
         } catch (ClassNotFoundException e) {
 			e.printStackTrace();
 		} finally {
    
             try {
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
         return emprunteurs;
    }
    
    
    public static List<Emprunteur> searchAllEmprunteurWithID(String searchId){
    	
    	
    	if (searchId != null && !searchId.isEmpty()) {
    		List<Emprunteur> emprunteurs = new ArrayList<>();
            DBManager dbManager = new DBManager();
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                connection = dbManager.getConnection();
                String query = "SELECT * FROM emprunteur WHERE IdEmprunteur LIKE ?";
                
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, searchId + "%"); 

                ResultSet result = preparedStatement.executeQuery();

                while (result.next()) {
                    Emprunteur emprunteur = new Emprunteur();
                    emprunteur.setIdEmprunteur(result.getInt("IdEmprunteur"));
                    emprunteur.setNom(result.getString("nom"));
                    emprunteur.setPrenom(result.getString("prenom"));
                    emprunteur.setDateNaissance(result.getDate("DateNaissance"));
                    emprunteur.setAdresse(result.getString("Adresse"));
                    emprunteur.setMobile(result.getString("Mobile"));
                    emprunteur.setEmail(result.getString("Email"));
                    
                    emprunteurs.add(emprunteur);
                }
                
                result.close();
                return emprunteurs;
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
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
        } 
		return null;

    }
    
    public static Boolean AddEmprunteur(String IdEmprunteur, String Nom, String Prenom, String DateNaissance, String Adresse, String Mobile, String Email) throws DaoException {
        DBManager dbManager = new DBManager();
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = dbManager.getConnection();
            String query = "INSERT INTO emprunteur (IdEmprunteur, Nom, Prenom, DateNaissance, Adresse, Mobile, Email) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, IdEmprunteur);
            preparedStatement.setString(2, Nom);
            preparedStatement.setString(3, Prenom);
            preparedStatement.setString(4, DateNaissance);
            preparedStatement.setString(5, Adresse);
            preparedStatement.setString(6, Mobile);
            preparedStatement.setString(7, Email);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("L'insertion a réussi. " + rowsAffected + " ligne(s) ajoutée(s).");
                return true;
            } else {
                throw new DaoException("L'insertion a échoué. Aucune ligne ajoutée.");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            throw new DaoException(e.getMessage());
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new DaoException(e.getMessage());
            }
        }
    }
    
    public static boolean deleteEmprunteur(String IdEmprunteur) {
    	DBManager dbManager = new DBManager();
        try (Connection connection = dbManager.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM emprunteur WHERE IdEmprunteur=?")) {

            preparedStatement.setString(1, IdEmprunteur);
            preparedStatement.executeUpdate();

            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
}
